local unpack = require 'unpack'

local packed = torch.ByteTensor({255,255,255,255})
local unpacked = torch.ByteTensor(32)
unpack.unpack(packed, unpacked, 4)

assert(unpacked:sum() == 32)


local packed = torch.ByteTensor(128000):fill(255)
local unpacked = torch.ByteTensor(128000*8)
unpack.unpack(packed, unpacked, 128000)

assert(unpacked:sum() == 1024000)
