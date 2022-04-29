;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname listaCap14-AndreiPochmannKoenich-B) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;----------------------------------------------------------------------------------------------------EXERCÍCIO 01---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Um elemento do conjunto Data é um elemento do cjto. NumerosInteiros

;; d1<=d2? : Data Data -> Boolean

;; dadas 2 datas (apenas o ano), verifica se a primeira é menor ou igual a segunda

;; Exemplos:
;: (d1<=d2? 2014 2014) = true
;; (d1<=d2? 2014 2013) = false

(define (d1<=d2? d1 d2)
  (<= d1 d2))

;; Testes:
(check-expect (d1<=d2? 2014 2014) true)
(check-expect (d1<=d2? 2014 2013) false)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(define-struct filho (pai mãe nome data olhos))

; Um elemento nó de um conjunto Nó (de uma árvore genealógica) é:

; 1. empty, representando a falta de informação, ou

; 2. (make-filho p m n d o), em que:

; p: Nó, representa o pai da pessoa

; m: Nó, representa a mãe da pessoa

; n: Símbolo, representa o nome da pessoa

; d: Data, representa o ano de nascimento da pessoa

; o: Símbolo, representa a cor dos olhos da pessoa, em inglês

(define Althea (make-filho empty empty 'Althea 1915 'brown))
(define Jack (make-filho empty empty 'Jack 1948 'brown))
(define Judy (make-filho empty Althea 'Judy 1945 'green))
(define Monica (make-filho Jack Judy 'Monica 1968 'blue))
(define Ross (make-filho Jack Judy 'Ross 1966 'brown))
(define Sandra (make-filho empty empty 'Sandra 1947 'brown))
(define Leonard (make-filho empty empty 'Leonard 1947 'brown))
(define Rachel (make-filho Leonard Sandra 'Rachel 1969 'blue))
(define Nora (make-filho empty empty 'Nora 1948 'blue))
(define Charles (make-filho empty empty 'Charles 1948 'blue))
(define Chandler (make-filho Charles Nora 'Chandler 1966 'blue))
(define GloriaTribbiani (make-filho empty empty 'GloriaTribbiani 1950 'brown))
(define MrTribbiani (make-filho empty empty 'MrTribbiani 1949 'brown))
(define Joey (make-filho MrTribbiani GloriaTribbiani 'Joey 1969 'brown))
(define Frank (make-filho empty empty 'Frank 1940 'brown))
(define LilyBuffay (make-filho empty empty 'LilyBuffay 1940 'blue))
(define Phoebe (make-filho Frank LilyBuffay 'Phoebe 1965 'blue))
(define Carol (make-filho empty empty 'Carol 1965 'blue))
(define Ben (make-filho Ross Carol 'Ben 1994 'blue))
(define Emma (make-filho Ross Rachel 'Emma 2002 'blue))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 03-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; lista de datas ====================================================================================================================================================================================================================================================================================

;; Um elemento lista-de-datas do conjunto Lista-de-datas é

;; 1. A lista vazia empty

;; ou

;; 2. (cons d ldd), em que

;; d: Data e

;; ldc: Lista-de-datas

;; Exemplos de elementos do conjunto Lista-de-datas:
(define lista-de-datas-vazia empty)
(define lista-de-datas-1 (cons 1789(cons 1462(cons 1337(cons 1962 empty)))))
(define lista-de-datas-2 (cons 1548(cons 1512(cons 1318(cons 1627 empty)))))
(define lista-de-datas-3 (cons 1920(cons 1937(cons 1948(cons 1963 empty)))))
(define lista-de-datas-4 (cons 2014(cons 2006(cons 2006(cons 2020 empty)))))

;; lista de nós ====================================================================================================================================================================================================================================================================================

;; Um elemento lista-de-nós do conjunto Lista-de-nós é

;; 1. A lista vazia empty

;; ou

;; 2. (cons n ldn), em que

;; n: Nó e

;; ldn: Lista-de-nós

;; Exemplos de elementos do conjunto Lista-de-nós:
(define lista-de-nós-vazia empty)
(define lista-de-nós-1 (cons Althea empty))
(define lista-de-nós-2 (cons Judy (cons Althea empty)))
(define lista-de-nós-3 (cons Ross (cons Judy (cons Althea (cons Jack empty)))))

;; MAISIDOSO ====================================================================================================================================================================================================================================================================================

;; maisIdoso: Nó -> Nó

;; Objetivo: esta função recebe um nó de uma árvore genealógica e retorna o ancestral mais idoso do nó fornecido
;; (que pode ser o próprio nó). Se houver mais de um com mesma data de nascimento, a função retorna um deles.

;; Exemplos: (maisIdoso empty) = empty
;;           (maisIdoso Joey) = MrTribbiani
;;           (maisIdoso Emma) = Althea
;;           (maisIdoso Rachel) = Rachel
;;           (maisIdoso Althea) = Althea

(define (maisIdoso node)
  (analisa-lista-ancestrais (cria-lista-ancestrais node) (analisa-lista-datas (cria-lista-datas node))))  

;; Testes:
(check-expect (maisIdoso empty) empty)
(check-expect (maisIdoso Joey) MrTribbiani)
(check-expect (maisIdoso Emma) Althea)
(check-expect (maisIdoso Rachel) Sandra)
(check-expect (maisIdoso Althea) Althea)

;; CRIA-LISTA-ANCESTRAIS ====================================================================================================================================================================================================================================================================================
  
;; cria-lista-ancestrais: Nó -> Lista-de-nós

;; Objetivo: esta função auxiliar recebe um nó de uma árvore genealógica e retorna uma lista contendo
;; todos os ancestrais desse nó, incluindo o próprio nó. Caso a função receba um nó empty, a função
;; retorna uma lista vazia.

;; Exemplos: (cria-lista-ancestrais empty) = empty
;;           (cria-lista-ancestrais Althea) = (cons Althea empty)
;;           (cria-lista-ancestrais Judy) = (cons Judy (cons Althea empty)))
;;           (cria-lista-ancestrais Ross) = (cons Ross (cons Judy (cons Althea (cons Jack empty)))))

(define (cria-lista-ancestrais node)
  [cond
    [(empty? node) empty]
    [else
     (cons node(append (cria-lista-ancestrais (filho-mãe node))(cria-lista-ancestrais (filho-pai node))))]])
  
;; Testes:
(check-expect (cria-lista-ancestrais empty) empty)
(check-expect (cria-lista-ancestrais Althea) (cons Althea empty))
(check-expect (cria-lista-ancestrais Judy) (cons Judy (cons Althea empty)))
(check-expect (cria-lista-ancestrais Ross) (cons Ross (cons Judy (cons Althea (cons Jack empty)))))

;; ANALISA-LISTA-ANCESTRAIS ====================================================================================================================================================================================================================================================================================

;; analisa-lista-ancestrais : Lista-de-nós Número -> Nó

;; Objetivo: esta função auxiliar recebe uma lista de nós de uma árvore genealógica e um número, e
;; retorna um nó de uma árvore genealógica cuja data de nascimento seja igual ao número informado.
;; Caso nenhum nó cumpra esse requisito, a função retorna o nó empty. Caso dois nós da árvore
;; genealógica cumpram o requisito, a função retorna qualquer um deles.

;; Exemplos: (analisa-lista-ancestrais lista-de-nós-vazia 77) = empty
;;           (analisa-lista-ancestrais lista-de-nós-1 1915) = Althea
;;           (analisa-lista-ancestrais lista-de-nós-2 1337) = empty
;;           (analisa-lista-ancestrais lista-de-nós-3 1945) = Judy

(define (analisa-lista-ancestrais list number)
  [cond
    [(empty? list) empty]
    [(= number (filho-data (first list))) (first list)]
    [else (analisa-lista-ancestrais (rest list) number)]])

;; Testes:
(check-expect (analisa-lista-ancestrais lista-de-nós-vazia 77) empty)
(check-expect (analisa-lista-ancestrais lista-de-nós-1 1915) Althea)
(check-expect (analisa-lista-ancestrais lista-de-nós-2 1337) empty)
(check-expect (analisa-lista-ancestrais lista-de-nós-3 1945) Judy)

;; CRIA-LISTA-DATAS ====================================================================================================================================================================================================================================================================================
  
;; cria-lista-datas: Nó -> Lista-de-datas

;; Objetivo: esta função auxiliar recebe um nó de uma árvore genealógica e retorna uma lista contendo as
;; datas de nascimentos de todos os ancestrais desse nó, incluindo a data de nascimento do próprio nó
;; fornecido. Caso a função receba o nó empty, a função retorna uma lista vazia.

;; Exemplos: (cria-lista-datas empty) = empty
;;           (cria-lista-datas Althea) = (cons 1915 empty)
;;           (cria-lista-datas Joey) = (cons 1969 (cons 1950 (cons 1949 empty)))
;;           (cria-lista-datas Emma) = (cons 2002 (cons 1969 (cons 1947 (cons 1947 (cons 1966 (cons 1945 (cons 1915 (cons 1948 empty))))))))

(define (cria-lista-datas node)
  [cond
    [(empty? node) empty]
    [else
     (cons (filho-data node)(append (cria-lista-datas (filho-mãe node))(cria-lista-datas (filho-pai node))))]])
  
;; Testes:
(check-expect (cria-lista-datas empty) empty)
(check-expect (cria-lista-datas Althea) (cons 1915 empty))
(check-expect (cria-lista-datas Joey) (cons 1969 (cons 1950 (cons 1949 empty))))
(check-expect (cria-lista-datas Emma) (cons 2002 (cons 1969 (cons 1947 (cons 1947 (cons 1966 (cons 1945 (cons 1915 (cons 1948 empty)))))))))

;; ANALISA-LISTA-DATAS ====================================================================================================================================================================================================================================================================================

;; analisa-lista-datas: Lista-de-datas -> Número

;; Objetivo: esta função auxiliar recebe uma lista de datas e retorna
;; a menor data dessa lista. Caso a lista seja uma lista vazia, a
;; função retorna o valor zero. Caso duas ou mais datas da lista
;; possuam simultaneamente o menor valor, a função retorna esse
;; menor valor que corresponde às datas.

;; Exemplos: (analisa-lista-datas lista-de-datas-vazia) = 0
;;           (analisa-lista-datas lista-de-datas-1) = 1337
;;           (analisa-lista-datas lista-de-datas-2) = 1318
;;           (analisa-lista-datas lista-de-datas-3) = 1920
;;           (analisa-lista-datas lista-de-datas-4) = 2006

(define (analisa-lista-datas list)
  [cond
    [(empty? list) 0]
    [else (analisa-datas-recursao list (first list))]])  

;; Testes:
(check-expect (analisa-lista-datas lista-de-datas-vazia) 0)
(check-expect (analisa-lista-datas lista-de-datas-1) 1337)
(check-expect (analisa-lista-datas lista-de-datas-2) 1318)
(check-expect (analisa-lista-datas lista-de-datas-3) 1920)
(check-expect (analisa-lista-datas lista-de-datas-4) 2006)

;; ANALISA-DATAS-RECURSAO ====================================================================================================================================================================================================================================================================================================================================================================================

;; analisa-datas-recursao: Lista-de-datas Número -> Número

;; Objetivo: esta função auxiliar recebe uma lista de datas e um número,
;; e, considerando apenas os valores de datas da lista que são menores
;; ou iguais ao valor fornecido, retorna o menor dentre esses valores.
;; Caso nenhuma data da lista cumpra esse requisito, a função retorna
;; o próprio número que foi inserido como operando pelo usuário. Caso
;; duas datas da lista cumpram simultaneamente esse requisito, a função
;; retorna simplesmente o valor de uma dessas duas datas.

;; Exemplos: (analisa-datas-recursao lista-de-datas-vazia 77) = 77
;;           (analisa-datas-recursao lista-de-datas-1 1789) = 1337
;;           (analisa-datas-recursao lista-de-datas-2 1520) = 1318
;;           (analisa-datas-recursao lista-de-datas-3 1920) = 1920
;;           (analisa-datas-recursao lista-de-datas-4 2007) = 2006

(define (analisa-datas-recursao list number)
  [cond
    [(empty? list) number]
    [(d1<=d2? (first list) number)(analisa-datas-recursao (rest list) (first list))] 
    [else (analisa-datas-recursao (rest list) number)]])

;; Testes:
(check-expect (analisa-datas-recursao lista-de-datas-vazia 77) 77)
(check-expect (analisa-datas-recursao lista-de-datas-1 1789) 1337)
(check-expect (analisa-datas-recursao lista-de-datas-2 1520) 1318)
(check-expect (analisa-datas-recursao lista-de-datas-3 1920) 1920)
(check-expect (analisa-datas-recursao lista-de-datas-4 2007) 2006)
             
;;----------------------------------------------------------------------------------------------------EXERCÍCIO 04--------------------------------------------------------------------------------------------------------------------------------------------------

;; árvores binárias =======================================================================================================================================================================================================================================================================================================================================

(define-struct nó (id c e d))

;; Um elemento árvorebinária do conjunto ÁrvoreBinária pode ser:

;; 1. empty, representando a falta de informação

;; ou

;; 2. (make-nó id c e d), em que:

;; id: Número, representa o identificador do nó

;; c: String, representa o conteúdo do nó

;; e: ÁrvoreBinária, representa a sub-árvore da esquerda

;; d: ÁrvoreBinária, representa a sub-árvore da direita

;; Exemplos de elementos do conjunto ÁrvoreBinária:

;; Primeiro exemplo de árvore binária:
(define centoedois (make-nó 102 "centoedois" empty empty))
(define cinquentaecinco (make-nó 55 "cinquentaecinco" empty empty))
(define centoeum (make-nó 101 "centoeum" cinquentaecinco centoedois))
(define noventaecinco (make-nó 95 "noventaecinco" empty empty))
(define centoesetentaesete (make-nó 177 "centoesetentaesete" empty empty))
(define noventaeoito (make-nó 98 "noventaeoito" noventaecinco centoesetentaesete))
(define setentaeoito (make-nó 78 "setentaeoito" empty empty))
(define noventaesete (make-nó 97 "noventaesete" empty setentaeoito))
(define noventaenove (make-nó 99 "noventaenove" noventaesete noventaeoito))
(define cem (make-nó 100 "cem" noventaenove centoeum))

;; Segundo exemplo de árvore binária, que também é uma árvore binária de pesquisa:
(define vinteeum (make-nó 21 "vinteeum" empty empty))
(define quinze (make-nó 15 "quinze" empty empty))
(define dezenove (make-nó 19 "dezenove" quinze empty))
(define vinte (make-nó 20 "vinte" dezenove vinteeum))
(define quatorze (make-nó 14 "quatorze" empty empty))
(define quatro (make-nó 4 "quatro" empty empty))
(define onze (make-nó 11 "onze" quatro quatorze))
(define doze (make-nó 12 "doze" empty empty))
(define cinco (make-nó 5 "cinco" empty empty))
(define oito (make-nó 8 "oito" cinco doze))
(define nove (make-nó 9 "nove" oito onze))
(define dez (make-nó 10 "dez" nove vinte))

;; Terceiro exemplo de árvore binária:
(define doisumcinco (make-nó 215 "doisumcinco" empty empty))
(define doiszerocinco (make-nó 205 "doiszerocinco" empty empty))
(define doissetezero (make-nó 270 "doissetezero" doiszerocinco doisumcinco))
(define doisumzero (make-nó 210 "doisumzero" empty empty))
(define doistrescinco (make-nó 235 "doistrescinco" empty empty))
(define doisdoiszero (make-nó 220 "doisdoiszero" doistrescinco doisumzero))
(define doisquatrosete (make-nó 247 "doisquatrosete" doisdoiszero empty))
(define doisseiszero (make-nó 260 "doisseiszero" doisquatrosete doissetezero))
(define doisquatrocinco (make-nó 245 "doisquatrocinco" empty empty))
(define doistreszero (make-nó 230 "doistreszero" empty empty))
(define doisquatrozero (make-nó 240 "doisquatrozero" doistreszero doisquatrocinco))
(define doiscincozero (make-nó 250 "doiscincozero" doisquatrozero doisseiszero)) 

;; É-ABP? ==========================================================================================================================================================================================================================================================================================================================================
  
;; é-abp?: ÁrvoreBinária -> Booleano

;; Objetivo: esta função recebe uma árvore binária e verifica se a árvore
;; em questão é uma árvore binária de pesquisa. Caso seja, a função retorna
;; valor lógico verdadeiro, e caso não seja, retorna valor lógico falso.
;; Caso a árvore seja vazia, a função retorna valor lógico verdadeiro.

;; Exemplos: (é-abp? empty) = #true
;;           (é-abp? noventaeoito) = #true
;;           (é-abp? doisquatrosete) = #false
;;           (é-abp? noventaesete) = #false
;;           (é-abp? cem) = #false
;;           (é-abp? doiscincozero) = #false
;;           (é-abp? dez) = #true
;;           (é-abp? quatorze) #true

(define (é-abp? tree)
  [cond
    [(empty? tree) #true]
    [(testa-vértice tree)(and (é-abp? (nó-e tree))(é-abp? (nó-d tree)))] 
    [else #false]]) 

;; Testes:
(check-expect (é-abp? empty) #true)
(check-expect (é-abp? noventaeoito) #true)
(check-expect (é-abp? doisquatrosete) #false)
(check-expect (é-abp? noventaesete) #false)
(check-expect (é-abp? cem) #false)
(check-expect (é-abp? doiscincozero) #false)
(check-expect (é-abp? dez) #true) 
(check-expect (é-abp? dezenove) #true)
(check-expect (é-abp? quatorze) #true)
    
;; TESTA-VÉRTICE ==========================================================================================================================================================================================================================================================================================================================================

;; testa-vértice: ÁrvoreBinária -> Booleano

;; Objetivo: esta função auxiliar recebe um nó de uma árvore binária e verifica se
;; o id do nó à esquerda do nó recebido é menor do que o id do nó informado, e se
;; o id do nó à direita do nó recebido é maior do que o id do nó informado. Caso
;; isso ocorra, a função retorna valor lógico verdadeiro. Nos casos em que os nós
;; à direita e à esquerda são empty, a função retorna valor lógico verdadeiro.
;; Caso somente um dos dois nós à direita ou à esquerda do nó informado seja empty,
;; a função analisa somente o nó que não é empty. Caso o próprio nó informado
;; seja empty, a função retorna valor lógico verdadeiro.

;; Exemplos: (testa-vértice empty) = #true
;;           (testa-vértice noventaeoito) = #true
;;           (testa-vértice doisquatrosete) = #true
;;           (testa-vértice noventaesete) = #false
;;           (testa-vértice cem) = #true
;;           (testa-vértice doiscincozero) = #true
;;           (testa-vértice dez) = #true
;;           (testa-vértice dezenove) = #true
;;           (testa-vértice quatorze) = #true

(define (testa-vértice node)
  [cond
    [(empty? node) #true]
    [(and (empty? (nó-e node))(empty? (nó-d node))) #true]
    [(and (empty? (nó-e node))(>= (nó-id node)(nó-id (nó-d node)))) #false]
    [(and (empty? (nó-d node))(<= (nó-id node)(nó-id (nó-e node)))) #false]
    [(and (or (empty? (nó-e node))(> (nó-id node)(nó-id (nó-e node))))(or (empty? (nó-d node)) (< (nó-id node)(nó-id (nó-d node))))) #true]
    [else #false]])     

;; Testes:
(check-expect (testa-vértice empty) #true)
(check-expect (testa-vértice noventaeoito) #true) 
(check-expect (testa-vértice doisquatrosete) #true)
(check-expect (testa-vértice noventaesete) #false)
(check-expect (testa-vértice cem) #true)
(check-expect (testa-vértice doiscincozero) #true)
(check-expect (testa-vértice dez) #true)
(check-expect (testa-vértice dezenove) #true)
(check-expect (testa-vértice quatorze) #true)
