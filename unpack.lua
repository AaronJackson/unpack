local ffi = require("ffi")

local wrapper = ffi.load('unpack')

ffi.cdef[[
void unpack(char *packed, char *unpacked, int w, int h, int z);
]]

function unpack(packed, unpacked, w, h, z)
   wrapper.unpack(torch.data(packed), torch.data(unpacked), 192, 192, 192)
end

return unpack


