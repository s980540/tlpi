#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>

#include <gnu/libc-version.h>

#include "types.h"
#include "crc32.h"

int main(int argc, char *argv[])
{
	fprintf(stderr,"%s\n",gnu_get_libc_version());
	fprintf(stderr,"%s\n",gnu_get_libc_release());

	printf("Hello World\n");

	char c[32];
	memset(c, 0, sizeof(c));
	u32 crc;
	crc = crc32(c, sizeof(c));
	printf("crc:0x%08X\n", crc);

	return 0;
}

