; Butona basılı ise D2, D3, D4 yanacak, basılı değil ise D0, D1 aynı anda yanacak deiğerleri sönecek
; butonun üstünde +5V'a giden 10k ohm direnç var altında gnd var, buton ra1'e bağlı. buton basılıyken ra1=0 olur.
; d0 ra2, d1 ra3, d2 rb1, d3 rb2, d4 rb3 bağlı PIC16F84A portlari 

LIST    P=16F84A
PORTB EQU 0x06
TRISB EQU 0x86
PORTA EQU 0x05
TRISA EQU 0x85
STATUS EQU 0x03
    ORG     0x00
    BSF STATUS,5
    MOVLW b'00000010'
    MOVWF TRISA
    CLRF TRISB
    BCF STATUS,5

    CLRF PORTA
    CLRF PORTB

DONGU
    BTFSC PORTA,1
    GOTO BASILI_DEGIL
    CLRF PORTA
    MOVLW b'00001110'
    MOVWF PORTB
    GOTO DONGU
BASILI_DEGIL
    CLRF PORTB
    MOVLW b'00001100'
    MOVWF PORTA
    GOTO DONGU
    END
