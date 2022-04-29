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
(define azul-8 (make-carta-numero "azul" 8))
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
(define azul-9 (make-carta-numero "azul"98))
(define vermelho-7 (make-carta-numero "vermelho" 7))
(define vermelho-8 (make-carta-numero "vermelho" 8))
(define amarelo-PulaVez (make-carta-especial "amarelo" "PulaVez"))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 01---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; LISTADECARTAS ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; Uma ListaDeCartas é

;; 1. A lista vazia empty

;; ou

;; 2. (cons c ldc), onde

;; c: um elemento do conjunto Carta

;; ldc: ListaDeCartas

;; Exemplos de listas de cartas:
(define listadecartas1 (cons qualquer-Compra4(cons verde-0(cons verde-1(cons verde-Compra2(cons vermelho-5(cons amarelo-2 empty)))))))
(define listadecartas2 (cons amarelo-Inverte(cons azul-2(cons azul-7(cons vermelho-PulaVez(cons amarelo-PulaVez(cons vermelho-8 empty)))))))
(define listadecartas3 (cons qualquer-TrocaCor(cons vermelho-1(cons amarelo-5(cons azul-Compra2(cons verde-5(cons vermelho-5 empty)))))))
(define listadecartas4 (cons azul-PulaVez(cons azul-Inverte(cons amarelo-Compra2(cons azul-5(cons vermelho-Inverte(cons vermelho-Compra2 empty)))))))

;; -----------------
;; TIPO JOGADOR:
;; -----------------
  
(define-struct jogador (nome listadecartas pontuacao))
  
;; Um elemento do conjunto Jogador é
;; (make-jogador um-nome uma-listadecartas uma-pontuacao) onde:

;; um-nome: String, representa o nome do jogador em questão

;; uma-listadecartas: ListaDeCartas, representa as cartas que o jogador possui na mão

;; uma-pontuacao: Número, representa a pontuação do jogador no jogo UNO

;; Exemplos de elementos do conjunto Jogador:
(define Jader (make-jogador "Jader" listadecartas1 44))
(define Idemir (make-jogador "Idemir" listadecartas2 55))
(define Elmar (make-jogador "Elmar" listadecartas3 66))
(define Estevao (make-jogador "Estevao" listadecartas4 77)) 

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; INSERE-CARTA ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; insere-carta: Jogador Carta -> Jogador

;; Objetivo: esta função recebe um jogador e uma carta que foi comprada por esse jogador durante o jogo de UNO,
;; retornando o registro do jogador com a carta que foi comprada na primeira posição da lista de cartas que
;; representa as cartas que estão em sua mão.

;; Exemplos: (insere-carta Jader azul-5) = (make-jogador "Jader" (cons azul-5(cons qualquer-Compra4(cons verde-0(cons verde-1(cons verde-Compra2(cons vermelho-5(cons amarelo-2 empty))))))) 78)
;;           (insere-carta Idemir vermelho-1) = (make-jogador "Idemir" (cons vermelho-1 (cons amarelo-Inverte(cons azul-2(cons azul-7(cons vermelho-PulaVez(cons amarelo-PulaVez(cons vermelho-8 empty))))))) 77)
;;           (insere-carta Elmar amarelo-Compra2) = (make-jogador "Elmar" (cons amarelo-Compra2(cons qualquer-TrocaCor(cons vermelho-1(cons amarelo-5(cons azul-Compra2(cons verde-5(cons vermelho-5 empty))))))) 54) 

(define (insere-carta player card)
  (make-jogador (jogador-nome player)(cons card(jogador-listadecartas player))(jogador-pontuacao player)))

;; Testes:
(check-expect (insere-carta Jader azul-5) (make-jogador "Jader" (cons azul-5(cons qualquer-Compra4(cons verde-0(cons verde-1(cons verde-Compra2(cons vermelho-5(cons amarelo-2 empty))))))) 44))
(check-expect (insere-carta Idemir vermelho-1) (make-jogador "Idemir" (cons vermelho-1 (cons amarelo-Inverte(cons azul-2(cons azul-7(cons vermelho-PulaVez(cons amarelo-PulaVez(cons vermelho-8 empty))))))) 55))
(check-expect (insere-carta Elmar amarelo-Compra2) (make-jogador "Elmar" (cons amarelo-Compra2(cons qualquer-TrocaCor(cons vermelho-1(cons amarelo-5(cons azul-Compra2(cons verde-5(cons vermelho-5 empty))))))) 66))
  
;;----------------------------------------------------------------------------------------------------EXERCÍCIO 03---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; SELECIONA-CARTAS-COR ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; seleciona-cartas-cor: ListaDeCartas String -> ListaDeCartas

;; Objetivo: esta função recebe uma lista de cartas e uma cor,
;; e retorna uma lista contendo somente as cartas da lista
;; recebida que possuem uma cor compatível com a cor informada.
;; Assume-se que a cor "qualquer" é compatível com qualquer cor.

;; Exemplos: (seleciona-cartas-cor listadecartas1 "verde") = (cons (make-carta-especial "qualquer" "Compra4")(cons (make-carta-numero "verde" 0)(cons (make-carta-numero "verde" 1)(cons (make-carta-especial "verde" "Compra2") empty))))
;;           (seleciona-cartas-cor listadecartas2 "azul") = (cons (make-carta-numero "azul" 2) (cons (make-carta-numero "azul" 7) empty))
;;           (seleciona-cartas-cor listadecartas4 "vermelho") = (cons (make-carta-especial "vermelho" "Inverte") (cons (make-carta-especial "vermelho" "Compra2") empty))

(define (seleciona-cartas-cor list color)
  [cond
    [(empty? list) empty] 
    [(or (string=? (mostra-cor (first list)) "qualquer")(string=? (mostra-cor (first list)) color))(cons (first list)(seleciona-cartas-cor (rest list) color))] 
    [else (seleciona-cartas-cor (rest list) color)]])

;; Testes:
(check-expect (seleciona-cartas-cor listadecartas1 "verde")(cons (make-carta-especial "qualquer" "Compra4")(cons (make-carta-numero "verde" 0)(cons (make-carta-numero "verde" 1)(cons (make-carta-especial "verde" "Compra2") empty)))))
(check-expect (seleciona-cartas-cor listadecartas2 "azul")(cons (make-carta-numero "azul" 2) (cons (make-carta-numero "azul" 7) empty)))
(check-expect (seleciona-cartas-cor listadecartas4 "vermelho")(cons (make-carta-especial "vermelho" "Inverte") (cons (make-carta-especial "vermelho" "Compra2") empty)))
             
;; MOSTRA-COR =====================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; mostra-cor: Carta -> String

;; Objetivo: esta função auxiliar recebe uma carta qualquer do jogo UNO e retorna a sua cor.

;; Exemplos: (mostra-cor verde-0) = "verde"
;;           (mostra-cor qualquer-Compra4) = "qualquer"
;;           (mostra-cor azul-2) = "azul"

(define (mostra-cor card)
  [cond
    [(carta-numero? card)(carta-numero-cor card)]
    [(carta-especial? card)(carta-especial-cor card)]])

;; Testes:
(check-expect (mostra-cor verde-0) "verde")
(check-expect (mostra-cor qualquer-Compra4) "qualquer")
(check-expect (mostra-cor azul-2) "azul")

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 04---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; VENCEDOR =====================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; vencedor: Jogador Jogador -> String

;; Objetivo: esta função recebe os nomes de dois jogadores de UNO, e verifica qual dos dois
;; venceu o jogo. Para isso, a função soma à pontuação de cada jogador os pontos referentes
;; à lista de cartas que ele tem na mão e verifica quem tem a menor pontuação (como o objetivo
;; é ficar com menos cartas, o jogador com a menor pontuação ganha). A função devolve apenas
;; o nome do vencedor. Se os dois tiverem a mesma pontuação, a função devolve a mensagem "Empate".

;; Exemplos: (vencedor Jader Idemir) = "Jader"
;;           (vencedor Idemir Elmar) = "Idemir"
;;           (vencedor Elmar Estevao) = "Elmar"

(define (vencedor player1 player2)
  [cond
    [(< (calcula-pontuacao-final player1)(calcula-pontuacao-final player2)) (jogador-nome player1)]
    [(< (calcula-pontuacao-final player2)(calcula-pontuacao-final player1)) (jogador-nome player2)] 
    [else "Empate"]]) 

;; Testes:
(check-expect (vencedor Jader Idemir) "Jader")
(check-expect (vencedor Idemir Elmar) "Idemir")
(check-expect (vencedor Elmar Estevao) "Elmar")

;; CALCULA-PONTUACAO-FINAL ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; calcula-pontuacao-final: Jogador -> Número

;; Objetivo: esta função auxiliar recebe o nome de um jogador de UNO,
;; e retorna um número representando a sua pontuação final. Para isso,
;; a função soma à pontuação do jogador os pontos referentes à lista
;; de cartas que ele tem na mão.

;; Exemplos: (calcula-pontuacao-final Jader) = 122
;;           (calcula-pontuacao-final Idemir) = 132
;;           (calcula-pontuacao-final Elmar) = 152

(define (calcula-pontuacao-final player)
  (+ (calcula-pontos-mao-jogador player)(jogador-pontuacao player)))
  
;; Testes:
(check-expect (calcula-pontuacao-final Jader) 122)
(check-expect (calcula-pontuacao-final Idemir) 132)
(check-expect (calcula-pontuacao-final Elmar) 152)
  
;; CALCULA-PONTOS-MAO-JOGADOR ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; calcula-pontos-mao-jogador: Jogador -> Número

;; Objetivo: esta função auxiliar recebe um jogador de UNO, e retorna um número representando
;; a pontuação do jogador, que é obtida por meio da soma da pontuação de cada carta que o
;; jogador possui em sua mão.
  
;; Exemplos: (calcula-pontos-mao-jogador Jader) = 78
;;           (calcula-pontos-mao-jogador Idemir) = 77
;;           (calcula-pontos-mao-jogador Elmar) = 86

(define (calcula-pontos-mao-jogador player)
  (calcula-ponto-lista (jogador-listadecartas player)))

;; Testes:
(check-expect (calcula-pontos-mao-jogador Jader) 78)
(check-expect (calcula-pontos-mao-jogador Idemir) 77)
(check-expect (calcula-pontos-mao-jogador Elmar) 86) 


;; CALCULA-PONTO-LISTA ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; calcula-ponto-lista: ListaDeCartas -> Número

;; Objetivo: esta função auxiliar recebe uma lista de cartas do jogo UNO, e retorna a soma da pontuação de cada carta da lista.

;; Exemplos: (calcula-ponto-lista listadecartas1) = 78
;;           (calcula-ponto-lista listadecartas2) = 77
;;           (calcula-ponto-lista listadecartas3) = 86

(define (calcula-ponto-lista list)
  [cond
  [(empty? list) 0]
  [else (+ (calcula-ponto-carta (first list))(calcula-ponto-lista (rest list)))]])

;; Testes:
(check-expect (calcula-ponto-lista listadecartas1) 78)
(check-expect (calcula-ponto-lista listadecartas2) 77)
(check-expect (calcula-ponto-lista listadecartas3) 86)
  
;; CALCULA-PONTO-CARTA ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; calcula-ponto-carta: Carta -> Número

;; Objetivo: esta função auxiliar recebe uma carta do jogo UNO, e retorna a pontuação representada pela carta.
;; Cartas númericas têm pontuação igual ao seu número, cartas do tipos Compra2, Inverte, PulaVez têm pontuação
;; de 20 pontos e cartas do tipo TrocaCor e Compra4 têm pontuação de 50 pontos.

;; Exemplos: (calcula-ponto-carta vermelho-8) = 8
;;           (calcula-ponto-carta verde-Compra2) = 20
;;           (calcula-ponto-carta qualquer-Compra4) = 50
 
(define (calcula-ponto-carta card)
  [cond
    [(carta-numero? card) (carta-numero-valor card)] 
    [(or (string=? (carta-especial-tipo card) "TrocaCor")(string=? (carta-especial-tipo card) "Compra4")) 50]
    [else 20]])

;; Testes:
(check-expect (calcula-ponto-carta vermelho-8) 8)
(check-expect (calcula-ponto-carta verde-Compra2) 20)
(check-expect (calcula-ponto-carta qualquer-Compra4) 50)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; TIPO CARTA-STRING ============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; Um elemento carta-string do conjunto Carta-String pode ser

;; 1. Um elemento do conjunto Carta;

;; ou

;; 2. Um elemento do conjunto String.

;; Exemplos de elementos do conjunto Carta-String:
(define amarelo-9 (make-carta-numero "amarelo" 9))
(define vermelho-9 (make-carta-numero "vermelho" 9))
(define verde-PulaVez (make-carta-especial "verde" "PulaVez"))
(define constanteN "N")

;; JOGA ==========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; joga: Carta Jogador -> Carta-String

;; Objetivo: esta função recebe uma carta de UNO da mesa e um jogador de UNO, e retorna
;; uma carta da mão do jogador que pode ser jogada, de acordo com as regras do jogo. A
;; análise é feita de forma sequencial, ou seja, cada carta da mão tem prioridade sobre
;; cartas em posições subsequentes. Caso nenhuma carta possa ser jogada, a função retorna
;; a mensagem "Jogada impossível".

;; Exemplos: (joga verde-5 Jader) = qualquer-Compra4
;;           (joga vermelho-5 Estevao) = azul-5
;;           (joga verde-0 Idemir) = "Jogada impossível"

(define (joga card player)
  [cond
    [(empty? (seleciona-cartas-compativeis (jogador-listadecartas player) card)) "Jogada impossível"]
    [else (first (seleciona-cartas-compativeis (jogador-listadecartas player) card))]])

;; Testes:
(check-expect (joga verde-5 Jader) qualquer-Compra4)
(check-expect (joga vermelho-5 Estevao) azul-5)
(check-expect (joga verde-0 Idemir) "Jogada impossível")
     
;; SELECIONA-CARTAS-COMPATIVEIS ==================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; seleciona-cartas-compativeis: ListaDeCartas Carta -> ListaDeCartas

;; Objetivo: esta função auxiliar recebe uma lista de cartas e uma carta,
;; representando a carta da mesa, e retorna uma outra lista contendo
;; somente as cartas da primeira lista que podem ser jogadas sobre a carta
;; da mesa, segundo as regras do jogo UNO.

;; Exemplos: (seleciona-cartas-compativeis listadecartas1 verde-5) = (cons qualquer-Compra4(cons verde-0(cons verde-1(cons verde-Compra2(cons vermelho-5 empty)))))
;;           (seleciona-cartas-compativeis listadecartas2 azul-PulaVez) = (cons azul-2(cons azul-7(cons vermelho-PulaVez(cons amarelo-PulaVez empty))))
;;           (seleciona-cartas-compativeis listadecartas3 azul-5) = (cons qualquer-TrocaCor(cons amarelo-5(cons azul-Compra2(cons verde-5(cons vermelho-5 empty)))))

(define (seleciona-cartas-compativeis list card)
  [cond
    [(empty? list) empty]
    [(testa-jogada card (first list))(cons (first list)(seleciona-cartas-compativeis (rest list) card))]
    [else (seleciona-cartas-compativeis (rest list) card)]])

;; Testes:
(check-expect (seleciona-cartas-compativeis listadecartas1 verde-5)(cons qualquer-Compra4(cons verde-0(cons verde-1(cons verde-Compra2(cons vermelho-5 empty))))))
(check-expect (seleciona-cartas-compativeis listadecartas2 azul-PulaVez)(cons azul-2(cons azul-7(cons vermelho-PulaVez(cons amarelo-PulaVez empty)))))
(check-expect (seleciona-cartas-compativeis listadecartas3 azul-5)(cons qualquer-TrocaCor(cons amarelo-5(cons azul-Compra2(cons verde-5(cons vermelho-5 empty))))))

;; TESTA-JOGADA =================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; testa-jogada: Carta Carta-String -> Booleano

;; Objetivo: esta função auxiliar recebe uma carta, representando a carta da mesa, e uma outra carta ou uma string
;; representando a carta da mão ou o fato de não haver carta na mão (no caso de ser uma string), nesta ordem, e
;; verifica se é possível jogar a carta da mão de acordo com as regras do jogo UNO, retornando o valor lógico
;; "falso" caso seja impossível e o valor lógico "verdadeiro" caso seja possível.

;; Exemplos: (testa-jogada qualquer-Compra4 vermelho-4) = #true
;;           (testa-jogada azul-5 "maovazia") = #false
;;           (testa-jogada azul-5 vermelho-5) = #true

(define (testa-jogada carta_da_mesa carta_da_mao)
  (cond
    [(string? carta_da_mao) #false]
    [(string=? (mostra-cor carta_da_mao) "qualquer") #true]
    [(string=? (mostra-cor carta_da_mesa) "qualquer") #true]
    [(string=? (mostra-cor carta_da_mesa)(mostra-cor carta_da_mao)) #true] 
    [(string=? (carta-conteudo carta_da_mesa)(carta-conteudo carta_da_mao)) #true]
    [else #false])) 
                
;; Testes:
(check-expect (testa-jogada qualquer-Compra4 vermelho-4) #true)
(check-expect (testa-jogada azul-5 "maovazia") #false)
(check-expect (testa-jogada azul-5 vermelho-5) #true)

;; CARTA-CONTEUDO ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; carta-conteudo: Carta -> String

;; Objetivo: esta função auxiliar recebe uma carta qualquer, verifica se ela é uma carta especial ou uma
;; carta de número e retorna o conteúdo da carta em questão, que pode ser um número convertido em string
;; (quando a carta em questão é uma carta de número) ou uma string informando o tipo da carta (quando a
;; carta em questão é uma carta especial).

;; Exemplos: (carta-conteudo verde-1) = "1"
;;           (carta-conteudo vermelho-3) = "3"
;;           (carta-conteudo verde-Compra2) = "Compra2"

(define (carta-conteudo carta_em_questao)
  (cond
    [(carta-numero? carta_em_questao)(number->string(carta-numero-valor carta_em_questao))]
    [(carta-especial? carta_em_questao)(carta-especial-tipo carta_em_questao)]))

;; Testes:
(check-expect (carta-conteudo verde-1) "1")
(check-expect (carta-conteudo vermelho-3) "3")
(check-expect (carta-conteudo verde-Compra2) "Compra2")

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 06---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; CONSTANTES PARA IMAGENS ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; circulo-marrom: constante utilizada para desenhar um círculo marrom
(define circulo-marrom (circle 150 "solid" "brown"))

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

;; Um elemento imagem-booleano do conjunto Imagem-Booleano pode ser

;; 1. Um elemento do conjunto Imagem;

;; ou

;; 2. Um elemento do conjunto Booleano.

;; Exemplos de elementos do conjunto Imagem-Booleano:
(define quadrado-laranja (rectangle 77 77 "solid" "orange")) 
(define circulo-roxo (circle 77 "solid" "purple"))
(define estrela-amarela (star 40 "solid" "gold"))
(define constante-false #false)
(define constante-true #true)

;; MOSTRA-JOGADA =====================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; mostra-jogada: Carta Jogador -> Imagem

;; Objetivo: dados a carta da mesa e um jogador, esta função mostra a jogada escolhida (gerando uma imagem com
;; todas as cartas da mão, a carta da mesa sobre um círculo marrom e a carta selecionada para jogar sobre a carta
;; da mesa). O nome do jogador que possui as cartas e um texto referenciando a carta introduzindo a carta selecionada
;; ("Carta selecionada:") também é impresso. Caso não seja possível fazer nenhuma jogada, a função retorna o texto
;; "Jogada impossível", no lugar onde seria mostrada a carta a ser jogada sobre a mesa.

;; Exemplos:      (mostra-jogada verde-5 Jader) = .;;           (mostra-jogada vermelho-5 Estevao) = .
;;               (mostra-jogada verde-0 Idemir) = .


(define (mostra-jogada card player)  
  [cond
    [(string? (joga card player))(above/align "left"(text (jogador-nome player) 30 "black") (beside (desenha-cartas-mao (jogador-listadecartas player))(beside(overlay (desenha-carta card) circulo-marrom)(text "Jogada impossível" 30 "black"))))]
    [else (above/align "left"(text (jogador-nome player) 30 "black") (beside (desenha-cartas-mao (jogador-listadecartas player))(beside(overlay (desenha-carta card)circulo-marrom)(beside (text "Carta selecionada:" 30 "black")(desenha-carta (joga card player))))))]])

;; DESENHA-CARTAS-MAO ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-cartas-mao: ListaDeCartas -> Imagem

;; Objetivo: dada uma lista de cartas, esta função auxiliar gera uma imagem com cada uma das cartas da lista lado a lado.

;; Exemplos: (desenha-cartas-mao listadecartas1) = .

;;           (desenha-cartas-mao listadecartas2) = .

;;           (desenha-cartas-mao listadecartas4) = .

(define (desenha-cartas-mao lista)
  [cond
    [(empty? lista) empty-image]
    [else (beside (desenha-carta (first lista))(desenha-cartas-mao (rest lista)))]])

;; DESENHA-CARTA ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-carta: Carta -> Imagem

;; Objetivo: esta função auxiliar recebe uma carta de UNO e retorna uma imagem representando a aparência real dessa carta.

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

;; Objetivo: esta função auxiliar recebe uma carta de UNO) e retorna uma imagem representando o fundo dessa carta,
;; ou seja, a imagem na qual outra imagem representando o tipo da carta pode ser impressa.

;; Exemplos:    (desenha-background verde-Compra2) = . 
;;           (desenha-background vermelho-PulaVez) = .
;;                     (desenha-background azul-5) = .

(define (desenha-background card) 
  (overlay (rotate -35 (ellipse 85 135 "solid" "white")) (overlay (rectangle 100 175 "solid" (carta-cor card)) (rectangle 110 185 "outline" (carta-cor card)))))

;; DESENHA-COMPRA2 ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-compra2: Carta -> Imagem-Booleano

;; Objetivo: esta função auxiliar recebe uma carta de UNO, verifica se a carta é especial
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

;; Objetivo: esta função auxiliar recebe uma carta de UNO, verifica se a carta é especial do tipo PulaVez
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

;; Objetivo: esta função auxiliar recebe uma carta de UNO, verifica se a carta é especial do tipo PulaVez e,
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

;; Objetivo: esta função auxiliar recebe uma carta de UNO, verifica se a carta é especial do tipo Inverte
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

;; Objetivo: esta função auxiliar recebe uma carta de UNO, verifica se a carta é especial do tipo Inverte
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

;; Objetivo: esta função auxiliar recebe uma carta de UNO, verifica se a carta é uma carta de número
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

;; CARTA-COR =====================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; carta-cor: Carta -> String

;; Objetivo: esta função auxiliar recebe uma carta qualquer do jogo UNO e retorna a sua cor, em inglês. Ou seja, as cartas das cores "azul"
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

;; Objetivo: esta função auxiliar recebe uma carta especial do jogo UNO (devem ser informados a cor e o tipo) e retorna a sua cor,
;; em inglês. Especificamente para a cor "amarelo", a função retorna "gold". Portanto, as cartas das cores  "azul", "verde", "amarelo"
;; ou "vermelho" devem retornar as cores "blue", "green", "gold" e "red", respectivamente. Se a carta possuir a cor "qualquer", devolve "black".
               
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

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 07---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; MOSTRA-JOGADAS-POSSÍVEIS ==================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; mostra-jogadas-possíveis: Carta Jogador -> Imagem

;; Objetivo: esta função recebe a carta da mesa e um jogador, e mostra a lista de cartas que poderiam ser jogadas
;; (gera uma imagem com o nome do jogador, as cartas da mão, a carta da mesa, e as cartas possíveis de serem jogadas).
;; Se não for possível jogar nenhuma carta da mão, a saída será a imagem do nome do jogador, da mão, da carta da mesa e
;; o texto "Jogada impossível".

;; Exemplos:      (mostra-jogadas-possíveis verde-5 Jader) = .

;;           (mostra-jogadas-possíveis vermelho-5 Estevao) = .

;;               (mostra-jogadas-possíveis verde-0 Idemir) = .

(define (mostra-jogadas-possíveis card player) 
  [cond
    [(string? (joga card player)) (mostra-jogada card player)]  
    [else (above/align "left"(text (jogador-nome player) 30 "black") (beside (desenha-cartas-mao (jogador-listadecartas player))(desenha-mesa-cartas-possiveis card player)))]]) 

;; DESENHA-MESA-CARTAS-POSSIVEIS ==================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; desenha-mesa-cartas-possiveis: Carta Jogador -> Imagem-Booleano

;; Objetivo: esta função auxiliar recebe a carta da mesa e um jogador, e retorna uma imagem com
;; a carta da mesa sobre um círculo marrom e, ao lado, as cartas da mão do jogador que podem ser
;; jogadas sobre a carta da mesa, segundo as regras do jogo UNO. Caso o jogador não possua nenhuma
;; carta possível de ser jogada, a função retorna valor lógico falso.

;; Exemplos:                    (desenha-mesa-cartas-possiveis) = .

;;           (desenha-mesa-cartas-possiveis vermelho-5 Estevao) = .

;;           (desenha-mesa-cartas-possiveis verde-0 Idemir) = #false

(define (desenha-mesa-cartas-possiveis card player)
  [cond
    [(string? (joga card player)) #false]
    [else (beside(overlay (desenha-carta card)circulo-marrom)(desenha-cartas-mao (seleciona-cartas-compativeis (jogador-listadecartas player) card)))]]) 

;; Testes:
(check-expect (desenha-mesa-cartas-possiveis verde-0 Idemir) #false)
(check-expect (desenha-mesa-cartas-possiveis verde-5 Idemir) #false)
(check-expect (desenha-mesa-cartas-possiveis verde-1 Estevao) #false)
