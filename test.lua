local unpack = require 'unpack'

local packed = torch.ByteTensor({255,255,255,255})
local unpacked = unpack.unpack(packed, 4)

assert(unpacked:sum() == 32)
