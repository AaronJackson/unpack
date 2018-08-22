#include <stdio.h>

void unpack(char *packed, char *unpacked, int w, int h, int z) {

  register int i, o;
  int sz = w * h * z / 8;

  for (i=0; i < sz; ++i) {
    o = i*8;
    unpacked[o+0] = (packed[i] & 1)>0;
    unpacked[o+1] = (packed[i] & 2)>0;
    unpacked[o+2] = (packed[i] & 4)>0;
    unpacked[o+3] = (packed[i] & 8)>0;
    unpacked[o+4] = (packed[i] & 16)>0;
    unpacked[o+5] = (packed[i] & 32)>0;
    unpacked[o+6] = (packed[i] & 64)>0;
    unpacked[o+7] = (packed[i] & 128)>0;
  }
}
