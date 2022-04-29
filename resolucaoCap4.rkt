;;----------------------------------------------------------------------------------------------------EXERCÍCIO 01---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; SELECIONA-COR ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; seleciona-cor: Número -> String

;; Objetivo: dado um número, esta função retorna a string "orange" caso o número seja menor que 50, ou a string "red" caso o número seja maior que 50.

;; Exemplos: (seleciona-cor 49) = "orange"
;;           (seleciona-cor 50) = "red"
;;           (seleciona-cor 51) = "red"

(define (seleciona-cor numero)
  (cond
    [(< numero 50) "orange"]
    [(>= numero 50) "red"]))

;; Testes:
(check-expect (seleciona-cor 49) "orange")
(check-expect (seleciona-cor 50) "red")
(check-expect (seleciona-cor 51) "red")

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; NUMERO-RAIZES ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; numero-raizes: Número Número Número ValorBooleano -> String

;; Objetivo: dados os três coeficientes de uma equação do segundo grau, esta função retorna uma string informando quantas raízes essa equação
;; possui, sendo que o idioma da string é definido levando em consideração o valor lógico fornecido pelo usuário.

;; Exemplos: (numero-raizes 2 8 -24 #true) = "duas"
;;           (numero-raizes 9 -12 4 #false) = "one"
;;           (numero-raizes 5 3 5 #true) = "zero"

(define (numero-raizes a b c valorbooleano)
  (cond 
    [(and valorbooleano (> (discriminante a b c) 0)) "duas"]
    [(and valorbooleano (= (discriminante a b c) 0)) "uma"]
    [(and (not valorbooleano) (> (discriminante a b c) 0)) "two"]
    [(and (not valorbooleano) (= (discriminante a b c) 0)) "one"]
    [else "zero"])) 

;; Testes:
(check-expect (numero-raizes 2 8 -24 #true) "duas")
(check-expect (numero-raizes 9 -12 4 #false) "one")
(check-expect (numero-raizes 5 3 5 #true) "zero")


;; DISCRIMINANTE =========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; discriminante: Número Número Número -> Número

;; Objetivo: esta função auxiliar calcula o valor do discriminante de uma equação do segundo grau, com base nos seus coeficientes a, b e c.

;; Exemplos: (discriminante 2 8 -24) = 256
;;           (discriminante 9 -12 4) = 0
;;           (discriminante 5 3 5) = -91

(define (discriminante a b c)
  (-(* b b)(* 4 a c)))

;; Testes:
(check-expect (discriminante 2 8 -24) 256)
(check-expect (discriminante 9 -12 4) 0)
(check-expect (discriminante 5 3 5) -91)


;;----------------------------------------------------------------------------------------------------EXERCÍCIO 03-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; CALCULA-PROPORCAO ==================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; calcula-proporcao: Número Número -> Número

;; Objetivo: dados dois números, esta função calcula a proporção percentual entre eles, na ordem em que são fornecidos.
;; Caso a função receba o número zero como segundo parâmetro, a função retorna o número -1.

;; Exemplos: (calcula-proporcao 30 60) = 50
;;           (calcula-proporcao 40 60) = 67
;;           (calcula-proporcao 50 0) = -1

(define (calcula-proporcao x y)
  (round (* (calcula-razao x y) 100)))

;; Testes:
(check-expect (calcula-proporcao 30 60) 50)
(check-expect (calcula-proporcao 40 60) 67)
(check-expect (calcula-proporcao 50 0) -1)


;; CALCULA-RAZAO =================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; calcula-razao: Número Número -> Número

;; Objetivo: esta função auxiliar calcula a razão entre dois números, na ordem em que são fornecidos.
;; Caso a função receba o número zero como segundo parâmetro, a função retorna o número -0.01.

;; Exemplos: (calcula-razao 111 37) = 3
;;           (calcula-razao 78 6) = 13
;;           (calcula-razao 56 7) = 8

(define (calcula-razao x y)
  [cond
    [(= y 0) -0.01]
    [else (/ x y)]])
  
;; Testes:
(check-expect (calcula-razao 111 37) 3)
(check-expect (calcula-razao 78 6) 13)
(check-expect (calcula-razao 56 7) 8)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 04-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; DESENHA-BARRA =============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-barra: Número -> Imagem

;; Objetivo: esta função recebe um número fornecido pelo usuário e transforma esse número em um texto a ser mostrado dentro de um retângulo. O número fornecido também
;; é utilizado para definir a medida da base e a cor do retângulo a ser mostrado, com base na função do exercício 01.

;; Exemplos:
;; (desenha-barra 50) = .
;; (desenha-barra 49) = .
;; (desenha-barra 30) = .

(define (desenha-barra n)
  (overlay (text (number->string n) 15 "black")
           (rectangle n 30 "solid" (seleciona-cor n)))) 

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; VISUALIZA-RESULTADOS =====================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; visualiza-resultados: String String Número Número -> Imagem

;; Objetivo: dados dois nomes de grupos, o número de membros do primeiro grupo e o número de membros do segundo grupo, esta função gera um diagrama de barras correspondendo a 100%
;; da amostra, dividida em duas partes: uma vermelha mostrando a porcentagem do grupo com maior número de elementos, e uma laranja, mostrando a porcentagem do grupo com menor número
;; de elementos. Abaixo dessa barra, a função exibe o tamanho da amostra.

;; Exemplos: (visualiza-resultados "A" "A" 170 150) = .

;;           (visualiza-resultados "A" "B" 170 0)   = .

;;           (visualiza-resultados "A" "B" 300 600) = .

;;           (visualiza-resultados "A" "B" 500 400) = .

(define (visualiza-resultados nome1 nome2 quantidade1 quantidade2) 
  [cond
    [(or(or(zero? quantidade1)(zero? quantidade2))(string=? nome1 nome2))
     (above(overlay (text "100" 15 "black")(rectangle 100 30 "solid" "red"))(beside(text "Tamanho da amostra: " 15 "black")(text (number->string (tamanho-amostra quantidade1 quantidade2)) 15 "black")))]
    [(> quantidade1 quantidade2)
     (above(beside (overlay (text (number->string (round(percentual-primeiro-grupo quantidade1 quantidade2))) 15 "black")(rectangle (round(percentual-primeiro-grupo quantidade1 quantidade2)) 30 "solid" "red"))(overlay (text (number->string (round(percentual-segundo-grupo quantidade1 quantidade2))) 15 "black")(rectangle (round(percentual-segundo-grupo quantidade1 quantidade2)) 30 "solid" "orange")))(beside(text "Tamanho da amostra: " 15 "black")(text (number->string (tamanho-amostra quantidade1 quantidade2)) 15 "black")))]
    [(<= quantidade1 quantidade2)  
     (above(beside (overlay (text (number->string (round(percentual-primeiro-grupo quantidade1 quantidade2))) 15 "black")(rectangle (round(percentual-primeiro-grupo quantidade1 quantidade2)) 30 "solid" "orange"))(overlay (text (number->string (round(percentual-segundo-grupo quantidade1 quantidade2))) 15 "black")(rectangle (round(percentual-segundo-grupo quantidade1 quantidade2)) 30 "solid" "red")))(beside(text "Tamanho da amostra: " 15 "black")(text (number->string (tamanho-amostra quantidade1 quantidade2)) 15 "black")))]])
    

;; PERCENTUAL-SEGUNDO-GRUPO ============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; percentual-segundo-grupo: Número Número -> Número

;; Objetivo: esta função auxiliar recebe dois valores que correspondem à quantidade de pessoas de dois grupos distintos, e retorna a relação percentual entre a quantidade de pessoas
;; do segundo grupo e o tamanho da amostra. Caso a soma entre os valores seja igual à zero, a função retorna o número -1.

;; Exemplos: (percentual-segundo-grupo 0 0) = -1
;;           (percentual-segundo-grupo 0 20) = 100
;;           (percentual-segundo-grupo 40 60) = 60
;;           (percentual-segundo-grupo 50 50) = 50
;;           (percentual-segundo-grupo 70 30) = 30

(define (percentual-segundo-grupo quantidade1 quantidade2)
  (cond
    [(zero? (tamanho-amostra quantidade1 quantidade2)) -1]
    [else (* 100 (/ quantidade2 (tamanho-amostra quantidade1 quantidade2)))])) 
  
;; Testes:
(check-expect (percentual-segundo-grupo 0 0) -1)
(check-expect (percentual-segundo-grupo 0 20) 100)
(check-expect (percentual-segundo-grupo 40 60) 60)
(check-expect (percentual-segundo-grupo 50 50) 50)
(check-expect (percentual-segundo-grupo 70 30) 30)

;; PERCENTUAL-PRIMEIRO-GRUPO ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; percentual-primeiro-grupo: Número Número -> Número

;; Objetivo: esta função auxiliar recebe dois valores que correspondem à quantidade de pessoas de dois grupos distintos, e retorna a relação percentual entre a quantidade de pessoas
;; do primeiro grupo e o tamanho da amostra. Caso a soma entre os valores seja igual à zero, a função retorna o número -1.

;; Exemplos: (percentual-primeiro-grupo 0 0) = -1
;;           (percentual-primeiro-grupo 20 0) = 100
;;           (percentual-primeiro-grupo 60 40) = 40
;;           (percentual-primeiro-grupo 50 50) = 50
;;           (percentual-primeiro-grupo 70 30) = 70

(define (percentual-primeiro-grupo quantidade1 quantidade2)
  (cond
    [(zero? (tamanho-amostra quantidade1 quantidade2)) -1]
    [else (* 100 (/ quantidade1 (tamanho-amostra quantidade1 quantidade2)))]))

;; Testes:
(check-expect (percentual-primeiro-grupo 0 0) -1)
(check-expect (percentual-primeiro-grupo 20 0) 100)
(check-expect (percentual-primeiro-grupo 40 60) 40)
(check-expect (percentual-primeiro-grupo 50 50) 50)
(check-expect (percentual-primeiro-grupo 70 30) 70)


;; TAMANHO-AMOSTRA =============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; tamanho-amostra: Número Número -> Número

;; Objetivo: esta função auxiliar recebe dois valores que correspondem à quantidade de pessoas de dois grupos distintos, e retorna a soma entre eles.

;; Exemplos: (tamanho-amostra 0 100) = 100
;;           (tamanho-amostra 100 0) = 100
;;           (tamanho-amostra 0 0) = 0
;;           (tamanho-amostra 300 200) = 500
;;           (tamanho-amostra 600 400) = 1000
;;           (tamanho-amostra 750 750) = 1500

(define (tamanho-amostra quantidade1 quantidade2)
  (+ quantidade1 quantidade2))

;; Testes:
(check-expect (tamanho-amostra 0 100) 100)
(check-expect (tamanho-amostra 100 0) 100)
(check-expect (tamanho-amostra 0 0) 0)
(check-expect (tamanho-amostra 300 200) 500)
(check-expect (tamanho-amostra 600 400) 1000)
(check-expect (tamanho-amostra 750 750) 1500)
