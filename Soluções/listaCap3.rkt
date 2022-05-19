;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname listaCap3-AndreiPochmannKoenich-B) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;----------------------------------------------------------------------------------------------------EXERCÍCIO 01--------------------------------------------------------------------------------------------------------------

;; calcula_hipotenusa : Número Número -> Número

;; Objetivo: esta função recebe o comprimento dos dois catetos de um triângulo retângulo e retorna o valor do comprimento da sua hipotenusa.

;; Exemplos: (calcula_hipotenusa 3 4) = 5
;;           (calcula_hipotenusa 6 8) = 10
;;           (calcula_hipotenusa 12 16) = 20

(define (calcula_hipotenusa b c)
  (sqrt (+ (expt b 2)(expt c 2))))

;; Testes:
(check-expect (calcula_hipotenusa 3 4) 5)
(check-expect (calcula_hipotenusa 6 8) 10)
(check-expect (calcula_hipotenusa 12 16) 20)






;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02--------------------------------------------------------------------------------------------------------------

;; CÁLCULO DO SALÁRIO LÍQUIDO ==========================================================================================================================================================================================

;; csl : Número Número Número -> Número

;; Objetivo: dados a quantidade de horas trabalhadas em uma empresa, o valor em reais pago pela hora e a porcentagem referente ao imposto cobrado dos trabalhadores, retorna o valor em reais do salário líquido a ser recebido.

;; Exemplos: (csl 110 15.50 11) = 1517.45
;;           (csl 160 18.75 13) = 2610
;;           (csl 200 20 15) = 3400

(define (csl hora valor imposto)
  (*(csb hora valor)(- 1 (/ imposto 100))))

;; Testes:
(check-expect (csl 110 15.50 11) 1517.45)
(check-expect (csl 160 18.75 13) 2610)
(check-expect (csl 200 20 15) 3400)

;; CÁLCULO DO SALÁRIO BRUTO =============================================================================================================================================================================================

;; csb : Número Número -> Número

;; Objetivo: esta função auxiliar recebe a quantidade de horas trabalhadas em uma empresa e o valor em reais pago pela hora, retornando o valor em reais do salário bruto.

;; Exemplos: (csb 100 15) = 1500
;;           (csb 160 18.75) = 3000
;;           (csb 210 19) = 3990

(define (csb hora valor)
  (* hora valor))

;; Testes:
(check-expect (csb 100 15) 1500)
(check-expect (csb 160 18.75) 3000)
(check-expect (csb 210 19) 3990)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 03--------------------------------------------------------------------------------------------------------------

;; VALOR FINAL ==========================================================================================================================================================================================================

;; valor-final: Número Número Número Número -> Número

;; Objetivo: dados o custo do bem (em porcentagem), o valor de lucro (em porcentagem), a quantidade de bens e o desconto (em porcentagem) a ser oferecido, retorna o valor final que será cobrado do cliente.

;; Exemplos: (valor-final 8.40 33 12 15) = 113.9544
;;           (valor-final 8.40 33 12 20) = 107.2512
;;           (valor-final 8.40 33 12 25) = 100.548 

(define (valor-final custo-bem valor-lucro quantidade desconto)
  (* (- 1 (/ desconto 100)) (valor-a-ser-pago custo-bem valor-lucro quantidade)))
  
;; Testes:
(check-expect (valor-final 8.40 33 12 15) 113.9544)
(check-expect (valor-final 8.40 33 12 20) 107.2512)
(check-expect (valor-final 8.40 33 12 25) 100.548)

;; Se existem 12 unidades de um bem na loja e esse artigo possui custo de R$ 8,40, então o custo total dos 12 bens é de R$ 100,80.
;; Considerando que o desconto assuma somente valores múltiplos de 5, o maior desconto possível de ser oferecido (em uma venda de 12 unidades de um artigo com R$ 8,40 de custo e 33% de lucro) é de 20%.
;; Acima desse valor, o vendedor terá prejuízo, conforme demonstrado nos testes.

;; VALOR A SER PAGO ======================================================================================================================================================================================================

;; valor-a-ser-pago: Número Número Número -> Número

;; Objetivo: esta função auxiliar recebe o custo do bem, o valor de lucro e a quantidade de bens a ser adquirida, e retorna o valor a ser pago pelo cliente.

;; Exemplos: (valor-a-ser-pago 170 10 2) = 374
;;           (valor-a-ser-pago 180 13 3) = 610.20
;;           (valor-a-ser-pago 190 17 4) = 889.20

(define (valor-a-ser-pago custo-bem valor-lucro quantidade)
  (* (valor-unitario custo-bem valor-lucro) quantidade))

;; Testes:
(check-expect (valor-a-ser-pago 170 10 2) 374)
(check-expect (valor-a-ser-pago 180 13 3) 610.20)
(check-expect (valor-a-ser-pago 190 17 4) 889.20)

;; VALOR UNITÁRIO =========================================================================================================================================================================================================

;; valor-unitario: Número Número -> Número

;; Objetivo: esta função auxiliar recebe o custo do bem e o valor de lucro, e retorna o valor unitário do produto a ser adquirido pelo cliente.

;; Exemplos: (valor-unitario 150 10) = 165
;;           (valor-unitario 200 13) = 226
;;           (valor-unitario 250 17) = 292.50

(define (valor-unitario custo-bem valor-lucro)
  (+ (* (/ valor-lucro 100) custo-bem) custo-bem))

;; Testes:
(check-expect (valor-unitario 150 10) 165)
(check-expect (valor-unitario 200 13) 226)
(check-expect (valor-unitario 250 17) 292.50)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 04--------------------------------------------------------------------------------------------------------------

;; CÁLCULO DA VELOCIDADE MÉDIA ============================================================================================================================================================================================

;; cvm: Número Número Número Número -> Número

;; Objetivo: dados os valores em quilômetros da posição inicial e final de um corpo, além dos valores em horas do tempo inicial e final do deslocamento, retorna o valor da velocidade média em quilômetros por hora.

;; Exemplos: (cvm 300 100 9 5) = 50
;;           (cvm 500 180 10 8) = 160
;;           (cvm 655 210 18 10) = 55.625

(define (cvm sf si tf ti)
  (/ (deslocamento sf si)(tempo-decorrido tf ti)))

;; Testes:
(check-expect (cvm 300 100 9 5) 50)
(check-expect (cvm 500 180 10 8) 160)
(check-expect (cvm 655 210 18 10) 55.625)

;; DESLOCAMENTO ============================================================================================================================================================================================================

;; deslocamento: Número Número -> Número

;; Objetivo: esta função auxiliar recebe os valores em quilômetros da posição inicial e final de um corpo, e retorna o seu deslocamento.

;; Exemplos: (deslocamento 200 100) = 100
;;           (deslocamento 245 135) = 110
;;           (deslocamento 320 200) = 120

(define (deslocamento sf si)
  (- sf si))

;; Testes:
(check-expect (deslocamento 200 100) 100)
(check-expect (deslocamento 245 135) 110)
(check-expect (deslocamento 320 200) 120)

;; TEMPO DECORRIDO =========================================================================================================================================================================================================

;; deslocamento: Número Número -> Número

;; Objetivo: esta função auxiliar recebe os valores em horas do tempo inicial e final do deslocamento, e retorna o tempo total decorrido durante o deslocamento.

;; Exemplos: (tempo-decorrido 15 8) = 7
;;           (tempo-decorrido 20 12) = 8
;;           (tempo-decorrido 48 39) = 9

(define (tempo-decorrido tf ti)
  (- tf ti))

;; Testes:
(check-expect (tempo-decorrido 15 8) 7)
(check-expect (tempo-decorrido 20 12) 8)
(check-expect (tempo-decorrido 48 39) 9)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05--------------------------------------------------------------------------------------------------------------

;; CÁLCULO DA POSIÇÃO FINAL ================================================================================================================================================================================================

;; cpf: Número Número Número Número -> Número

;; Objetivo: dados o valor em quilômetros por hora da velocidade média do corpo, o valor em quilômetros da posição inicial e os valores em horas do tempos inicial e final do deslocamento, retorna o valor da posição final. 

;; Exemplos: (cpf 30 300 15 8) = 510
;;           (cpf 20 200 7 2) = 300
;;           (cpf 15 175 6 1) = 250

(define (cpf velocidade-media posicao-inicial tempo-final tempo-inicial)
  (+ posicao-inicial (* velocidade-media (tempo-transcorrido tempo-final tempo-inicial))))

 ;; Testes:
(check-expect (cpf 30 300 15 8) 510)
(check-expect (cpf 20 200 7 2) 300)
(check-expect (cpf 15 175 6 1) 250)

;; TEMPO TRANSCORRIDO =========================================================================================================================================================================================================

;; tempo-transcorrido: Número Número -> Número

;; Objetivo: esta função auxiliar recebe os valores em horas do tempo inicial e final do deslocamento, e retorna o tempo total transcorrido durante o deslocamento.

;; Exemplos: (tempo-transcorrido 30 8) = 22
;;           (tempo-transcorrido 40 14) = 26
;;           (tempo-transcorrido 72 38) = 34

(define (tempo-transcorrido tempo-final tempo-inicial)
  (- tempo-final tempo-inicial))

;; Testes:
(check-expect (tempo-transcorrido 30 8) 22)
(check-expect (tempo-transcorrido 40 14) 26)
(check-expect (tempo-transcorrido 72 38) 34)



  










