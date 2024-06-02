#ifndef CRC32_H
#define CRC32_H

#include "types.h"

#define CRC_INIT    (0xffffffffL)
#define XO_ROT      (0xffffffffL)

u32 crc32(const void *buf, int len);

#endif
