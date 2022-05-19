;; Nome: Andrei Pochmann Koenich

;; ========================================================================== 
;; TIPO FIGURA:
;; ===========
(define-struct figura (x y altura cor))
;; Um elemento do conjunto Figura é
;;     (make-figura x y a c), onde
;;   x: Número, é a coordenada x do centro da figura
;;   y: Número, é a coordenada y do centro da figura
;;   a : Número, é a altura da figura
;;   c : Número, número que representa a cor da figura, de acordo com a função gera-cor

;; Exemplos de elementos do conjunto Figura:
(define figura1 (make-figura 0 0 80 77))
(define figura2 (make-figura 0 0 90 78))
(define figura3 (make-figura 0 0 100 79))
(define figura4 (make-figura 0 0 40 82))
(define figura5 (make-figura 25 25 30 89))
(define figura6 (make-figura 200 200 20 90))
(define figura7 (make-figura 500 500 40 30))
(define figura8 (make-figura 0 0 110 33))
(define figura9 (make-figura 300 300 10 22))
(define figura10 (make-figura 100 100 10 23))
(define figura11 (make-figura 200 200 75 101))
(define figura12 (make-figura 200 200 80 77))
(define figura13 (make-figura 0 0 80 96))

;; ========================
;; FUNÇÃO GERA-COR:
;; ========================
;; gera-cor : Número -> String
;; Dado um número positivo, devolve uma de 5 cores: "red", "blue", "green", "yellow" ou "cyan".
;; Exemplos:
;;      (gera-cor 3) = "yellow"
;;      (gera-cor 55) = "red"
(define (gera-cor n)
  (cond
    [(= (remainder n 5) 0) "red"]
    [(= (remainder n 5) 1) "blue"]  
    [(= (remainder n 5) 2) "green"]
    [(= (remainder n 5) 3) "yellow"]
    [(= (remainder n 5) 4) "cyan"]))
;; Obs.: A função remainder devolve o resto da divisão inteira do primeiro pelo segundo argumento

;; ========================
;; FUNÇÃO DESENHA-TRIANGULO:
;; ========================
;; desenha-triangulo : Número String ->  Imagem
;; Obj.: Dados um tamanho de lado e uma cor, desenha um triângulo.
;; Exemplos:
;;     (desenha-triangulo 20 "red") = .
;;     (desenha-triangulo 50 "darkgreen") = .

(define (desenha-triangulo lado cor)
  (triangle lado "outline" cor))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 01----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; SIERPINSKI ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; sierpinksi: Número String -> Imagem

;; Objetivo: esta função recebe o tamanho do lado de um triângulo e uma cor, e desenha um triângulo de
;; Sierpinski desta cor cujo lado do triângulo externo é o lado passado como argumento. Se o lado passado
;; como argumento tiver dimensões muito pequenas, a função retorna somente um triângulo. O triângulo de
;; Sierpinski é construído dividindo-se cada triângulo em 3, e desenhando recursivamente um triângulo dentro
;; de cada um destes triângulos.

;; Exemplos: (sierpinski 10 "black") = .

;;           (sierpinski 20 "red") = .
;;           (sierpinski 50 "lime") = .
;;           (sierpinski 100 "blue") = .

(define (sierpinski lado cor)
  (cond
       [(<= lado 10) (desenha-triangulo 10 cor)]
       [else (local
               (
                (define TRIANGULO (sierpinski (/ lado 2) cor))
               )
               (above TRIANGULO
                      (beside TRIANGULO TRIANGULO)))]))

;; Modelo de solução:

;; Se o lado for muito pequeno (menor ou igual a 10), então desenha somente um triângulo com lado igual a 10 e com a cor informada.

;; Se o lado não for muito pequeno, então
;;   Desenha
;;      Um triângulo de Sierpinski com a metade do tamanho do lado e dá o nome de TRIANGULO para este desenho.
;;      A imagem de um triângulo de Sierpinski com um TRIANGULO acima de dois outros TRIANGULOs.

;; Terminação: a função sierpinski sempre gera triângulos com lados menores do que o lado que
;; foi fornecido como parâmetro. Em razão disso, em algum momento a função irá retornar um lado
;; de triângulo menor ou igual a 10 (que é o caso trivial do programa), garantindo a finalização
;; da recursão.

;; CHAMADAS DA FUNÇÃO DO EXERCÍCIO 01 ==========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

(sierpinski 10 "black")
(sierpinski 20 "red")
(sierpinski 50 "lime")
(sierpinski 100 "blue")

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; DESENHA-SIERPINSKI ==========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-sierpinksi: Figura -> Imagem

;; Objetivo: esta função recebe uma figura, e retorna uma imagem que corresponde
;; a um triângulo de Sierpinski construído a partir da figura fornecida.(desenha-sierpinski figura3)

;; Exemplos: (desenha-sierpinski figura1) = .
;;           (desenha-sierpinski figura2) = .
;;           (desenha-sierpinski figura3) = .
;;           (desenha-sierpinski figura6) = .

(define (desenha-sierpinski figure)
  (sierpinski (calcula-lado-triangulo figure) (gera-cor (figura-cor figure))))

;; CALCULA-LADO-TRIANGULO ====================================================================================================================================================================================================================================================================================

;; calcula-lado: Figura -> Número

;; Objetivo: esta função auxiliar recebe uma figura, e retorna um número representando
;; o lado dessa figura, que é calculado em função da sua altura. Assume-se que a figura
;; fornecida corresponde a um triângulo equilátero.

;; Exemplos: (calcula-lado-triangulo figura1) = #i92.37604307034013
;;           (calcula-lado-triangulo figura2) = #i103.92304845413264
;;           (calcula-lado-triangulo figura3) = #i115.47005383792516

(define (calcula-lado-triangulo fig)
  (/(* 2 (figura-altura fig))(sqrt 3)))

;; Testes:
(check-within (calcula-lado-triangulo figura1) #i92.37604307034013 92.3760)
(check-within (calcula-lado-triangulo figura2) #i103.92304845413264 103.9230)
(check-within (calcula-lado-triangulo figura3) #i115.47005383792516 115.4700)

;; CHAMADAS DA FUNÇÃO DO EXERCÍCIO 02 ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

(desenha-sierpinski figura1) 
(desenha-sierpinski figura2)
(desenha-sierpinski figura3)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 03---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; DESENHA-BONECO ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-boneco: Figura -> Imagem

;; Objetivo: esta função recebe uma figura, e retorna uma imagem de um boneco
;; palito construído a partir das características dessa figura (cor e altura).

;; Exemplos: (desenha-boneco figura4) =  .
;;           (desenha-boneco figura5) = .
;;           (desenha-boneco figura6) = .

(define (desenha-boneco fig)
  (local
    (
     (define TAM (figura-altura fig))
     (define COR (gera-cor (figura-cor fig)))
     (define CABECA (desenha-circulo fig))
     (define CORPO (line 0 (* -1 (* 3 TAM)) COR))
     (define BRACO-DIR (line (* (sqrt 2) TAM) (* -1 (* (sqrt 2) TAM)) COR))
     (define BRACO-ESQ (line (* -1 (* (sqrt 2) TAM)) (* -1 (* (sqrt 2) TAM)) COR))
     (define PERNA-DIR (line (* (sqrt 2) TAM) (* -1 (* (sqrt 2) TAM)) COR))
     (define PERNA-ESQ (line (* -1 (* (sqrt 2) TAM)) (* -1 (*(sqrt 2) TAM)) COR))
    ) 
(above CABECA (beside BRACO-DIR CORPO BRACO-ESQ)(beside PERNA-DIR PERNA-ESQ))))  

;; DESENHA-CIRCULO ======================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-circulo: Figura -> Imagem

;; Objetivo: esta função auxiliar recebe uma figura, e retorna uma imagem de um círculo
;; construído a partir das características dessa figura (cor e altura).

;; Exemplos: (desenha-circulo figura4) = .
;;           (desenha-circulo figura5) = .       
;;           (desenha-circulo figura6) = .

(define (desenha-circulo fig)
  (circle (/ (figura-altura fig) 2) "solid" (gera-cor (figura-cor fig))))

;; CHAMADAS DAS FUNÇÕES DO EXERCÍCIO 03 ======================================================================================================================================================================================================================================================================================================================================================================================================================================================================

(desenha-circulo figura4)
(desenha-circulo figura5)
(desenha-circulo figura6)

(desenha-boneco figura4)
(desenha-boneco figura5)
(desenha-boneco figura6)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 04---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; LARGURA E ALTURA DA CENA-BASE ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; LARG: constante que representa a largura da cena-base
(define LARG 400)

;; ALT: constante que representa a altura da cena-base
(define ALT 400)

;; TIPO CENA ====================================================================================================================================================================================================================================================================================

;; Um elemento cena do conjunto Cena pode ser

;; 1. A cena vazia (empty-scene larg alt), em que

;; larg : Número
;; alt : Número

;; ou

;; 2. (place-image img x y cena) , em que

;; img : Imagem
;; x : Número
;; y : Número
;; cena: Cena

;; DESENHA-FIGURAS ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-figuras : (Figura -> Imagem) Figura -> Cena

;; Objetivo: esta função recebe uma função que desenha uma figura e uma figura, e desenha várias
;; vezes a figura recebida em uma cena, variando sua cor e sua localização.

;; Exemplos: (desenha-figuras desenha-circulo figura1) = .
;;            (desenha-figuras desenha-boneco figura6) = .
;;        (desenha-figuras desenha-sierpinski figura3) = .

(define (desenha-figuras funcao-desenha fig)
   [cond
    [(fora-dos-limites? fig) (empty-scene LARG ALT)]  
    [else (place-image (funcao-desenha fig)(figura-x fig)(figura-y fig)(desenha-figuras funcao-desenha (muda-coordenadas-cor fig)))]])

;; Modelo de solução:

;; Se a figura está fora dos limites da cena que é a base da recursão, retorna essa cena, que é a moldura na qual todas as figuras são desenhadas.

;; Se a figura não está fora dos limites, então
;;   Montar uma cena contendo
;;      Uma cena com a própria figura fornecida como parâmetro, com suas coordenadas X e Y inalteradas e o número representando sua cor inalterado.
;;      As cenas geradas pela movimentação da figura ao longo da moldura, enquanto ela sofre alterações de coloração.

;; Terminação: a função muda-coordenadas-cor sempre incrementa as coordenadas X e Y da figura fornecida como parâmetro
;; em 50 unidades. Em razão disso, em alguma recursão as coordenadas X e Y da figura irão ultrapassar o valor da
;; largura e da altura da moldura da cena (respectivamente), garantindo o término da recursão, graças à função
;; fora-dos-limites?.

;; MUDA-COORDENADAS-COR ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; muda-coordenadas-cor : Figura -> Figura

;; Objetivo: esta função auxiliar recebe uma figura, e retorna outra figura construída a partir da figura fornecida,
;; com suas coordenadas X e Y acrescidas de 50 unidades e com o número representando sua cor acrescido de uma unidade.

(define (muda-coordenadas-cor fig)
  (make-figura (+ (figura-x fig) 50)(+ (figura-y fig) 50)(figura-altura fig)(+ (figura-cor fig) 1))) 

;; Exemplos: (muda-coordenadas-cor figura1) = (make-figura 50 50 80 78)
;;           (muda-coordenadas-cor figura2) = (make-figura 50 50 90 79)
;;           (muda-coordenadas-cor figura7) = (make-figura 550 550 40 31)

;; Testes:
(check-expect (muda-coordenadas-cor figura1) (make-figura 50 50 80 78))
(check-expect (muda-coordenadas-cor figura2) (make-figura 50 50 90 79))
(check-expect (muda-coordenadas-cor figura7) (make-figura 550 550 40 31))

;; FORA-DOS-LIMITES? ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; fora-dos-limites? : Figura -> Booleano

;; Objetivo: esta função auxiliar recebe uma figura, e verifica se as coordenadas X e Y da figura
;; são maiores do que o valor da largura e da altura da moldura da animação, respectivamente.

;; Exemplos: (fora-dos-limites? figura1) = #false
;;           (fora-dos-limites? figura2) = #false
;;           (fora-dos-limites? figura7) = #true

(define (fora-dos-limites? fig)
    (and (> (figura-x fig) LARG)(> (figura-y fig) ALT)))

;; Testes:
(check-expect (fora-dos-limites? figura1) #false)
(check-expect (fora-dos-limites? figura2) #false)
(check-expect (fora-dos-limites? figura7) #true)

;; CHAMADAS DA FUNÇÃO DO EXERCÍCIO 04 ======================================================================================================================================================================================================================================================================================================================================================================================================================================================================

(desenha-figuras desenha-circulo figura1)
(desenha-figuras desenha-boneco figura6)
(desenha-figuras desenha-sierpinski figura3)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05A---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
;; COR-VERMELHA? ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; cor-vermelha? : Figura -> Booleano

;; Objetivo: esta função auxiliar recebe uma figura, e verifica se a cor da figura é vermelha.
;; Caso seja, a função retorna valor lógico verdadeiro. Caso não seja, a função retorna
;; valor lógico falso.

;; Exemplos: (cor-vermelha? figura4) = #false
;;           (cor-vermelha? figura5) = #false
;;           (cor-vermelha? figura6) = #true

(define (cor-vermelha? fig)
    (string=? (gera-cor (figura-cor fig)) "red"))

;; Testes:
(check-expect (cor-vermelha? figura4) #false)
(check-expect (cor-vermelha? figura5) #false)
(check-expect (cor-vermelha? figura6) #true)

;; COR-VERDE? ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; cor-verde? : Figura -> Booleano

;; Objetivo: esta função auxiliar recebe uma figura, e verifica se a cor da figura é verde.
;; Caso seja, a função retorna valor lógico verdadeiro. Caso não seja, a função retorna
;; valor lógico falso.

;; Exemplos: (cor-verde? figura4) = #true
;;           (cor-verde? figura5) = #false
;;           (cor-verde? figura6) = #false

(define (cor-verde? fig)
    (string=? (gera-cor (figura-cor fig)) "green"))

;; Testes:
(check-expect (cor-verde? figura4) #true)
(check-expect (cor-verde? figura5) #false)
(check-expect (cor-verde? figura6) #false)

;; COR>100? ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; cor>100? : Figura -> Booleano

;; Objetivo: esta função auxiliar recebe uma figura, e verifica se o número
;; da cor da figura é superior a 100. Caso seja, a função retorna valor lógico
;; verdadeiro. Caso não seja, a função retorna valor lógico falso.

;; Exemplos: (cor-verde? figura4) = #false
;;           (cor-verde? figura5) = #false
;;           (cor-verde? figura11) = #true

(define (cor>100? fig)
    (> (figura-cor fig) 100))

;; Testes:
(check-expect (cor>100? figura4) #false)
(check-expect (cor>100? figura5) #false)
(check-expect (cor>100? figura11) #true)

;; ALTURA-MAIOR-100? ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; altura-maior-100? : Figura -> Booleano

;; Objetivo: esta função auxiliar recebe uma figura, e verifica se a altura da figura
;; é maior do que 100. Caso seja, a função retorna valor lógico verdadeiro. Caso não seja,
;; a função retorna valor lógico falso.

;; Exemplos: (altura-maior? figura5) = #false
;;           (altura-maior? figura6) = #false
;;           (altura-maior? figura8) = #true

(define (altura-maior-100? fig)
    (> (figura-altura fig) 100))

;; Testes:
(check-expect (altura-maior-100? figura5) #false)
(check-expect (altura-maior-100? figura6) #false)
(check-expect (altura-maior-100? figura8) #true)

;; MUDA-COORDENADAS-ALEATORIO ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; muda-coordenadas-aleatorio : Figura -> Figura

;; Objetivo: esta função auxiliar recebe uma figura, e retorna outra figura construída a partir da figura fornecida,
;; mas com suas coordenadas X e Y somadas com um número aleatório entre 0 e 100.

(define (muda-coordenadas-aleatorio fig)
  (make-figura (+ (figura-x fig) (random 100))(+ (figura-y fig) (random 100))(figura-altura fig)(figura-cor fig)))

;; Exemplos: (muda-coordenadas-aleatorio figura1) = (make-figura 57 2 80 77)
;;           (muda-coordenadas-aleatorio figura2) = (make-figura 6 43 90 78)
;;           (muda-coordenadas-aleatorio figura3) = (make-figura 72 71 100 79)

;; MUDA-ALTURA-COR-COORDENADA ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; muda-altura-cor-coordenada : Figura -> Figura

;; Objetivo: esta função auxiliar recebe uma figura, e retorna outra figura construída a partir da figura fornecida,
;; mas com a sua altura acrescida de 15 unidades, suas coordenadas X e Y acrescidas de um número aleatório de unidades,
;; (que varia entre -100 e 100) e o número representando sua cor acrescido de duas unidades.

(define (muda-altura-cor-coordenada fig)
  (make-figura (+ (+ -100(random 200))(figura-x fig))(+ (+ -100(random 200))(figura-y fig))(+ 5(figura-altura fig))(+ 2(figura-cor fig))))

;; Exemplos: (muda-altura-cor-coordenada figura1) = (make-figura 5 10 95 79)
;;           (muda-altura-cor-coordenada figura2) = (make-figura 5 10 105 80)
;;           (muda-altura-cor-coordenada figura3) = (make-figura 5 10 115 81)

;; MUDA-COR ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; muda-cor : Figura -> Figura

;; Objetivo: esta função auxiliar recebe uma figura, e retorna outra figura construída a partir da figura fornecida,
;; mas com o número que representa sua cor acrescido de uma unidade.

(define (muda-cor fig)
  (make-figura (figura-x fig)(figura-y fig)(figura-altura fig)(+ 1 (figura-cor fig))))

;; Exemplos: (muda-cor figura1) = (make-figura 0 0 80 78)
;;           (muda-cor figura2) = (make-figura 0 0 90 79)
;;           (muda-cor figura3) = (make-figura 0 0 100 80)

;; Testes:
(check-expect (muda-cor figura1)(make-figura 0 0 80 78))
(check-expect (muda-cor figura2)(make-figura 0 0 90 79))
(check-expect (muda-cor figura3)(make-figura 0 0 100 80))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05B---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; DESENHA-FIGURAS-GEN ========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-figuras-gen : (Figura -> Imagem) Figura (Figura -> Booleano) (Figura -> Figura) -> Cena

;; Objetivo: esta função recebe uma função que desenha uma figura, uma figura, uma função de critério de parada
;; e uma função de alteração de figuras. A função retorna uma cena envolvendo a figura fornecida, sendo que a
;; forma como ocorrerá a construção da cena é determinada pela função de alteração de figuras, e a terminação
;; da função é determina pela função de critério de parada.

;; Exemplos: (desenha-figuras-gen desenha-circulo figura6 altura-maior-100? muda-altura-cor-coordenada) = .
;;                      (desenha-figuras-gen desenha-sierpinski figura12 cor>100? muda-coordenadas-cor) = .
;;           (desenha-figuras-gen desenha-circulo figura5 fora-dos-limites? muda-coordenadas-aleatorio) = .

(define (desenha-figuras-gen funcao-desenha fig funcao-parada funcao-alteracao)
  [cond
   [(funcao-parada fig) (empty-scene LARG ALT)]   
   [else (place-image (funcao-desenha fig)(figura-x fig)(figura-y fig)(desenha-figuras-gen funcao-desenha (funcao-alteracao fig) funcao-parada funcao-alteracao))]]) 

;; Modelo de solução:

;; Se alguma característica da figura é suficiente para que o critério de parada seja atingido, então retorna a moldura na qual todas as figuras são desenhadas (a cena-base).

;; Se nenhuma característica da figura é suficiente para que o critério de parada seja atingido, então
;;   Montar uma cena com
;;      Uma cena com a própria figura fornecida como parâmetro, com todas suas características inalteradas.
;;      Outras cenas contendo a figura fornecida, mas com uma ou mais características alteradas de acordo com a função que determina como se dará essa alteração.

;; CHAMADAS DAS FUNÇÕES DO EXERCÍCIO 05 ======================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; Primeira chamada:
(desenha-figuras-gen desenha-circulo figura6 altura-maior-100? muda-altura-cor-coordenada)

;; Segunda chamada:
(desenha-figuras-gen desenha-sierpinski figura12 cor>100? muda-coordenadas-cor)

;; Terceira chamada:
(desenha-figuras-gen desenha-circulo figura5 fora-dos-limites? muda-coordenadas-aleatorio)

;; Quarta chamada:
(desenha-figuras-gen desenha-boneco figura6 altura-maior-100? muda-altura-cor-coordenada)

;; Quinta chamada:
(desenha-figuras-gen desenha-circulo figura11 cor-vermelha? muda-coordenadas-cor)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05C---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; ;; Terminação da primeira chamada: a função muda-altura-cor-coordenada sempre retorna uma figura cuja altura é 5 unidades maior
; ;; do que a altura da figura fornecida como parâmetro. Em razão disso, em algum momento a recursão será interrompida,
; ;; pois a função altura-maior-100? é capaz de realizar essa interrupção quando a figura retornada pela função muda-altura
; ;; possuir uma altura maior do que 100.
; 
; ;; Terminação da segunda chamada: a função muda-coordenadas-cor sempre retorna uma figura cujo número que representa a cor é uma unidade maior
; ;; do que o número que representa a cor da figura fornecida como parâmetro. Em razão disso, em algum momento a recursão será interrompida,
; ;; pois a função cor>100? é capaz de realizar essa interrupção quando a figura retornada pela função muda-cor possuir um número que representa
; ;; a cor maior do que 100.
; 
; ;; Terminação da terceira chamada: a função muda-coordenadas-aleatorio sempre retorna uma figura cujas coordenadas X e Y são maiores do que
; ;; as coordenadas X e Y da figura fornecida como parâmetro. Em razão disso, em algum momento a recursão será interrompida, pois a função
; ;; fora-dos-limites? é capaz de realizar essa interrupção quando a figura retornada pela função muda-coordenadas-aleatorio possuir coordenadas
; ;; X e Y maiores do que a largura e altura da moldura (cena-base), respectivamente.
; 
; ;; Terminação da quarta chamada: a função muda-altura-cor-coordenada sempre retorna uma figura cuja altura é 5 unidades maior
; ;; do que a altura da figura fornecida como parâmetro. Em razão disso, em algum momento a recursão será interrompida,
; ;; pois a função altura-maior-100? é capaz de realizar essa interrupção quando a figura retornada pela função muda-altura
; ;; possuir uma altura maior do que 100.
; 
; ;; Terminação da quinta chamada: a função muda-coordenadas-cor sempre retorna uma figura cujo número que representa a cor é uma unidade maior
; ;; do que o número que representa a cor da figura fornecida como parâmetro. Em razão disso, em algum momento a recursão será interrompida,
; ;; pois a função cor-vermelha? é capaz de realizar essa interrupção quando a figura retornada pela função muda-cor possuir um número que
; ;; representa a cor correspondente à cor vermelha, de acordo com a função gera-cor.