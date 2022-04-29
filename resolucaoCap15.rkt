;; -----------------------------------
;; TIPO LISTA-CONTEUDO:
;; -----------------------------------
;; Uma Lista-conteudo é

;; 1. empty (vazia), ou

;; 2. (cons p lc), onde

;; p : String
;; lc : Lista-conteúdo, ou

;; 3. (cons i lc), onde

;; i : Imagem
;; lc : Lista-conteúdo, ou

;; 4. (cons p lc), onde

;; p : Pag-web
;; lc : Lista-conteúdo.

;; ----------------------
;; TIPO PAG-WEB
;; ----------------------

(define-struct pag-web (nome conteudo))

;; Um elemento do conjunto Pag-web é uma estrutura
;; (make-pag-web um-nome um-cont) onde

;; um-nome: String, é o nome da página e

;; um-cont: Lista-conteudo, é uma lista de conteúdo de páginas-web.

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 01---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; CONSTANTES PARA IMAGENS ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; circulo-vermelho: constante utilizada para desenhar um círculo vermelho
(define circulo-vermelho (circle 38.5 "solid" "red")) 

;; quadrado-laranja: constante utilizada para desenhar um quadrado laranja
(define quadrado-laranja (rectangle 77 77 "solid" "orange"))

;; circulo-azul: constante utilizada para desenhar um círculo azul
(define circulo-azul (circle 38.5 "solid" "blue"))

;; estrela-amarela: constante utilizada para desenhar uma estrela amarela
(define estrela-amarela (star 50 "solid" "yellow"))

;; elipse-azul: constante utilizada para desenhar uma elipse azul
(define elipse-azul (rotate -35 (ellipse 55 80 "solid" "blue")))

;; circulo-verde: constante utilizada para desenhar um círculo verde
(define circulo-verde (circle 38.5 "solid" "lime"))

;; quadrado-amarelo: constante utilizada para desenhar um quadrado amarelo
(define quadrado-amarelo (rectangle 77 77 "solid" "yellow"))

;; circulo-preto: constante utilizada para desenhar um círculo preto
(define circulo-preto (circle 38.5 "solid" "black"))

;; estrela-turquesa: constante utilizada para desenhar uma estrela turquesa
(define estrela-turquesa (star 50 "solid" "turquoise"))

;; elipse-vermelha: constante utilizada para desenhar uma elipse vermelha
(define elipse-vermelha (rotate -35 (ellipse 55 80 "solid" "red")))

;; retangulo-preto-menorque: constante utilizada para desenhar o sinal < dentro de um retangulo preto
(define retangulo-preto-menorque (overlay (text "<" 60 "white")(rectangle 45 78 "solid" "black")))

;; retangulo-preto-maiorque: constante utilizada para desenhar o sinal > dentro de um retangulo preto
(define retangulo-preto-maiorque (overlay (text ">" 60 "white")(rectangle 45 78 "solid" "black")))

;; elipse-verde: constante utilizada para desenhar uma elipse verde
(define elipse-verde(rotate -35 (ellipse 55 80 "solid" "lime")))

;; circulo-turquesa: constante utilizada para desenhar um círculo turquesa
(define circulo-turquesa (circle 38.5 "solid" "turquoise"))

;; quadrado-marrom: constante utilizada para desenhar um quadrado marrom
(define quadrado-marrom (rectangle 77 77 "solid" "brown"))

;; elipse-preta: constante utilizada para desenhar uma elipse preta
(define elipse-preta (rotate -35 (ellipse 55 80 "solid" "black")))

;; estrela-vermelha: constante utilizada para desenhar uma estrela vermelha
(define estrela-vermelha (star 50 "solid" "red"))

;; circulo-laranja: constante utilizada para desenhar um círculo azul
(define circulo-laranja (circle 38.5 "solid" "orange"))

;; circulo-verde: constante utilizada para desenhar um círculo azul
(define circulo-marrom (circle 38.5 "solid" "brown"))

;; ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; Exemplos de elementos do conjunto Lista-conteudo:
(define conteudos-vazia empty)
(define conteudos1 (cons "Engineering" (cons estrela-amarela (cons "Translation" (cons quadrado-laranja (cons "Math" empty))))))
(define conteudos2 (cons "Science" (cons circulo-vermelho (cons "Exercises" (cons elipse-azul (cons "Chemistry" empty))))))
(define conteudos3 (cons "Chess" (cons estrela-turquesa (cons "PaulMorphy" (cons circulo-verde(cons "Zwischenzug" empty))))))

;; Exemplos de elementos do conjunto Pag-web:
(define pagweb0 (make-pag-web "ZeroClub" conteudos-vazia))
(define pagweb1 (make-pag-web "EngineeringClub" conteudos1))
(define pagweb2 (make-pag-web "ScienceClub" conteudos2))
(define pagweb3 (make-pag-web "ChessClub" conteudos3))

;; Exemplos de elementos do conjunto Lista-conteudo:
(define conteudos4 (cons "EngineeringScience" (cons elipse-vermelha (cons pagweb1 (cons pagweb2 (cons circulo-preto empty))))))
(define conteudos5 (cons "ScienceChess" (cons quadrado-amarelo (cons pagweb0 (cons circulo-vermelho empty)))))

;; Exemplos de elementos do conjunto Pag-web:
(define pagweb4 (make-pag-web "Knowledge" conteudos4))
(define pagweb5 (make-pag-web "Games" conteudos5))

;; Outros exemplos de elementos dos conjuntos Pag-web e Lista-conteudo:
(define conteudos12 (cons elipse-verde (cons "Green" (cons "Verde" empty))))
(define pagweb12 (make-pag-web "Twelve" conteudos12))
(define conteudos11 (cons pagweb12 (cons "Turquoise" (cons "Turquesa" (cons circulo-turquesa empty)))))
(define pagweb11 (make-pag-web "Eleven" conteudos11))
(define conteudos10 (cons quadrado-marrom (cons "Brown" (cons "Marrom" empty))))
(define pagweb10 (make-pag-web "Ten" conteudos10))
(define conteudos7 (cons elipse-preta (cons "Black" (cons "Preto" empty))))
(define pagweb7 (make-pag-web "Seven" conteudos7))
(define conteudos9 (cons pagweb11 (cons estrela-vermelha (cons "Star" (cons "Estrela" (cons pagweb10 empty))))))
(define pagweb9 (make-pag-web "Nine" conteudos9))
(define conteudos8 (cons circulo-laranja (cons pagweb9 empty)))
(define pagweb8 (make-pag-web "Eight" conteudos8))
(define conteudos6 (cons pagweb7 (cons circulo-verde (cons pagweb8 empty))))
(define pagweb6 (make-pag-web "Six" conteudos6))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; LISTA-PALAVRAS ====================================================================================================================================================================================================================================================================================

;; lista-palavras: Pag-web -> Lista-conteudo

;; Objetivo: dada uma página da web, esta função devolve a lista de palavras
;; que a página contém, sem considerar suas sub-páginas. Caso a página em
;; questão não possua nenhuma palavra, a função retorna uma lista vazia.

;; Exemplos: (lista-palavras pagweb0) = empty
;;           (lista-palavras pagweb1) = (cons "Engineering" (cons "Translation" (cons "Math" empty)))
;;           (lista-palavras pagweb2) = (cons "Science" (cons "Exercises" (cons "Chemistry" empty)))
;;           (lista-palavras pagweb3) = (cons "Chess" (cons "PaulMorphy" (cons "Zwischenzug" empty)))
;;           (lista-palavras pagweb4) = (cons "EngineeringAndScience" empty)
;;           (lista-palavras pagweb5) = (cons "ScienceAndChess" empty)

(define (lista-palavras page)
  (analisa-lista-conteudo (pag-web-conteudo page)))

;; Testes:
(check-expect (lista-palavras pagweb0) empty)
(check-expect (lista-palavras pagweb1) (cons "Engineering" (cons "Translation" (cons "Math" empty))))
(check-expect (lista-palavras pagweb2) (cons "Science" (cons "Exercises" (cons "Chemistry" empty))))
(check-expect (lista-palavras pagweb3) (cons "Chess" (cons "PaulMorphy" (cons "Zwischenzug" empty))))
(check-expect (lista-palavras pagweb4) (cons "EngineeringScience" empty))
(check-expect (lista-palavras pagweb5) (cons "ScienceChess" empty))

;; ANALISA-LISTA-CONTEUDO ====================================================================================================================================================================================================================================================================================

;; analisa-lista-conteudo: Lista-conteudo -> Lista-conteudo

;; Objetivo: esta função auxiliar recebe uma lista de conteúdos, retornando
;; uma lista contendo somente as strings da lista fornecida. Caso a função
;; receba uma lista vazia, ela retorna uma lista vazia.

;; Exemplos: (analisa-lista-conteudo conteudos-vazia) = empty
;;           (analisa-lista-conteudo conteudos1) = (cons "Engineering" (cons "Translation" (cons "Math" empty)))
;;           (analisa-lista-conteudo conteudos2) = (cons "Science" (cons "Exercises" (cons "Chemistry" empty)))
;;           (analisa-lista-conteudo conteudos3) = (cons "Chess" (cons "PaulMorphy" (cons "Zwischenzug" empty)))
;;           (analisa-lista-conteudo conteudos4) = (cons "EngineeringAndScience" empty)
;;           (analisa-lista-conteudo conteudos5) = (cons "ScienceAndChess" empty)


(define (analisa-lista-conteudo list)
  [cond
    [(empty? list) empty]
    [(string? (first list)) (cons (first list) (analisa-lista-conteudo (rest list)))] 
    [else (analisa-lista-conteudo (rest list))]])

;; Testes:
(check-expect (analisa-lista-conteudo conteudos-vazia) empty)
(check-expect (analisa-lista-conteudo conteudos1) (cons "Engineering" (cons "Translation" (cons "Math" empty))))
(check-expect (analisa-lista-conteudo conteudos2) (cons "Science" (cons "Exercises" (cons "Chemistry" empty))))
(check-expect (analisa-lista-conteudo conteudos3) (cons "Chess" (cons "PaulMorphy" (cons "Zwischenzug" empty))))
(check-expect (analisa-lista-conteudo conteudos4) (cons "EngineeringScience" empty)) 
(check-expect (analisa-lista-conteudo conteudos5) (cons "ScienceChess" empty)) 

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 03---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; MOSTRA-IMAGENS ====================================================================================================================================================================================================================================================================================

;; mostra-imagens: Pag-web -> Imagem

;; Objetivo: esta função recebe uma página web, e retorna uma imagem contendo as imagens contidas
;; na página e em suas sub-páginas, lado a lado. Acima de cada imagem, será impresso o nome da
;; página em que a imagem aparece, usando fonte de tamanho 15 e cor preta. Caso a página não possua
;; imagens, a função retorna uma imagem vazia.

;; Exemplos: (mostra-imagens pagweb0) = empty-image
;;           (mostra-imagens pagweb3) = .
;;           (mostra-imagens pagweb4) = .
;;           (mostra-imagens pagweb5) = .

(define (mostra-imagens page)
  (analisa-lista-imagens page (pag-web-conteudo page)))

;; Testes:
;;(check-expect (mostra-imagens pagweb0) empty-image)
;;(check-expect (mostra-imagens pagweb3) .)
;;(check-expect (mostra-imagens pagweb4) .)
;;(check-expect (mostra-imagens pagweb5) .) 

;; ANALISA-LISTA-IMAGENS ====================================================================================================================================================================================================================================================================================

;; analisa-lista-imagens: Pag-web Lista-conteudo -> Imagem

;; Objetivo: esta função auxiliar recebe uma página da web e uma lista de conteúdos, retornando uma
;; imagem contendo todas as imagens da lista e das sub-páginas existentes na lista. Acima da imagem,
;; será impresso um texto informando o nome da página da web que contém a respectiva imagem, usando fonte
;; tamanho 15 e cor preta. Caso a lista recebida não possua imagens, a função retorna uma imagem vazia.

;; Exemplos: (analisa-lista-imagens conteudos-vazia) = empty-image
;;           (analisa-lista-imagens pagweb1 conteudos1) = .

;;           (analisa-lista-imagens pagweb2 conteudos2) = .
;;           (analisa-lista-imagens pagweb4 conteudos5) = .

(define (analisa-lista-imagens page list)
  [cond
    [(empty? list) empty-image]
    [(pag-web? (first list)) (beside (analisa-lista-imagens page (rest list))(mostra-imagens (first list)))]
    [(image? (first list)) (beside (above (text (pag-web-nome page) 15 "black")(first list)) (analisa-lista-imagens page (rest list)))]
    [else (analisa-lista-imagens page (rest list))]])   
    
;; Testes:
;;(check-expect (analisa-lista-imagens pagweb0 conteudos-vazia) empty-image)
;;(check-expect (analisa-lista-imagens pagweb1 conteudos1) .)
;;(check-expect (analisa-lista-imagens pagweb2 conteudos2) .)
;;(check-expect (analisa-lista-imagens pagweb4 conteudos5) .)


;;----------------------------------------------------------------------------------------------------EXERCÍCIO 04---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; PROFUNDIDADE ====================================================================================================================================================================================================================================================================================

;; profundidade: Pag-web -> Número

;; Objetivo: esta função recebe uma página da web, retornando
;; a profundidade máxima da página (ou seja, o número máximo
;; de níveis que ela contém). Assume-se que uma página web
;; sem sub-páginas possui valor de profundidade igual a zero.

;; Exemplos: (profundidade pagweb0) = 0
;;           (profundidade pagweb4) = 1
;;           (profundidade pagweb9) = 2
;;           (profundidade pagweb8) = 3
;;           (profundidade pagweb6) = 4

(define (profundidade page)
    (analisa-lista-profundidade (pag-web-conteudo page))) 
  
;; Testes:
(check-expect (profundidade pagweb0) 0)
(check-expect (profundidade pagweb4) 1)
(check-expect (profundidade pagweb9) 2) 
(check-expect (profundidade pagweb8) 3)
(check-expect (profundidade pagweb6) 4)

;; ANALISA-LISTA-PROFUNDIDADE ====================================================================================================================================================================================================================================================================================

;; analisa-lista-profundidade: Lista-conteudo -> Número

;; Objetivo: esta função auxiliar recebe uma lista de conteúdos de
;; uma página da web, retornando a profundidade máxima da
;; pagina da web que contém a lista fornecida. Caso a lista
;; não contenha nenhuma página da web, a função retorna o
;; valor zero.

;; Exemplos: (analisa-lista-profundide conteudos-vazia) = 0
;;           (analisa-lista-profundide conteudos4) = 1
;;           (analisa-lista-profundide conteudos9) = 2
;;           (analisa-lista-profundide conteudos8) = 3
;;           (analisa-lista-profundide conteudos6) = 4

(define (analisa-lista-profundidade lista)
  (cond
    [(empty? lista) 0]
    [(or (image? (first lista))(string? (first lista))) (analisa-lista-profundidade (rest lista))]
    [else (max (+ 1 (profundidade (first lista)))(analisa-lista-profundidade (rest lista)))])) 

;; Testes:
(check-expect (analisa-lista-profundidade conteudos-vazia) 0)
(check-expect (analisa-lista-profundidade conteudos4) 1)
(check-expect (analisa-lista-profundidade conteudos9) 2)
(check-expect (analisa-lista-profundidade conteudos8) 3)
(check-expect (analisa-lista-profundidade conteudos6) 4)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; GERA-IMAGEM-PAGINA ====================================================================================================================================================================================================================================================================================

;; gera-imagem-pagina: Pag-web -> Imagem

;; Objetivo: esta função recebe uma página da web, retornando seu conteúdo de forma estruturada, incluindo
;; os conteúdos de todas as sub-páginas que ela referencia, de forma sequencial. Assume-se que o conteúdo de
;; cada página será delimitado por retângulos pretos contendo < ou >.

;; Exemplos: (gera-imagem-pagina pagweb0) = .
;;           (gera-imagem-pagina pagweb3) = .
;;           (gera-imagem-pagina pagweb11) = .
;;           (gera-imagem-pagina pagweb9) = .


(define (gera-imagem-pagina page)
  (above/align "left" (text (pag-web-nome page) 20 "black")(beside(beside retangulo-preto-menorque (analisa-paginas-imagens (pag-web-conteudo page))) retangulo-preto-maiorque))) 

;; Testes:
;;(check-expect (gera-imagem-pagina pagweb0) .)
;;(check-expect (gera-imagem-pagina pagweb3)  .)
;;(check-expect (gera-imagem-pagina pagweb11) .)
;;(check-expect (gera-imagem-pagina pagweb9)  .)
 
          

;; ANALISA-PAGINAS-IMAGENS ====================================================================================================================================================================================================================================================================================

;; analisa-paginas-imagens: Lista-conteudo -> Imagem

;; Objetivo: esta função auxiliar recebe uma lista de conteúdos de uma página da web, retornando seu conteúdo de forma estruturada,
;; e considerando todas as sub-páginas subsequentes. As sub-páginas subsequentes contidas na lista de conteúdos terão seus conteúdos
;; delimitados por retângulos pretos contendo < ou >. Caso a função receba uma lista vazia, ela retorna uma imagem vazia.

;; Exemplos: (analisa-paginas-imagens conteudos-vazia) = empty-image
;;           (analisa-paginas-imagens conteudos3) = .
;;           (analisa-paginas-imagens conteudos11) = .         
;;           (analisa-paginas-imagens conteudos9) = .

(define (analisa-paginas-imagens lista)
  [cond
    [(empty? lista) empty-image]
    [(image? (first lista)) (beside (first lista) (analisa-paginas-imagens (rest lista)))]
    [(string? (first lista)) (beside (text (first lista) 20 "black") (analisa-paginas-imagens (rest lista)))]
    [(pag-web? (first lista)) (beside (gera-imagem-pagina (first lista))(analisa-paginas-imagens (rest lista)))]
    [else (analisa-paginas-imagens (rest lista))]])    

;; Testes:
;;(check-expect (analisa-paginas-imagens conteudos-vazia) empty-image)
;;(check-expect (analisa-paginas-imagens conteudos3) .)
;;(check-expect (analisa-paginas-imagens conteudos11) .)
;;(check-expect (analisa-paginas-imagens conteudos9)  .)


 
 
;; VIZINHOS ====================================================================================================================================================================================================================================================================================
  
;; vizinhos: String Grafo ListaDeString -> ListaDeString

;; Objetivo: esta função recebe um nome de um nodo, um grafo e uma lista de nomes de nodos,
;; e retorna uma lista contendo apenas os nomes dos vizinhos do nodo cujo nome corresponde ao
;; nome informado, mas que ao mesmo tempo não estão contidos na lista de nomes de nodos fornecida.
;; Caso a função receba uma string que não corresponda ao nome de nenhum nodo existente no grafo,
;; a função retorna uma lista vazia. Caso a função receba um grafo vazio, a função retorna uma
;; lista vazia.

;; Exemplos: (vizinhos "Helena" GRAFO-VAZIO (list "Winnipeg" "Duluth" "Omaha" "Denver")) = (list "Winnipeg" "Duluth" "Omaha" "Denver")
;;           (vizinhos "Helena" MAPA (list "Winnipeg" "Duluth" "Omaha" "Denver")) = empty
;;           (vizinhos "Chicago" MAPA (list "Omaha" "SaintLouis")) = (list "Duluth" "Pittsburgh" "Toronto")
;;           (vizinhos "Nashville" MAPA (list "LittleRock")) = (list "SaintLouis" "Atlanta" "Pittsburgh")     
;;           (vizinhos "Vancouver" MAPA (list "Atlanta" "SaintLouis")) = empty

(define (vizinhos str gra lds)
  [cond
    [(boolean? (verifica-nome str gra)) empty]
    [(empty? gra) empty]
    [else (subtrai-lista (nodo-vizinhos(verifica-nome str gra)) lds)]])

;; Testes:
(check-expect (vizinhos "Helena" GRAFO-VAZIO (list "Winnipeg" "Duluth" "Omaha" "Denver")) empty)
(check-expect (vizinhos "Helena" MAPA (list "Winnipeg" "Duluth" "Omaha" "Denver")) empty)
(check-expect (vizinhos "Chicago" MAPA (list "Omaha" "SaintLouis")) (list "Duluth" "Pittsburgh" "Toronto"))
(check-expect (vizinhos "Nashville" MAPA (list "LittleRock")) (list "SaintLouis" "Atlanta" "Pittsburgh"))
(check-expect (vizinhos "Vancouver" MAPA (list "Atlanta" "SaintLouis")) empty)
