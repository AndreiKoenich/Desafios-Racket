;;----------------------------------------------------------------------------------------------------EXERCÍCIO 01---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; -----------------
;; TIPO CARTA-NUMERO:
;; -----------------

(define-struct carta-numero (cor valor))

;; Um elemento carta-numero do conjunto Carta-numero é uma estrutura
;; (make-carta-numero uma-cor um-valor) em que:

;; uma-cor : String, é a cor da carta, que pode ser "azul", "verde", "amarelo" ou "vermelho"

;; um-valor : Número, é o número da carta, que pode ser 0, 1, 2, 3, 4, 5, 6, 7, 8 ou 9

;; Exemplos de elementos do conjunto Carta-numero:
(define azul-0 (make-carta-numero "azul" 0))
(define azul-1 (make-carta-numero "azul" 1))
(define azul-2 (make-carta-numero "azul" 2))
(define azul-3 (make-carta-numero "azul" 3))
(define azul-4 (make-carta-numero "azul" 4))
(define azul-5 (make-carta-numero "azul" 5))
(define azul-6 (make-carta-numero "azul" 6))
(define azul-7 (make-carta-numero "azul" 7))
(define verde-0 (make-carta-numero "verde" 0))
(define verde-1 (make-carta-numero "verde" 1))
(define verde-2 (make-carta-numero "verde" 2))
(define verde-3 (make-carta-numero "verde" 3))
(define verde-4 (make-carta-numero "verde" 4))
(define verde-5 (make-carta-numero "verde" 5))
(define verde-6 (make-carta-numero "verde" 6))
(define verde-7 (make-carta-numero "verde" 7))
(define verde-8 (make-carta-numero "verde" 8))
(define amarelo-0 (make-carta-numero "amarelo" 0))
(define amarelo-1 (make-carta-numero "amarelo" 1))
(define amarelo-2 (make-carta-numero "amarelo" 2))
(define amarelo-3 (make-carta-numero "amarelo" 3))
(define amarelo-4 (make-carta-numero "amarelo" 4))
(define amarelo-5 (make-carta-numero "amarelo" 5))
(define amarelo-6 (make-carta-numero "amarelo" 6))
(define amarelo-7 (make-carta-numero "amarelo" 7))
(define amarelo-8 (make-carta-numero "amarelo" 8))
(define vermelho-0 (make-carta-numero "vermelho" 0))
(define vermelho-1 (make-carta-numero "vermelho" 1))
(define vermelho-2 (make-carta-numero "vermelho" 2))
(define vermelho-3 (make-carta-numero "vermelho" 3))
(define vermelho-4 (make-carta-numero "vermelho" 4))
(define vermelho-5 (make-carta-numero "vermelho" 5))
(define vermelho-6 (make-carta-numero "vermelho" 6))

;; -----------------
;; TIPO CARTA-ESPECIAL:
;; -----------------

(define-struct carta-especial (cor tipo))

;; Um elemento carta-especial do conjunto Carta-especial é uma estrutura
;; (make-carta-especial uma-cor um-tipo) em que:

;; uma-cor : String, é a cor da carta, que pode ser "azul", "verde", "amarelo", "vermelho" ou "qualquer"

;; um-tipo : String, é o tipo da carta, que pode ser "Compra4", "Compra2", "Inverte", "PulaVez" ou "TrocaCor"

;; Exemplos de elementos do conjunto Carta-especial:
(define verde-Compra2 (make-carta-especial "verde" "Compra2"))
(define azul-Compra2 (make-carta-especial "azul" "Compra2"))
(define vermelho-Compra2 (make-carta-especial "vermelho" "Compra2"))
(define amarelo-Compra2 (make-carta-especial "amarelo" "Compra2"))
(define verde-Inverte (make-carta-especial "verde" "Inverte"))
(define azul-Inverte (make-carta-especial "azul" "Inverte"))
(define vermelho-Inverte (make-carta-especial "vermelho" "Inverte"))
(define amarelo-Inverte (make-carta-especial "amarelo" "Inverte"))
(define azul-PulaVez (make-carta-especial "azul" "PulaVez"))
(define vermelho-PulaVez (make-carta-especial "vermelho" "PulaVez"))
(define qualquer-Compra4 (make-carta-especial "qualquer" "Compra4"))
(define qualquer-TrocaCor(make-carta-especial "qualquer" "TrocaCor"))

;; -----------
;; TIPO CARTA:
;; -----------

;; Um elemento carta do conjunto Carta é

;; 1. Um elemento de Carta-numero;

;; ou

;; 2. Um elemento de Carta-especial.

;; Exemplos de elementos do conjunto Carta:
(define verde-9 (make-carta-numero "verde" 9))
(define azul-8 (make-carta-numero "azul" 8))
(define vermelho-8 (make-carta-numero "vermelho" 8))
(define vermelho-9 (make-carta-numero "vermelho" 9))
(define amarelo-PulaVez (make-carta-especial "amarelo" "PulaVez"))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; CARTA-COR =====================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; carta-cor: Carta -> String

;; Objetivo: esta função recebe uma carta qualquer do jogo Uno e retorna a sua cor, em inglês. Ou seja, as cartas das cores "azul"
;; "verde", "amarelo" ou "vermelho" devem retornar as cores "blue", "green", "gold" e "red", respectivamente. Se a carta 
;; possuir a cor "qualquer", devolve "black".

;; Exemplos: (carta-cor verde-0) = "green"
;;           (carta-cor qualquer-Compra4) = "black"
;;           (carta-cor azul-2) = "blue"

(define (carta-cor card)
  [cond
    [(carta-numero? card)(numero-cor card)]
    [(carta-especial? card)(especial-cor card)]])

;; Testes:
(check-expect (carta-cor verde-0) "green")
(check-expect (carta-cor qualquer-Compra4) "black")
(check-expect (carta-cor azul-2) "blue")

;; NUMERO-COR ====================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; numero-cor: Carta-numero -> String

;; Objetivo: esta função auxiliar recebe uma carta de número do jogo Uno (devem ser informados a cor e o número) e retorna a sua cor,
;; em inglês. Especificamente para a cor "amarelo", a função retorna "gold". Portanto, as cartas das cores  "azul", "verde", "amarelo"
;; ou "vermelho" devem retornar as cores "blue", "green", "gold" e "red", respectivamente.

;; Exemplos: (numero-cor azul-0) = "blue"
;;           (numero-cor verde-1) = "green"
;;           (numero-cor amarelo-2) = "gold"

(define (numero-cor carta_numero)
  [cond
    [(string=? (carta-numero-cor carta_numero) "azul") "blue"]
    [(string=? (carta-numero-cor carta_numero) "verde") "green"]
    [(string=? (carta-numero-cor carta_numero) "amarelo") "gold"]
    [(string=? (carta-numero-cor carta_numero) "vermelho") "red"]])

;; Testes:
(check-expect (numero-cor azul-0) "blue")
(check-expect (numero-cor verde-1) "green")
(check-expect (numero-cor amarelo-2) "gold")

;; ESPECIAL-COR ==================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; especial-cor: Carta-especial -> String

;; Objetivo: esta função auxiliar recebe uma carta especial do jogo Uno (devem ser informados a cor e o tipo) e retorna a sua cor,
;; em inglês. Ou seja, as cartas das cores  "azul", "verde", "amarelo" ou "vermelho" devem retornar as cores "blue", "green", "gold"
;; e "red", respectivamente. Se a carta possuir a cor "qualquer", devolve "black".
               
;; Exemplos: (especial-cor qualquer-Compra4) = "black"
;;           (especial-cor amarelo-PulaVez) = "gold"
;;           (especial-cor verde-Compra2) = "green" 

(define (especial-cor carta_especial)
  [cond
    [(string=? (carta-especial-cor carta_especial) "azul") "blue"] 
    [(string=? (carta-especial-cor carta_especial) "verde") "green"]
    [(string=? (carta-especial-cor carta_especial) "amarelo") "gold"]
    [(string=? (carta-especial-cor carta_especial) "vermelho") "red"]
    [(string=? (carta-especial-cor carta_especial) "qualquer") "black"]])

;; Testes:
(check-expect (especial-cor qualquer-Compra4) "black")
(check-expect (especial-cor amarelo-PulaVez) "gold")
(check-expect (especial-cor verde-Compra2) "green")

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 03----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; TIPO CARTA-STRING =======================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; Um elemento carta-string do conjunto Carta-String é

;; 1. Um elemento de Carta;

;; ou

;; 2. Um elemento de String.

;; Exemplos de elementos do conjunto Carta-String:
(define azul-9 (make-carta-numero "azul" 9))
(define amarelo-9 (make-carta-numero "amarelo" 9))
(define vermelho-7 (make-carta-numero "vermelho" 7))
(define verde-PulaVez (make-carta-especial "verde" "PulaVez"))
(define constanteN "N")

;; JOGADA-VALIDA =================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; jogada-valida: Carta Carta-String -> Booleano

;; Objetivo: esta função recebe uma carta, representando a carta da mesa, e uma outra carta ou uma string
;; representando a carta da mão ou o fato de não haver carta na mão (no caso de ser um string), nesta
;; ordem, e verifica se é possível jogar a carta da mão de acordo com as regras do jogo Uno, retornando
;; o valor lógico "falso" caso seja impossível e o valor lógico "verdadeiro" caso seja possível.

;; Exemplos: (jogada-valida qualquer-Compra4 vermelho-4) = #true
;;           (jogada-valida azul-5 "maovazia") = #false
;;           (jogada-valida azul-5 vermelho-5) = #true

(define (jogada-valida carta_da_mesa carta_da_mao)
  (cond
    [(string? carta_da_mao) #false]
    [(string=? (carta-cor carta_da_mesa) "black") #true]
    [(string=? (carta-cor carta_da_mao) "black") #true]
    [(string=? (carta-cor carta_da_mesa)(carta-cor carta_da_mao)) #true]
    [(string=? (carta-conteudo carta_da_mesa)(carta-conteudo carta_da_mao)) #true]
    [else #false])) 
                
;; Testes:
(check-expect (jogada-valida qualquer-Compra4 vermelho-4) #true)
(check-expect (jogada-valida azul-5 "maovazia") #false)
(check-expect (jogada-valida azul-5 vermelho-5) #true)

;; CARTA-CONTEUDO ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; carta-conteudo: Carta -> String

;; Objetivo: esta função auxiliar recebe uma carta qualquer, verifica se ela é uma carta especial ou uma
;; carta de número e retorna o conteúdo da carta em questão, que pode ser um número convertido em string
;; (quando a carta em questão é uma carta de número) ou uma string informando o tipo da carta (quando a
;; carta em questão é uma carta especial).

;; Exemplos: (carta-conteudo verde-1) = "1"
;;           (carta-conteudo vermelho-3) = "3"
;;           (carta-conteudo verde-Compra2) = "Compra2"

(define (carta-conteudo carta_em_questao)(cond
    [(carta-numero? carta_em_questao)(number->string(carta-numero-valor carta_em_questao))]
    [(carta-especial? carta_em_questao)(carta-especial-tipo carta_em_questao)]))

;; Testes:
(check-expect (carta-conteudo verde-1) "1")
(check-expect (carta-conteudo vermelho-3) "3")
(check-expect (carta-conteudo verde-Compra2) "Compra2")

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 04----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; TIPO MÃO =================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

(define-struct mão (carta1 carta2 carta3 carta4 carta5))

;; Um elemento mão do conjunto Mão é uma estrutura
;; (make-mão uma-carta1 uma-carta2 uma-carta3 uma-carta4 uma-carta5) em que: 

;; uma-carta1: Carta-String - representa a primeira das cinco cartas que o jogador tem em sua mão. Caso o jogador não tenha nenhuma, será igual à string "livre"

;; uma-carta2: Carta-String - representa a segunda das cinco cartas que o jogador tem em sua mão. Caso o jogador não tenha nenhuma, será igual à string "livre"

;; uma-carta3: Carta-String - representa a terceira das cinco cartas que o jogador tem em sua mão. Caso o jogador não tenha nenhuma, será igual à string "livre"

;; uma-carta4: Carta-String - representa a quarta das cinco cartas que o jogador tem em sua mão. Caso o jogador não tenha nenhuma, será igual à string "livre"

;; uma-carta5: Carta-String - representa a quinta das cinco cartas que o jogador tem em sua mão. Caso o jogador não tenha nenhuma, será igual à string "livre"

(define mãoA (make-mão verde-0 amarelo-PulaVez qualquer-Compra4 azul-2 verde-1))
(define mãoB (make-mão amarelo-2 vermelho-3 "livre" verde-Compra2 vermelho-PulaVez))
(define mãoC (make-mão azul-0 amarelo-Inverte azul-7 verde-1 amarelo-2))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; DEFINE-JOGADA ==============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; define-jogada: Mão Carta -> Carta-String

;; Objetivo: dada uma mão e uma carta da mesa, nesta ordem, esta função devolve uma carta da mão
;; que pode ser jogada sobre esta carta da mesa. Se não houver nenhuma carta que pode ser jogada,
;; a função devolve a string "Jogada impossível". A análise é feita de forma sequencial, ou
;; seja, cada carta da mão tem prioridade sobre cartas em posições subsequentes.

;; Exemplos: (define-jogada mãoA verde-Compra2) = verde-0
;;           (define-jogada mãoB vermelho-Pulavez) = vermelho-3
;;           (define-jogada mãoB azul-5) = "Jogada impossivel"

(define (define-jogada hand carta_da_mesa)
  [cond
    [(jogada-valida carta_da_mesa (mão-carta1 hand)) (mão-carta1 hand)]
    [(jogada-valida carta_da_mesa (mão-carta2 hand)) (mão-carta2 hand)]
    [(jogada-valida carta_da_mesa (mão-carta3 hand)) (mão-carta3 hand)]
    [(jogada-valida carta_da_mesa (mão-carta4 hand)) (mão-carta4 hand)]
    [(jogada-valida carta_da_mesa (mão-carta5 hand)) (mão-carta5 hand)] 
    [else "Jogada impossivel"]])  

;; Testes:
(check-expect (define-jogada mãoA verde-Compra2) verde-0)
(check-expect (define-jogada mãoB vermelho-PulaVez) vermelho-3)
(check-expect (define-jogada mãoB azul-5) "Jogada impossivel")

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 06---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; CONSTANTES PARA IMAGENS ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; semicirculo1: constante utilizada para desenhar um semicírculo vermelho na carta qualquer-TrocaCor
(define semicirculo1 (rotate -35(crop/align "right" "bottom" 35 60 (ellipse 80 120 "solid" "red"))))

;; semicirculo2: constante utilizada para desenhar um semicírculo verde na carta qualquer-TrocaCor
(define semicirculo2 (rotate -35(crop/align "left" "top" 40 60 (ellipse 80 120 "solid" "green"))))

;; semicirculo3: constante utilizada para desenhar um semicírculo amarelo na carta qualquer-TrocaCor
(define semicirculo3 (rotate -35(crop/align "right" "top" 40 60 (ellipse 80 120 "solid" "gold"))))

;; semicirculo4: constante utilizada para desenhar uma elipse azul na carta qualquer-TrocaCor
(define semicirculo4 (rotate -35 (ellipse 70 110 "solid" "blue")))

;; semicirculos-juntos: constante utilizada para unir os 4 semicírculos anteriores, antes de imprimi-los na carta qualquer-TrocaCor
(define semicirculos-juntos (overlay/xy (overlay/xy semicirculo1 0 -51(overlay/xy semicirculo2 30 0 semicirculo3)) -13.5 1 semicirculo4))

;;numero+2canto: constante utilizada para imprimir o "+2" no canto superior esquerdo e inferior direito das cartas especiais do tipo Compra2
(define numero+2canto (text "+2" 30 "white"))

;;cartas-VMAZ-Compra4: constante utilizada para desenhar uma carta vermelha e uma carta azul no centro das cartas especiais do tipo qualquer-Compra4
(define cartas-VMAZ-Compra4 (rotate -18(flip-horizontal(overlay/xy (rectangle 20 40 "solid" "red") -10 -10(rectangle 20 40 "solid" "blue")))))

;;cartas-AMVD-Compra4: constante utilizada para desenhar uma carta amarela e uma carta verde no centro das cartas especiais do tipo qualquer-Compra4
(define cartas-AMVD-Compra4 (rotate -18(flip-horizontal(overlay/xy (rectangle 20 40 "solid" "gold") -10 -10(rectangle 20 40 "solid" "green")))))

;;numero+4canto: constante utilizada para imprimir o "+4" no canto superior esquerdo e inferior direito das cartas especiais do tipo qualquer-Compra4
(define numero+4canto (text "+4" 30 "white"))

;; TIPO IMAGEM-BOOLEANO =======================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; Um elemento imagem-booleano do conjunto Imagem-Booleano é

;; 1. Um elemento de Imagem;

;; ou

;; 2. Um elemento de Booleano.

;; Exemplos de elementos do conjunto Imagem-Booleano:
(define quadrado-azul (rectangle 50 50 "solid" "blue"))
(define circulo-vermelho (circle 40 "solid" "red"))
(define estrela-amarela (star 40 "solid" "gold"))
(define constante-false #false)
(define constante-true #true)

;; DESENHA-CARTA ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-carta: Carta -> Imagem

;; Objetivo: esta função recebe uma carta de UNO e retorna uma imagem representando a aparência real dessa carta.

;; Exemplos:    (desenha-carta verde-Compra2) = .
;;           (desenha-carta vermelho-PulaVez) = .
;;                     (desenha-carta azul-5) = .

(define (desenha-carta card)
  [cond
    [(string=? (carta-conteudo card) "Compra2") (overlay/xy numero+2canto -5 -5 (overlay/xy numero+2canto -70 -142 (overlay (desenha-compra2 card)(desenha-background card))))]
    [(string=? (carta-conteudo card) "Compra4") (overlay/xy numero+4canto -5 -5 (overlay/xy numero+4canto -70 -142 (overlay (underlay/xy cartas-AMVD-Compra4 -10 -15 cartas-VMAZ-Compra4)(desenha-background card))))]
    [(string=? (carta-conteudo card) "TrocaCor")(overlay semicirculos-juntos (desenha-background card))]
    [(string=? (carta-conteudo card) "PulaVez") (overlay/xy (desenha-pulavez-canto card) -80 -150 (overlay/xy (desenha-pulavez-canto card) -6 -7 (overlay (desenha-pulavez-centro card) (desenha-background card))))]
    [(string=? (carta-conteudo card) "Inverte") (overlay (overlay/xy (desenha-inverte-centro1 card) -5 28 (desenha-inverte-centro2 card))(desenha-background card))] 
    [else (overlay/xy (desenha-num-canto card) -83 -145 (overlay/xy (desenha-num-canto card) -5 -5 (overlay (desenha-num-centro card) (desenha-background card))))]])   

;; DESENHA-BACKGROUND ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-background: Carta -> Imagem

;; Objetivo: esta função auxiliar recebe uma carta de Uno e retorna uma imagem representando o fundo dessa carta,
;; ou seja, a imagem na qual outra imagem representando o tipo da carta pode ser impressa.

;; Exemplos:    (desenha-background verde-Compra2) = . 
;;           (desenha-background vermelho-PulaVez) = .
;;                     (desenha-background azul-5) = .

(define (desenha-background card)
  (overlay (rotate -35 (ellipse 85 135 "solid" "white")) (overlay (rectangle 100 175 "solid" (carta-cor card)) (rectangle 110 185 "outline" (carta-cor card)))))

;; DESENHA-COMPRA2 ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-compra2: Carta -> Imagem-Booleano

;; Objetivo: esta função auxiliar recebe uma carta de Uno, verifica se a carta é especial
;; do tipo Compra2 e, caso seja, retorna uma imagem que referencia esse tipo de carta,
;; que pode ser impressa no centro da carta. Caso não seja, a função retorna valor lógico "falso".

;; Exemplos: (desenha-compra2 verde-Compra2) = . 
;;           (desenha-compra2 vermelho-PulaVez) = #false
;;           (desenha-compra2 azul-5) = #false

(define (desenha-compra2 card)
  [cond
    [(string=? (carta-conteudo card) "Compra2") (rotate -18(flip-horizontal(overlay/xy (rectangle 20 40 "solid" (carta-cor card)) -23 -15(rectangle 20 40 "solid" (carta-cor card)))))] 
    [else #false]])

;; Testes:
(check-expect (desenha-compra2 vermelho-PulaVez) #false)
(check-expect (desenha-compra2 azul-5) #false)
(check-expect (desenha-compra2 vermelho-4) #false)

;; DESENHA-PULAVEZ-CANTO ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-pulavez-canto: Carta -> Imagem-Booleano

;; Objetivo: esta função auxiliar recebe uma carta de Uno, verifica se a carta é especial do tipo PulaVez
;; e, caso seja, retorna a imagem que referencia esse tipo de carta, que pode ser impressa nos cantos
;; superior esquerdo e inferior direito da carta. Caso não seja, a função retorna valor lógico "falso".

;; Exemplos: (desenha-pulavez-canto vermelho-PulaVez) = .
;;           (desenha-pulavez-canto verde-Compra2) = #false
;;           (desenha-pulavez-canto azul-5) = #false

(define (desenha-pulavez-canto card)
  [cond
    [(string=? (carta-conteudo card) "PulaVez") (rotate -10(overlay (rotate -45 (rectangle 3 20 "solid" "white"))(overlay (circle 8.5 "solid" (carta-cor card))(circle 12 "solid" "white"))))]
    [else #false]])

;; Testes:
(check-expect (desenha-pulavez-canto amarelo-Inverte) #false)
(check-expect (desenha-pulavez-canto azul-5) #false)
(check-expect (desenha-pulavez-canto vermelho-4) #false)

;; DESENHA-PULAVEZ-CENTRO ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-pulavez-centro: Carta -> Imagem-Booleano

;; Objetivo: esta função auxiliar recebe uma carta de Uno, verifica se a carta é especial do tipo PulaVez e,
;; caso seja, retorna a imagem que referencia esse tipo de carta, que pode ser impressa no centro da carta.
;; Caso não seja, a função retorna valor lógico "falso".

;; Exemplos: (desenha-pulavez-centro vermelho-PulaVez) = .
;;           (desenha-pulavez-centro verde-Compra2) = #false
;;           (desenha-pulavez-centro azul-5) = #false

(define (desenha-pulavez-centro card)
  [cond
  [(string=? (carta-conteudo card) "PulaVez")(rotate -10(overlay (rotate -45 (rectangle 10 40 "solid" (carta-cor card)))(overlay (circle 20 "solid" "white")(circle 30 "solid" (carta-cor card)))))]
  [else #false]])

;; Testes:
(check-expect (desenha-pulavez-centro amarelo-Inverte) #false)
(check-expect (desenha-pulavez-centro azul-5) #false)
(check-expect (desenha-pulavez-centro vermelho-4) #false)

;; DESENHA-INVERTE-CENTRO1 ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-inverte-centro1: Carta -> Imagem-Booleano

;; Objetivo: esta função auxiliar recebe uma carta de Uno, verifica se a carta é especial do tipo Inverte
;; e, caso seja, retorna uma das imagens que referencia esse tipo de carta, a ser impressa no centro
;; da carta. Caso não seja, a função retorna valor lógico "falso".

;; Exemplos: (desenha-inverte-centro1 verde-Inverte) = .
;;           (desenha-inverte-centro1 verde-Compra2) = #false
;;           (desenha-inverte-centro1 azul-5) = #false

(define (desenha-inverte-centro1 card)
  [cond
    [(string=? (carta-conteudo card) "Inverte")(rotate -45 (above (triangle 30 "solid" (carta-cor card))(rectangle 15 28 "solid" (carta-cor card))))] 
    [else #false]])

;; Testes:
(check-expect (desenha-inverte-centro1 vermelho-PulaVez) #false)
(check-expect (desenha-inverte-centro1 azul-5) #false)
(check-expect (desenha-inverte-centro1 vermelho-4) #false)

;; DESENHA-INVERTE-CENTRO2 ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-inverte-centro2: Carta -> Imagem-Booleano

;; Objetivo: esta função auxiliar recebe uma carta de Uno, verifica se a carta é especial do tipo Inverte
;; e, caso seja, retorna uma das imagens que referencia esse tipo de carta, a ser impressa no centro
;; da carta. Caso não seja, a função retorna valor lógico "falso".

;; Exemplos: (desenha-inverte-centro2 verde-Inverte) = .
;;           (desenha-inverte-centro2 verde-Compra2) = #false
;;           (desenha-inverte-centro2 azul-5) = #false

(define (desenha-inverte-centro2 card)
  [cond
    [(string=? (carta-conteudo card) "Inverte")(rotate 135 (above (triangle 30 "solid" (carta-cor card))(rectangle 15 28 "solid" (carta-cor card))))] 
    [else #false]])

;; Testes:
(check-expect (desenha-inverte-centro2 vermelho-PulaVez) #false) 
(check-expect (desenha-inverte-centro2 azul-5) #false)
(check-expect (desenha-inverte-centro2 vermelho-4) #false)

;; DESENHA-NUM-CENTRO ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-num-centro: Carta -> Imagem-Booleano

;; Objetivo: esta função auxiliar recebe uma carta de UNO, verifica se a carta é uma carta de número
;; e, caso seja, retorna uma das imagens que referencia esse tipo de carta, a ser impressa no centro
;; da carta. Caso não seja, a função retorna valor lógico "falso".

;; Exemplos: (desenha-num-centro azul-5) = . 
;;           (desenha-num-centro verde-Compra2) = #false
;;           (desenha-num-centro verde-Inverte) = #false

(define (desenha-num-centro card)
  [cond
    [(number? (string->number (carta-conteudo card)))(rotate -10(text (carta-conteudo card) 100 (carta-cor card)))]
    [else #false]])

;; Testes:
(check-expect (desenha-num-centro vermelho-PulaVez) #false)
(check-expect (desenha-num-centro amarelo-Inverte) #false)
(check-expect (desenha-num-centro qualquer-TrocaCor) #false) 

;; DESENHA-NUM-CANTO ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-num-canto: Carta -> Imagem-Booleano

;; Objetivo: esta função auxiliar recebe uma carta de Uno, verifica se a carta é uma carta de número
;; e, caso seja, retorna uma das imagens que referencia esse tipo de carta, a ser impressa nos cantos
;; superior esquerdo e inferior direito da carta. Caso não seja, a função retorna valor lógico "falso".

;; Exemplos: (desenha-num-canto azul-5) = .  
;;           (desenha-num-canto verde-Compra2) = #false
;;           (desenha-num-canto verde-Inverte) = #false

(define (desenha-num-canto card)
  [cond
    [(number? (string->number (carta-conteudo card)))(rotate -10(text (carta-conteudo card) 30 "white"))]  
    [else #false]])

;; Testes:
(check-expect (desenha-num-canto vermelho-PulaVez) #false)
(check-expect (desenha-num-canto amarelo-Inverte) #false)
(check-expect (desenha-num-canto qualquer-TrocaCor) #false)

;;----------------------------------------------------------------------------------------------------DESAFIO---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; MOSTRA-JOGADA ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; mostra-jogada: Mão Carta -> Imagem

;; Objetivo: dada uma mão e uma carta, representando a carta da mesa, esta função gera uma imagem mostrando (de cima para baixo)
;; as cartas da mão, a carta da mesa e a carta selecionada para jogar, caso haja uma carta para jogar. Se não for possível jogar
;; nenhuma carta da mão, a saída será a imagem das cartas da mão, da carta da mesa e a mensagem "Jogada impossível". A análise é
;; feita de forma sequencial, ou seja, cada carta da mão tem prioridade sobre cartas em posições subsequentes.

;; Exemplos: (mostra-jogada mãoA azul-5) = .

;;           (mostra-jogada mãoB vermelho-5) = .

;;           (mostra-jogada mãoC vermelho-3) = .


(define (mostra-jogada hand card)
  [cond
    [(string? (define-jogada hand card)) (above(above (mostra-mão hand)(desenha-carta card))(text "Jogada impossível" 50 "black"))]
    [else (above(above (mostra-mão hand)(desenha-carta card))(desenha-carta(define-jogada hand card)))]]) 
  
;; MOSTRA-MÃO ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; mostra-mão: Mão -> Imagem

;; Objetivo: esta função recebe uma mão de cartas, e retorna o desenho de todas as cartas existentes
;; em cada posição da mão. Caso a posição em questão esteja livre, a função retorna o texto "Livre".

;; Exemplos: (mostra-mão mãoA) = .


;;           (mostra-mão mãoB) = .

;;           (mostra-mão mãoC) = .

(define (mostra-mão hand)
  (beside (testa-carta (mão-carta1 hand))(beside (testa-carta (mão-carta2 hand))(beside (testa-carta (mão-carta3 hand))(beside (testa-carta (mão-carta4 hand))(testa-carta (mão-carta5 hand)))))))

;; TESTA-CARTA ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; testa-carta: Carta-String -> Imagem

;; Objetivo: esta função auxiliar pode receber uma carta ou uma string. Caso receba uma carta,
;; a função retorna o desenho da carta. Caso receba uma string, a função retorna o texto "Livre".

;; Exemplos: (testa-carta qualquer-Compra4) = . 
;;                     (testa-carta azul-0) = .
;;                    (testa-carta "livre") = .

(define (testa-carta card)
  [cond
    [(string? card)(rotate 90(text "Livre" 50 "black"))]
    [else (desenha-carta card)]])
