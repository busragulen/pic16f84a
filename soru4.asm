; PORTB'ye bağlı 8 adet ledi farklı durumlar için yakıp söndüren bir uygulama geliştir
; d0 rb0 .... d7 rb7 şeklinde gidecek bağlantılar. 

    list p=16f84a ; islemciyi tanıt
    include "p16f84a.inc" ; equ yazmamı engelledi, tum ozel registerlerin adresleri bunun icinde var
    org 0 ; algo burda baslar
    clrf PORTB ; PORTB 0 tanimla
    bsf STATUS,5 ; bank degistir
    clrf TRISB ; TRISB 0 tanimla
    bcf STATUS,5 ;bank'a geri don
loop 
    movlw 0xFF ; tum ledleri yak
    movwf PORTB 
    clrf PORTB ; tum ledleri sondur (0 tanimla)
    movlw 0X0F ; sagdaki 4 ledi yak (0000 1111)
    movwf PORTB
    movlw 0xF0 ; soldaki 4 ledi yak (1111 0000)
    movwf PORTB
    goto loop ; basa don 
    end
