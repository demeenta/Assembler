; SUMASVARIAS.asm
; Contiene una suma que excede los bits de un registro, en este caso ax.
; (podría usarse en el caso del registro ah también).

mov ax, 15
add ax, 9 ;suma registro más número; AF=1 acarreo auxiliar

mov ax, 21
mov bx, 8
add ax, bx ;suma dos registros; AF=0 sin acarreo auxiliar

mov ax, 15
mov bx, 9
adc ax, bx ;suma dos registros; AF=1 acarreo auxiliar

mov ax, 21
mov bx, 8
adc ax, bx ;suma dos registros; AF=0 sin acarreo auxiliar

mov ax, 15
mov bx, 9
cmc ;acarreo ; CF=1
add ax, bx ;acarreo auxiliar AF=1

mov ax, 21
mov bx, 8
cmc ;acarreo ; CF=1
add ax, bx ;acarreo auxiliar AF=1

mov ax, 99
mov bx, 75
cmc ;CF=1
adc ax, bx ;ax+bx+CF

mov ax, -10
mov bx, 10
add ax, bx ; Suma resultado = 0, se activa bandera ZF=1

;RESULTADO DE SUMA MAYOR A 16 BITS

mov ax, 65535 ; = 0FFFFh, mayor numero que se puede representar
mov bx, 1 ; = le agregamos uno

add ax, bx ; la suma es igual a cero y CF=1, por lo que CF representa a los 65536 del 2^16
; y el resultado real es 65536+AX

;Suma de 32 bits, usando numeros binarios y la bandera CF y el comando ADC
; 00000000000000001111111111111111
; +00000000000000001000000000000000
; =00000000000000010111111111111111

mov ax, 1111111111111111b
mov bx, 0000000000000001b
mov cx, 0000000000000000b
mov dx, 0000000000000000b

add ax, bx
adc cx, dx ;suma de las primeros 16 bits de los sumandos, más el acarreo si es que hay en CF
;resultado es CX con AX para completar el resultado en 32 bits.

;en otros casos para sumar o no acarreo se usa el comando cmc para invertir el valor de CF

mov ax, 1111111111111111b
mov bx, 0000000000000001b
mov cx, 0000000000000000b
mov dx, 0000000000000000b

add ax, bx
cmc ;en el mismo caso con CMC se cambia CF=0, y no se cuenta el acarreo
adc cx, dx ; CX+DX+CF ; CF=0

;suma con acarreo

mov ax, 123
mov bx, 5
cmc ; CF=1
add ax, bx ; AX+BX+CF
