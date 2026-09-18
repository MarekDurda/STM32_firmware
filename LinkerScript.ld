MEMORY {
    flash (RX) : ORIGIN = 0x08000000, LENGTH = 512K
    sram (! RX) : ORIGIN = 0x20000000, LENGTH = 128K
}
SECTIONS {
    .vectors : { *(.vectors)} > flash
    .text    : { *(.text)}    > flash
    .rodata  : { *(.rodata)}  > flash
    .bss     : { *(.bss)}     > sram
    } 