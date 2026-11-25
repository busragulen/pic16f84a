; asagidaki kosullari iceren bir program yaz: (16f84a)
; i) equ komutu ile a ve b portlarini ve yonlendirme portlarini tanimla
; ii) define ile b portunun 1 cikisini led 1 b portunun 0 cikisini motor 1 olarak isimlendir,
; status registerini 5. bitini bank sec olarak isimlendir.
; iii) a ve b portlarini cikis tanimla
; iv) a ve b portlarindan cesitli veriler gonder

    list P=16F84A
porta equ h'05'
portb equ h'06'
trisa equ h'85'
trisb equ h'86'
status equ h'03'
#define motor1 portb,0
#define led1 portb,1
#define banksec status,5
    org 0
    goto init
init
    bsf banksec
    clrf trisa
    clrf trisb
    bcf banksec
    clrf porta
    clrf portb
ana
    bsf led1
    movlw h'0F'
    movwf porta
    movlw h'FF'
    movwf portb
    goto ana
 end 