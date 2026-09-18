void start()
{
    volatile unsigned int* RCC_AHB1ENR = (unsigned int*)(0x40023800 + 0x30);
    volatile unsigned int* GPIOC       = (unsigned int*)0x40020800 ;
     
    *RCC_AHB1ENR |= (1U << 2); //enable gpioc clock
    *GPIOC |= (1U << 26);             //Output mode
    while (1)
    {
        static int inc = 0;
        if(inc >= 1e6){
            *(GPIOC + 5) ^= 1U << 13;
            inc = 0;
        }
        else    
            inc++;
    }
    
}


int STACK[256];
const void *vectors[] __attribute__ ((section (".vectors"))) = {STACK + sizeof(STACK)/sizeof(*STACK), start};