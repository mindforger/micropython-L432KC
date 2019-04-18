/*
    GNU linker script for STM32L432KC
*/

/* Specify the memory areas */
MEMORY
{
    /*FLASH (rx)      : ORIGIN = 0x08000000, LENGTH = 256K*/
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 230K
    FLASH_FS (r)    : ORIGIN = 0x08039800, LENGTH = 26K
    RAM (xrw)       : ORIGIN = 0x20000000, LENGTH = 62K
    FS_CACHE (xrw)  : ORIGIN = 0x2000f800, LENGTH = 2K
}

/* produce a link error if there is not this amount of RAM for these sections */
_minimum_stack_size = 2K;
_minimum_heap_size = 16K;

/* Define the top end of the stack.  The stack is full descending so begins just
   above last byte of RAM.  Note that EABI requires the stack to be 8-byte
   aligned for a call. */
_estack = ORIGIN(RAM) + LENGTH(RAM);

/* RAM extents for the garbage collector */
_ram_start = ORIGIN(RAM);
_ram_end = ORIGIN(RAM) + LENGTH(RAM);
_heap_start = _ebss; /* heap starts just after statically allocated memory */
_heap_end = 0x2000e000; /* room for a 6k stack */

/* RAM and flash for the internal filesystem */
_ram_fs_cache_start = ORIGIN(FS_CACHE);
_ram_fs_cache_end = ORIGIN(FS_CACHE) + LENGTH(FS_CACHE);
_flash_fs_start = ORIGIN(FLASH_FS);
_flash_fs_end   = ORIGIN(FLASH_FS) + LENGTH(FLASH_FS);
