local ffi = require("ffi")

local wrapper = ffi.load('unpack')

ffi.cdef[[
void unpack(char *packed, char *unpacked, int sz);
]]

local unpack = {}

function unpack.unpack(packed, len)
   local unpacked = torch.ByteTensor(packed:size()[1]*8)
   wrapper.unpack(torch.data(packed), torch.data(unpacked), len)

   return unpacked
end

function unpack.unpackFile(filepath, len)
   local packed = torch.ByteTensor(len)
   local unpacked = torch.ByteTensor(len*8)

   fid = torch.DiskFile(filepath, 'r')
   fid:binary()
   fid:readByte(packed:storage())
   fid:close()

   wrapper.unpack(torch.data(packed), torch.data(unpacked), len);

   return unpacked
end

return unpack
