local ffi = require("ffi")

local wrapper = ffi.load('unpack/libunpack.so')

ffi.cdef[[
void unpack(char *packed, char *unpacked, int sz);
]]

local unpack = {}

function unpack.unpack(packed, unpacked, len)
   wrapper.unpack(torch.data(packed), torch.data(unpacked), len)
end

function unpack.unpackFile(filepath, unpacked, len)
   local packed = torch.ByteTensor(len)

   fid = torch.DiskFile(filepath, 'r')
   fid:binary()
   fid:readByte(packed:storage())
   fid:close()

   wrapper.unpack(torch.data(packed), torch.data(unpacked), len);

end

return unpack
