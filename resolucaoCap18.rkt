;;----------------------------------------------------------------------------------------------------EXERCÍCIO 01---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Um elemento do conjunto Data é um elemento do cjto. NumerosInteiros

;; d1<=d2? : Data Data -> Booleano

;; dadas 2 datas (apenas o ano), verifica se a primeira é menor ou igual a segunda

;; Exemplos:
;: (d1<=d2? 2014 2014) = true
;; (d1<=d2? 2014 2013) = false

(define (d1<=d2? d1 d2)
  (<= d1 d2))
  
;; Testes:
(check-expect (d1<=d2? 2014 2014) true)
(check-expect (d1<=d2? 2014 2013) false)

;; ESTRUTURA NÓ ====================================================================================================================================================================================================================================================================================

(define-struct filho (pai mãe nome data olhos))

; Um elemento nó de um conjunto Nó (de uma árvore genealógica) é:

; 1. empty, representando a falta de informação, ou

; 2. (make-filho p m n d o), onde:

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

;; LISTA DE DATAS ====================================================================================================================================================================================================================================================================================

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
(define lista-de-datas-5 (cons 1915(cons 1945(cons 1948(cons 1966 empty)))))
(define lista-de-datas-6 (cons 1915(cons 1945 empty)))
(define lista-de-datas-7 (cons 1915(cons 1945(cons 1947(cons 1947(cons 1948(cons 1966(cons 1969(cons 2002 empty)))))))))

;; LISTA DE NÓS ====================================================================================================================================================================================================================================================================================

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

;; MAISIDOSO-L ====================================================================================================================================================================================================================================================================================

;; maisIdoso-l: Nó -> Nó

;; Objetivo: esta função recebe um nó de uma árvore genealógica e retorna o ancestral mais idoso do nó fornecido
;; (que pode ser o próprio nó). Se houver mais de um com mesma data de nascimento, a função retorna um deles.

;; Exemplos: (maisIdoso-l empty) = empty
;;           (maisIdoso-l Joey) = MrTribbiani
;;           (maisIdoso-l Emma) = Althea
;;           (maisIdoso-l Rachel) = Leonard
;;           (maisIdoso-l Althea) = Althea

(define (maisIdoso-l node)
  (local
    (
     (define LISTA-DE-ANCESTRAIS (cria-lista-ancestrais node))
     (define DATA-MAIS-ANTIGA (analisa-lista-datas (cria-lista-datas node)))
    ) (analisa-lista-ancestrais LISTA-DE-ANCESTRAIS DATA-MAIS-ANTIGA)))
  
;; Testes:
(check-expect (maisIdoso-l empty) empty)
(check-expect (maisIdoso-l Joey) MrTribbiani)
(check-expect (maisIdoso-l Emma) Althea)
(check-expect (maisIdoso-l Rachel) Sandra)
(check-expect (maisIdoso-l Althea) Althea)

;; ANALISA-LISTA-ANCESTRAIS ====================================================================================================================================================================================================================================================================================

;; analisa-lista-ancestrais: Lista-de-nós Número -> Nó

;; Objetivo: esta função auxiliar recebe uma lista de nós de uma árvore genealógica e um número, e
;; retorna um nó de uma árvore genealógica cuja data de nascimento seja igual ao número informado.
;; Caso nenhum nó cumpra esse requisito, a função retorna o nó empty. Caso dois nós da árvore
;; genealógica cumpram o requisito, a função retorna qualquer um deles.

;; Exemplos: (analisa-lista-ancestrais lista-de-nós-vazia 77) = empty
;;           (analisa-lista-ancestrais lista-de-nós-1 1915) = Althea
;;           (analisa-lista-ancestrais lista-de-nós-2 1337) = empty
;;           (analisa-lista-ancestrais lista-de-nós-3 1945) = Judy

(define (analisa-lista-ancestrais lista number)
  [cond
    [(empty? lista) empty]
    [(= number (filho-data (first lista))) (first lista)]
    [else (analisa-lista-ancestrais (rest lista) number)]])

;; Testes:
(check-expect (analisa-lista-ancestrais lista-de-nós-vazia 77) empty)
(check-expect (analisa-lista-ancestrais lista-de-nós-1 1915) Althea)
(check-expect (analisa-lista-ancestrais lista-de-nós-2 1337) empty)
(check-expect (analisa-lista-ancestrais lista-de-nós-3 1945) Judy)

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

(define (analisa-lista-datas lista)
  [cond
    [(empty? lista) 0]
    [else (analisa-datas-recursao lista (first lista))]])  

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

(define (analisa-datas-recursao lista number)
  [cond
    [(empty? lista) number]
    [(d1<=d2? (first lista) number)(analisa-datas-recursao (rest lista) (first lista))] 
    [else (analisa-datas-recursao (rest lista) number)]])

;; Testes:
(check-expect (analisa-datas-recursao lista-de-datas-vazia 77) 77)
(check-expect (analisa-datas-recursao lista-de-datas-1 1789) 1337)
(check-expect (analisa-datas-recursao lista-de-datas-2 1520) 1318)
(check-expect (analisa-datas-recursao lista-de-datas-3 1920) 1920)
(check-expect (analisa-datas-recursao lista-de-datas-4 2007) 2006)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;  Explique as vantagens do uso da expressão local no exercício anterior.
; 
;  RESPOSTA: Sabe-se que a função maisidoso, originalmente, trabalhava com quatro funções auxiliares no total: ela chamava a função analisa-lista-ancestrais,
;  que tinha em seus dois parâmetros três funções auxiliares. A função analisa-lista-ancestrais (que deve receber dois parâmetros) recebia como primeiro parâmetro
;  a saída da função cria-lista-ancestrais, e como segundo parâmetro a saída da função analisa-lista-datas (que, por sua vez, recebia como parâmetro a saída da função
;  cria-lista-datas). Ao utilizarmos a expressão local,  a lógica do funcionamento da função foi mantida, mas o código passou a ser mais legível, tendo em vista que os
;  parâmetros da função analisa-lista-ancestrais podem ser referenciados por nomes que tornam mais lúcida a forma como a função trabalha. Em suma, é possível identificar
;  com mais facilidade a relação entre todas as funções auxiliares envolvidas no funcionamento da função principal. Além disso, a utilização da expressão local em funções
;  que chamam alguma outra função auxiliar que é responsável pela criação de uma lista otimiza o processamento do programa e torna a sua execução mais eficiente, pois a
;  quantidade de vezes que uma lista será criada ou analisada pode ser reduzida com essa técnica.


;;----------------------------------------------------------------------------------------------------EXERCÍCIO 03---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; TIPO LISTA-DE-NÓS-BOOLEANO =======================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; Um elemento lista-de-nós-booleano do conjunto Lista-de-nós-Booleano pode ser

;; 1. Um elemento do conjunto Lista-de-nós;

;; ou

;; 2. Um elemento do conjunto Booleano.

;; Exemplos de elementos do conjunto Lista-de-nós-Booleano:
(define lista-de-nós-5 (cons Phoebe (cons Carol (cons Ben (cons Emma empty)))))
(define lista-de-nós-6 (cons Nora (cons Rachel (cons Leonard (cons Chandler empty)))))
(define constante-true #true)
(define constante-false #false)

;; LOA ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================
 
;; loa: Nó -> Lista-de-nós

;; Objetivo: esta função recebe um nó de uma árvore genealógica, e retorna
;; uma lista contendo esse nó e todos os seus ancestrais, ordenados de
;; forma crescente com base em suas respectivas datas de nascimento.

;; Exemplos: (loa Rachel) = (cons Leonard (cons Sandra (cons Rachel empty)))
;;           (loa Ross) = (cons Althea (cons Judy (cons Jack (cons Ross empty))))
;;           (loa Emma) = (cons Althea (cons Judy (cons Leonard (cons Sandra (cons Jack (cons Ross (cons Rachel (cons Emma empty))))))))

;; ORDENA-DATAS ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; ordena-datas: Lista-de-datas -> Lista-de-datas

;; Objetivo: esta função auxiliar recebe uma lista de datas, e retorna
;; uma lista contendo todas datas da lista fornecida, mas organizadas
;; de forma crescente. Caso a função receba uma lista vazia, a função
;; retorna uma lista vazia.

;; Exemplos: (ordena-datas lista-de-datas-vazia empty) = empty
;;           (ordena-datas lista-de-datas-1) = (cons 1337(cons 1462(cons 1789(cons 1962 empty))))
;;           (ordena-datas lista-de-datas-2) = (cons 1318(cons 1512(cons 1548(cons 1627 empty))))
;;           (ordena-datas lista-de-datas-3) = (cons 1920(cons 1937(cons 1948(cons 1963 empty))))
;;           (ordena-datas lista-de-datas-4) = (cons 2006(cons 2006(cons 2014(cons 2020 empty)))) 

;; INSERE-DATAS ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; insere-datas: Número Lista-de-datas -> Lista-de-datas

;; Objetivo: esta função auxiliar recebe uma lista de datas e uma data, e retorna
;; uma nova lista contendo todas as datas da lista que foi fornecida e mais a
;; data que foi fornecida, que estará posicionada de forma a deixar a lista de
;; datas crescente, ou seja, a data que foi fornecida estará alocada na posição
;; imediatamente anterior à posição da primeira data da lista que possuir valor
;; numérico superior ao da data que foi fornecida.

;; Exemplos: (insere-datas 1500 lista-de-datas-vazia) = (cons 1500 empty)
;;           (insere-datas 1800 lista-de-datas-1) = (cons 1789(cons 1462(cons 1337(cons 1800(cons 1962 empty)))))
;;           (insere-datas 1400 lista-de-datas-2) = (cons 1400(cons 1548(cons 1512(cons 1318(cons 1627 empty)))))
;;           (insere-datas 1945 lista-de-datas-3) = (cons 1920(cons 1937(cons 1945(cons 1948(cons 1963 empty)))))
;;           (insere-datas 2017 lista-de-datas-4) = (cons 2014(cons 2006(cons 2006(cons 2017(cons 2020 empty)))))

;; CRIA-LISTA-DATAS-L ====================================================================================================================================================================================================================================================================================
  
;; cria-lista-datas-l: Nó -> Lista-de-datas

;; Objetivo: esta função auxiliar recebe um nó de uma árvore genealógica, e retorna uma lista contendo as
;; datas de nascimentos de todos os ancestrais desse nó, incluindo a data de nascimento do próprio nó
;; fornecido. Caso a função receba um nó empty, a função retorna uma lista vazia.

;; Exemplos: (cria-lista-datas-l empty) = empty
;;           (cria-lista-datas-l Althea) = (cons 1915 empty)
;;           (cria-lista-datas-l Joey) = (cons 1969 (cons 1950 (cons 1949 empty)))
;;           (cria-lista-datas-l Emma) = (cons 2002 (cons 1969 (cons 1947 (cons 1947 (cons 1966 (cons 1945 (cons 1915 (cons 1948 empty))))))))

;; CRIA-LISTA-ANCESTRAIS-L ====================================================================================================================================================================================================================================================================================
  
;; cria-lista-ancestrais-l: Nó -> Lista-de-nós

;; Objetivo: esta função auxiliar recebe um nó de uma árvore genealógica e retorna uma lista contendo
;; todos os ancestrais desse nó, incluindo o próprio nó (sem respeitar nenhuma regra quanto à forma
;; como os nós estarão posicionados na lista). Caso a função receba um nó empty, a função retorna
;; uma lista vazia.

;; Exemplos: (cria-lista-ancestrais-l empty) = empty
;;           (cria-lista-ancestrais-l Althea) = (cons Althea empty)
;;           (cria-lista-ancestrais-l Judy) = (cons Judy (cons Althea empty)))
;;           (cria-lista-ancestrais-l Ross) = (cons Ross (cons Judy (cons Althea (cons Jack empty)))))

;; ORGANIZA-DATA-COM-ANCESTRAL ====================================================================================================================================================================================================================================================================================

;; organiza-data-com-ancestral: Lista-de-nós Lista-de-datas -> Lista-de-nós-Booleano

;; Objetivo: esta função auxiliar recebe uma lista de nós de uma árvore genealógica e uma lista de datas,
;; e organiza a lista de nós de forma tal que a posição de cada nó na lista seja exatamente igual à posição
;; da sua respectiva data de nascimento na lista de datas, retornando essa nova lista após todas essas
;; realocações de posição. Caso as duas listas recebidas sejam listas vazias, a função retorna uma lista vazia.
;; Caso a lista de datas que foi fornecida não contenha as datas de nascimentos de todos os nós da lista de
;; nós que foi informada (independentemente da ordem), a função retorna valor lógico falso.

;; Exemplos: (organiza-data-com-ancestral empty empty) = empty
;;           (organiza-data-com-ancestral lista-de-nós-3 lista-de-datas-5) = (cons Althea (cons Judy (cons Jack (cons Ross empty))))
;;           (organiza-data-com-ancestral lista-de-nós-2 lista-de-datas-6) = (cons Althea(cons Judy empty)) 
;;           (organiza-data-com-ancestral lista-de-nós-1 lista-de-datas-3) = #false
;;           (organiza-data-com-ancestral lista-de-nós-4 lista-de-datas-4) = #false

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 04---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; ESTRUTURA CARRO ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

(define-struct carro (ano modelo preco ar? direção? vidros-el?))

;; Um elemento carro do conjunto Carro é uma estrutura
;; (make-carro ano modelo valor ar? direção? vidros-el?)
;; onde:

;; ano: Número, é o ano de fabricação do veículo

;; modelo: String, é o modelo do veiculo

;; valor: Número, é o valor em reais do veículo

;; ar?: Booleano, indica se veículo possui ar condicionado

;; direção?: Booleano, indica se veículo possui direção hidráulica

;; vidros-el?: Booleano, indica se o veículo possui vidros elétricos

;; Exemplos de elementos do conjunto Carro:
(define celta-ILT (make-carro 2009 "celtaspirit" 25000 #true #true #true)) 
(define uno-IGT (make-carro 2005 "unomille" 20000 #false #false #false))
(define fiesta-IQA (make-carro 2012 "fiestahatch" 30000 #true #false #true))
(define corsa-ILS (make-carro 2000 "corsamaxx" 15000 #false #false #false))
(define palio-IJC (make-carro 2014 "paliofire" 40000 #true #true #true))
(define gol-IGF (make-carro 1998 "golvolkswagen" 12000 #false #false #false))
(define idea-ITR (make-carro 2015 "ideaattractive" 45000 #true #true #true))
(define parati-IFT (make-carro 1997 "parativolkswagen" 11000 #false #false #false))             

;; LISTA DE CARROS ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; Um elemento lista-de-carros do conjunto Lista-de-carros é

;; 1. A lista vazia empty

;; ou

;; 2. (cons c ldc), em que

;; c: Carro e

;; ldc: Lista-de-carros

;; Exemplos de elementos do conjunto Lista-de-carros:
(define lista-de-carros-vazia empty)
(define lista-de-carros-1 (cons celta-ILT(cons uno-IGT(cons fiesta-IQA(cons corsa-ILS empty)))))
(define lista-de-carros-2 (cons palio-IJC(cons gol-IGF(cons idea-ITR(cons parati-IFT empty)))))
(define lista-de-carros-3 (cons uno-IGT(cons corsa-ILS(cons gol-IGF(cons parati-IFT empty)))))
(define lista-de-carros-4 (cons idea-ITR(cons palio-IJC(cons fiesta-IQA(cons celta-ILT(cons uno-IGT(cons gol-IGF empty)))))))
(define lista-de-carros-5 (cons fiesta-IQA(cons celta-ILT(cons gol-IGF(cons idea-ITR(cons palio-IJC (cons uno-IGT empty)))))))
(define lista-de-carros-6 (cons uno-IGT(cons gol-IGF(cons parati-IFT empty))))
(define lista-de-carros-7 (cons celta-ILT empty))
(define lista-de-carros-8 (cons palio-IJC (cons gol-IGF (cons corsa-ILS(cons uno-IGT empty)))))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05A---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; LISTA DE NUMEROS ====================================================================================================================================================================================================================================================================================

;; Um elemento lista-de-numeros do conjunto Lista-de-numeros é

;; 1. A lista vazia empty

;; ou

;; 2. (cons n ldn), em que

;; d: Número e

;; ldc: Lista-de-numeros

;; Exemplos de elementos do conjunto Lista-de-datas:
(define lista-de-numeros-vazia empty)
(define lista-de-numeros-1 (cons 26349(cons 28227(cons 21000(cons 7687 empty)))))
(define lista-de-numeros-2 (cons 10(cons 112(cons 15(cons 18 empty)))))
(define lista-de-numeros-3 (cons 238(cons 777(cons 542(cons 999 empty)))))
(define lista-de-numeros-4 (cons 3220(cons 4668(cons 9607(cons 2022 empty)))))
(define lista-de-numeros-5 (cons 1(cons 2(cons 3(cons 4(cons 5(cons 6(cons 7(cons 8(cons 9(cons 10 empty)))))))))))

;; TIPO CARRO-BOOLEANO =======================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; Um elemento carro-booleano do conjunto Carro-Booleano pode ser

;; 1. Um elemento do conjunto Carro;

;; ou

;; 2. Um elemento do conjunto Booleano.

;; Exemplos de elementos do conjunto Carro-Booleano:
(define mustang-INJ (make-carro 2018 "mustangfastback" 500000 #true #true #true))
(define porsche-INJ (make-carro 2019 "porschepanamare" 1000000 #true #true #true))
(define constante-true-1 #true)
(define constante-false-1 #false)

;; MAIORVALOR ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; maiorvalor: Lista-de-carros -> Carro

;; Objetivo: esta função recebe uma lista de carros, e retorna o nome do carro com
;; o maior preço de mercado. Assume-se que a lista não está necessariamente ordenada
;; de acordo com o atributo de preço de mercado, e que a lista irá conter ao menos
;; um carro. Caso a lista contenha apenas um carro, a função retorna esse único carro.

;; Exemplos: (maiorvalor lista-de-carros-1) = fiesta-IQA
;;           (maiorvalor lista-de-carros-2) = idea-ITR
;;           (maiorvalor lista-de-carros-3) = uno-IGT
;;           (maiorvalor lista-de-carros-4) = idea-ITR
;;           (maiorvalor lista-de-carros-5) = idea-ITR
;;           (maiorvalor lista-de-carros-7) = celta-ILT

(define (maiorvalor lista)
  (local
    (
     (define MAIOR-PREÇO-MERCADO (analisa-lista-valores (cria-lista-valores lista)))
    ) (analisa-nome-carro lista MAIOR-PREÇO-MERCADO)))

;; Testes:
(check-expect (maiorvalor lista-de-carros-1) fiesta-IQA)
(check-expect (maiorvalor lista-de-carros-2) idea-ITR)
(check-expect (maiorvalor lista-de-carros-3) uno-IGT)
(check-expect (maiorvalor lista-de-carros-4) idea-ITR)
(check-expect (maiorvalor lista-de-carros-5) idea-ITR)
(check-expect (maiorvalor lista-de-carros-7) celta-ILT)

;; ANALISA-NOME-CARRO ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; analisa-nome-carro: Lista-de-carros Número -> Carro-Booleano

;; Objetivo: esta função auxiliar recebe uma lista de carros e um número,
;; e retorna o nome do carro da lista cujo preço de mercado seja igual
;; ao número informado. Caso dois ou mais carros da lista cumpram esse
;; requisito, a função retorna qualquer um deles. Caso nenhum carro
;; da lista cumpra esse requisito, a função retorna valor lógico falso.

;; Exemplos: (analisa-nome-carro lista-de-carros-vazia 0) = #false
;;           (analisa-nome-carro lista-de-carros-1 30000) = fiesta-IQA
;;           (analisa-nome-carro lista-de-carros-2 12000) = gol-IGF
;;           (analisa-nome-carro lista-de-carros-3 77000) = #false
;;           (analisa-nome-carro lista-de-carros-5 40000) = palio-IJC

(define (analisa-nome-carro lista numero) 
  [cond
    [(empty? lista) #false]
    [(= (carro-preco (first lista)) numero) (first lista)]
    [else (analisa-nome-carro (rest lista) numero)]])

;; Testes:
(check-expect (analisa-nome-carro lista-de-carros-vazia 0) #false)
(check-expect (analisa-nome-carro lista-de-carros-1 30000) fiesta-IQA)
(check-expect (analisa-nome-carro lista-de-carros-2 12000) gol-IGF)
(check-expect (analisa-nome-carro lista-de-carros-3 77000) #false)
(check-expect (analisa-nome-carro lista-de-carros-5 40000) palio-IJC)
  
;; CRIA-LISTA-VALORES ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; cria-lista-valores: Lista-de-carros -> Lista-de-numeros

;; Objetivo: esta função auxiliar recebe uma lista de carros, e retorna
;; uma lista contendo o valor em reais do preço de mercado de cada carro
;; da lista fornecida.

;; Exemplos: (cria-lista-valores lista-de-carros-vazia) = empty
;;           (cria-lista-valores lista-de-carros-1) = (cons 25000(cons 20000(cons 30000(cons 15000 empty))))
;;           (cria-lista-valores lista-de-carros-2) = (cons 40000(cons 12000(cons 45000(cons 11000 empty))))
;;           (cria-lista-valores lista-de-carros-3) = (cons 20000(cons 15000(cons 12000(cons 11000 empty))))        
;;           (cria-lista-valores lista-de-carros-4) = (cons 45000(cons 40000(cons 30000(cons 25000(cons 20000(cons 12000 empty))))))
;;           (cria-lista-valores lista-de-carros-5) = (cons 30000(cons 25000(cons 12000(cons 45000(cons 40000(cons 20000 empty))))))

(define (cria-lista-valores lista)
  [cond
    [(empty? lista) empty]
    [else (cons (carro-preco (first lista))(cria-lista-valores (rest lista)))]])

;; Testes:
(check-expect (cria-lista-valores lista-de-carros-vazia) empty)
(check-expect (cria-lista-valores lista-de-carros-1) (cons 25000(cons 20000(cons 30000(cons 15000 empty))))) 
(check-expect (cria-lista-valores lista-de-carros-2) (cons 40000(cons 12000(cons 45000(cons 11000 empty))))) 
(check-expect (cria-lista-valores lista-de-carros-3) (cons 20000(cons 15000(cons 12000(cons 11000 empty))))) 
(check-expect (cria-lista-valores lista-de-carros-4) (cons 45000(cons 40000(cons 30000(cons 25000(cons 20000(cons 12000 empty)))))))
(check-expect (cria-lista-valores lista-de-carros-5) (cons 30000(cons 25000(cons 12000(cons 45000(cons 40000(cons 20000 empty)))))))

;; ANALISA-LISTA-VALORES ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; analisa-lista-valores: Lista-de-numeros -> Número

;; Objetivo: esta função auxiliar recebe uma lista de números,
;; e retorna o maior número da lista. Caso a função receba uma
;; lista vazia, a função retorna o número zero.

;; Exemplos: (analisa-lista-valores lista-de-numeros-vazia) = 0
;;           (analisa-lista-valores lista-de-numeros-1) = 28227
;;           (analisa-lista-valores lista-de-numeros-2) = 112
;;           (analisa-lista-valores lista-de-numeros-3) = 999
;;           (analisa-lista-valores lista-de-numeros-4) = 9607

(define (analisa-lista-valores lista)
  [cond
    [(empty? lista) 0]
    [else (analisa-lista-valores-recursao lista (first lista))]])

;; Testes:
(check-expect (analisa-lista-valores lista-de-numeros-vazia) 0)
(check-expect (analisa-lista-valores lista-de-numeros-1) 28227)
(check-expect (analisa-lista-valores lista-de-numeros-2) 112)
(check-expect (analisa-lista-valores lista-de-numeros-3) 999)
(check-expect (analisa-lista-valores lista-de-numeros-4) 9607)

;; ANALISA-LISTA-VALORES-RECURSAO ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; analisa-lista-valores-recursao: Lista-de-numeros Número -> Número

;; Objetivo: esta função auxiliar recebe uma lista de números e um número
;; e, considerando apenas os valores da lista que são maiores ou iguais ao
;; número fornecido, retorna o maior dentre esses valores. Caso nenhum número
;; da lista cumpra esse requisito, a função retorna o próprio número que foi
;; inserido como operando pelo usuário. Caso dois ou mais números da lista
;; cumpram simultaneamente esse requisito, a função retorna simplesmente
;; qualquer um desses números.

;; Exemplos: (analisa-lista-valores-recursao lista-de-numeros-vazia 77) = 77
;;           (analisa-lista-valores-recursao lista-de-numeros-1 25000) = 28227
;;           (analisa-lista-valores-recursao lista-de-numeros-2 15) = 112
;;           (analisa-lista-valores-recursao lista-de-numeros-3 600) = 999
;;           (analisa-lista-valores-recursao lista-de-numeros-4 4000) = 9607

(define (analisa-lista-valores-recursao lista numero)
  [cond
    [(empty? lista) numero]
    [(> (first lista) numero) (analisa-lista-valores-recursao (rest lista) (first lista))]
    [else (analisa-lista-valores-recursao (rest lista) numero)]])

;; Testes:
(check-expect (analisa-lista-valores-recursao lista-de-numeros-vazia 77) 77)
(check-expect (analisa-lista-valores-recursao lista-de-numeros-1 25000) 28227)
(check-expect (analisa-lista-valores-recursao lista-de-numeros-2 15) 112)
(check-expect (analisa-lista-valores-recursao lista-de-numeros-3 600) 999)
(check-expect (analisa-lista-valores-recursao lista-de-numeros-4 4000) 9607)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05B---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; MAIORVALOR_ORD ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; maiorvalor_ord: Lista-de-carros -> Carro
7
;; Objetivo: esta função recebe uma lista de carros, e retorna o nome do carro com o maior
;; preço de mercado. Assume-se que a lista recebida está necessariamente ordenada de acordo
;; com o atributo de preço de mercado, e que a lista irá conter ao menos um carro. Caso a lista
;; contenha somente um carro, a função retorna esse único carro.

;; Exemplos: (maiorvalor_ord lista-de-carros-5) = fiesta-IQA
;;           (maiorvalor_ord lista-de-carros-6) = uno-IGT
;;           (maiorvalor_ord lista-de-carros-7) = celta-ILT

(define (maiorvalor_ord lista_ordenada)
  (first lista_ordenada)) 

;; Testes:
(check-expect (maiorvalor_ord lista-de-carros-5) fiesta-IQA)
(check-expect (maiorvalor_ord lista-de-carros-6) uno-IGT)
(check-expect (maiorvalor_ord lista-de-carros-7) celta-ILT)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 06---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; ORDENA-L ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; ordena-l: Lista-de-numeros -> Lista-de-numeros

;; Objetivo: esta função recebe uma lista de números e retorna outra lista
;; contendo todos os números da lista fornecida, porém ordenados de forma
;; decrescente.

;; Exemplos: (ordena-l lista-de-numeros-vazia) = empty
;;           (ordena-l lista-de-numeros-1) = (cons 28227(cons 26349(cons 21000 (cons 7687 empty))))
;;           (ordena-l lista-de-numeros-2) = (cons 112(cons 18(cons 15(cons 10 empty))))
;;           (ordena-l lista-de-numeros-3) = (cons 999(cons 777(cons 542(cons 238 empty))))
;;           (ordena-l lista-de-numeros-4) = (cons 9607(cons 4668(cons 3220(cons 2022 empty))))
;;           (ordena-l lista-de-numeros-5) = (cons 10(cons 9(cons 8(cons 7(cons 6(cons 5(cons 4(cons 3(cons 2(cons 1 empty))))))))))

(define (ordena-l lista)
  (local
    (
     (define (insere numero lista)
       (cond
         [(empty? lista) (cons numero empty)]
         [(>= numero (first lista)) (cons numero lista)]
         [(< numero (first lista)) (cons (first lista) (insere numero (rest lista)))]))
     (define (ordena lista)
       (cond
         [(empty? lista) empty]
         [else (insere (first lista) (ordena (rest lista)))]))
     ) (ordena lista)))

;; Testes:
(check-expect (ordena-l lista-de-numeros-vazia) empty)
(check-expect (ordena-l lista-de-numeros-1) (cons 28227(cons 26349(cons 21000 (cons 7687 empty)))))
(check-expect (ordena-l lista-de-numeros-2) (cons 112(cons 18(cons 15(cons 10 empty)))))
(check-expect (ordena-l lista-de-numeros-3) (cons 999(cons 777(cons 542(cons 238 empty)))))
(check-expect (ordena-l lista-de-numeros-4) (cons 9607(cons 4668(cons 3220(cons 2022 empty))))) 
(check-expect (ordena-l lista-de-numeros-5) (cons 10(cons 9(cons 8(cons 7(cons 6(cons 5(cons 4(cons 3(cons 2(cons 1 empty)))))))))))
