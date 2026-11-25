; PIC 16F84A‘nın A portuna bir LED bağlayarak bu led’in periyodik olarak yanıp sönmesini sağlayan Program

    list p=16f84a
portb equ 0x06
trisb equ 0x86
porta equ 0x05
trisa equ 0x85
status equ 0x03
timer equ 0x10

#define led porta,0
#define rp0 status,5

    org 0
    goto begin
begin
    bsf status,5
    clrf trisa
    clrf trisb
    bcf status,5
    clrf porta
    clrf portb
main 
    bsf led
    call cycle 
    bcf led
    call cycle 
    goto main
cycle
    movlw h'FF'
    movwf portb
loop
    movwf timer
loop2
    decfsz timer,1
    goto loop2
    decfsz portb,1
    goto loop
    return
    end