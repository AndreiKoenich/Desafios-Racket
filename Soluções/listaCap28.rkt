;; LISTA DE STRING ====================================================================================================================================================================================================================================================================================

;; Um elemento listadestring do conjunto ListaDeString pode ser

;; 1. A lista vazia empty

;; ou

;; 2. (cons s lds), em que:

;; s: String

;; lds: ListaDeString

;; Exemplos de elementos do conjunto ListaDeString:
(define lista-strings-vazia empty)
(define lista-strings-1 (list "Morphy" "Steinitz" "Zukertort" "Eichborn" "Anderssen"))
(define lista-strings-2 (list "Karpov" "Alekhine" "Botvinnik" "Mecking" "Korchnoi"))
(define lista-strings-3 (list "Carlsen" "Kasparov" "Kamsky" "Caruana" "Giri"))
(define lista-strings-4 (list "Zukertort" "Eichborn" "Anderssen"))
(define lista-strings-5 (list "Alekhine" "Mecking")) 
(define lista-strings-6 (list "Carlsen" "Giri"))

;; TIPO NODO ====================================================================================================================================================================================================================================================================================

(define-struct nodo (nome vizinhos))

;; Um elemento nodo do conjunto Nodo é uma estrutura
;; (make-nodo n v), em que

;; n : String, representa o nome do nodo

;; v : ListaDeString, representa os nomes dos nodos vizinhos

;; Exemplos de elementos do conjunto Nodo:
(define Helena (make-nodo "Helena" (list "Winnipeg" "Duluth" "Omaha" "Denver")))
(define Winnipeg (make-nodo "Winnipeg" (list "Helena" "Duluth" "SaultStMarie")))
(define Denver (make-nodo "Denver" (list "Helena" "Omaha" "KansasCity" "OklahomaCity" "SantaFe")))
(define SantaFe (make-nodo "SantaFe" (list "Denver" "OklahomaCity")))
(define Duluth (make-nodo "Duluth" (list "Winnipeg" "Helena" "Omaha" "SaultStMarie" "Toronto" "Chicago")))
(define Omaha (make-nodo "Omaha" (list "Helena" "Denver" "KansasCity" "Chicago" "Duluth")))
(define KansasCity (make-nodo "KansasCity" (list "Omaha" "Denver" "OklahomaCity" "SaintLouis"))) 
(define OklahomaCity (make-nodo "OklahomaCity" (list "Denver" "SantaFe" "LittleRock" "KansasCity")))
(define SaultStMarie (make-nodo "SaultStMarie" (list "Winnipeg" "Duluth" "Toronto")))
(define Chicago (make-nodo "Chicago" (list "Duluth" "Omaha" "SaintLouis" "Pittsburgh" "Toronto")))
(define SaintLouis (make-nodo "SaintLouis" (list "KansasCity" "LittleRock" "Nashville" "Pittsburgh" "Chicago")))
(define LittleRock (make-nodo "LittleRock" (list "OklahomaCity" "Nashville" "SaintLouis")))
(define Toronto (make-nodo "Toronto" (list "SaultStMarie" "Duluth" "Chicago" "Pittsburgh")))
(define Pittsburgh (make-nodo "Pittsburgh" (list "Toronto" "Chicago" "SaintLouis" "Nashville")))
(define Nashville (make-nodo "Nashville" (list "SaintLouis" "LittleRock" "Atlanta" "Pittsburgh")))
(define Atlanta (make-nodo "Atlanta" (list "Nashville")))

(define A (make-nodo "A" (list "B" "E")))
(define B (make-nodo "B" (list "E" "F")))
(define C (make-nodo "C" (list "D")))
(define D (make-nodo "D" empty))
(define E (make-nodo "E" (list "C" "F")))
(define F (make-nodo "F" (list "D" "G")))
(define G (make-nodo "G" empty))
                    
;; GRAFO ====================================================================================================================================================================================================================================================================================

;; Um Grafo é

;; 1. empty, ou

;; 2. (cons n g), em que

;; n : Nodo
;; g : Grafo

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 01---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; CONSTANTES DE GRAFOS ====================================================================================================================================================================================================================================================================================

;; MAPA: grafo que representa um mapa com dezesseis cidades
(define MAPA (list Helena Winnipeg Denver SantaFe Duluth Omaha KansasCity OklahomaCity SaultStMarie Chicago SaintLouis LittleRock Toronto Pittsburgh Nashville Atlanta))

;; GRAFO-VAZIO: constante utilizada para representar um grafo vazio
(define GRAFO-VAZIO empty)

;; GRAFO-TESTE: constante utilizada para representar um grafo contendo strings (letras do alfabeto)
(define GRAFO-TESTE (list A B C D E F G))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; ESTÁ-NA-LISTA? ====================================================================================================================================================================================================================================================================================

;; está-na-lista?: String ListaDeString -> Booleano

;; Objetivo: esta função recebe uma string e uma lista de strings, e verifica se
;; a string fornecida está presente na lista de strings. Caso esteja, a função
;; retorna valor lógico verdadeiro. Caso não esteja, a função retorna valor
;; lógico falso. Caso a função receba uma lista vazia, a função retorna valor
;; lógico falso.

;; Exemplos: (está-na-lista? "Morphy" lista-strings-vazia) = #false
;;           (está-na-lista? "Morphy" lista-strings-1) = #true
;;           (está-na-lista? "Carlsen" lista-strings-2) = #false
;;           (está-na-lista? "Kasparov" lista-strings-3) = #true

(define (está-na-lista? s lds)
  [cond
    [(empty? lds) #false]
    [(string=? s (first lds)) #true]
    [else (está-na-lista? s (rest lds))]])

;; Modelo de Solução:

;;  Se a lista está vazia, então retornar valor lógico falso.
;;  Se a lista não está vazia, então

;;   Analisar a lista:
;;    Se a string fornecida e a primeira string da lista são iguais, retornar valor lógico verdadeiro.
;;    Se a string fornecida e a primeira string da lista são diferentes, reaplicar a função utilizando a string fornecida e o resto da lista fornecida como parâmetros.

;; Terminação: a função está-na-lista? analisa cada elemento da lista recursivamente, sempre avançando
;; nas posições da lista, de modo que em algum momento da análise não haverá mais termos a serem analisados
;; e a lista estará vazia, garantindo a terminação da recursão graças à função empty?.

;; Testes:
(check-expect (está-na-lista? "Morphy" lista-strings-vazia) #false)
(check-expect (está-na-lista? "Morphy" lista-strings-1) #true)
(check-expect (está-na-lista? "Carlsen" lista-strings-2) #false)
(check-expect (está-na-lista? "Kasparov" lista-strings-3) #true)

;; SUBTRAI-LISTA ====================================================================================================================================================================================================================================================================================

;; subtrai-lista: ListaDeString ListaDeString -> ListaDeString

;; Objetivo: esta função recebe duas listas de strings, e retorna uma lista
;; contendo somente os elementos da primeira lista que não estão na segunda
;; lista (ou seja, subtrai a segunda lista da primeira). Caso a primeira
;; lista fornecida seja uma lista vazia, a função retorna uma lista vazia.
;; Caso a segunda lista fornecida seja uma lista vazia, a função retorna
;; a primeira lista.

;; Exemplos: (subtrai-lista lista-strings-vazia lista-strings-4) = empty
;;           (subtrai-lista lista-strings-1 lista-strings-vazia) = (list "Morphy" "Steinitz" "Zukertort" "Eichborn" "Anderssen")
;;           (subtrai-lista lista-strings-1 lista-strings-4) = (list "Morphy" "Steinitz")
;;           (subtrai-lista lista-strings-2 lista-strings-5) = (list "Karpov" "Botvinnik" "Korchnoi")
;;           (subtrai-lista lista-strings-3 lista-strings-6) = (list "Kasparov" "Kamsky" "Caruana")

(define (subtrai-lista l1 l2)
  [cond
    [(empty? l1) empty]
    [(está-na-lista? (first l1) l2) (subtrai-lista (rest l1) l2)]
    [else (cons (first l1)(subtrai-lista (rest l1) l2))]])

;; Modelo de solução:

;;  Se a primeira lista fornecida está vazia, então retornar uma lista vazia.
;;  Se a primeira lista fornecida não está vazia, então

;;   Montar uma lista da seguinte forma:
;;    Se o primeiro elemento da primeira lista estiver presente na segunda lista, reaplica-se a função para o resto da primeira lista.
;;    Se o primeiro elemento da primeira lista não estiver presente na segunda lista, cria-se uma lista contendo o primeiro elemento
;;    da primeira lista e o resultado da função quando ela é utilizada com o resto da primeira lista e a segunda lista.

;; Terminação: a função subtrai-lista sempre analisa todos os termos da primeira lista fornecida recursivamente, sempre avançando
;; nas posições da lista. Em razão disso, em algum ponto da recursão todas as posições da primeira lista já terão sido analisadas
;; e a lista estará vazia, o que causa o término da recursão graças à função empty?.

;; Testes:
(check-expect (subtrai-lista lista-strings-vazia lista-strings-4) empty)
(check-expect (subtrai-lista lista-strings-1 lista-strings-vazia) (list "Morphy" "Steinitz" "Zukertort" "Eichborn" "Anderssen"))
(check-expect (subtrai-lista lista-strings-1 lista-strings-4) (list "Morphy" "Steinitz"))
(check-expect (subtrai-lista lista-strings-2 lista-strings-5) (list "Karpov" "Botvinnik" "Korchnoi"))
(check-expect (subtrai-lista lista-strings-3 lista-strings-6) (list "Kasparov" "Kamsky" "Caruana"))
  
;;----------------------------------------------------------------------------------------------------EXERCÍCIO 03---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; TIPO NODO-BOOLEANO ====================================================================================================================================================================================================================================================================================

;; Um elemento nodo-booleano do conjunto Nodo-Booleano é:

;; 1. Um elemento de Nodo,

;; ou

;; 2. Um elemento de Booleano.

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

;; VERIFICA-NOME  ====================================================================================================================================================================================================================================================================================

;; verifica-nome: String Grafo -> Nodo-Booleano

;; Objetivo: esta função auxiliar recebe um nome de um nodo e um grafo,
;; e retorna o nodo do grafo cujo nome corresponde ao nome fornecido.
;; Caso nenhum nodo do grafo tenha o nome igual ao nome fornecido, a
;; função retorna valor lógico falso. Caso a função receba um grafo
;; vazio, a função retorna valor lógico falso.

;; Exemplos: (verifica-nome "Vancouver" GRAFO-VAZIO) = #false
;;           (verifica-nome "Helena" MAPA) = Helena
;;           (verifica-nome "Toronto" MAPA) = Toronto
;;           (verifica-nome "Vancouver" MAPA) = #false

(define (verifica-nome str gra)
  [cond
    [(empty? gra) #false]
    [(string=? (nodo-nome (first gra)) str) (first gra)]
    [else (verifica-nome str (rest gra))]])

;; Modelo de solução:

;;  Se o grafo fornecido for uma lista vazia, retornar valor lógico falso.
;;  Se o grafo fornecido não for uma lista vazia, então

;;   Analisar o grafo:
;;    Se a string correspondente ao nome do primeiro nodo do grafo for igual à string fornecida como parâmetro, retornar esse nodo.
;;    Se a string correspondente ao nome do primeiro nodo do grafo não for igual à string fornecida como parâmetro, reaplica-se a função
;;    com a string fornecida e com o restante do grafo.

;; Terminação: a função verifica-nome sempre analisa todos os termos do grafo fornecido recursivamente, sempre avançando
;; nas posições do grafo. Em razão disso, em algum ponto da recursão todas as posições do grafo já terão sido analisadas
;; e a lista estará vazia, o que causa o término da recursão graças à função empty?.

;; Testes:
(check-expect (verifica-nome "Vancouver" GRAFO-VAZIO) #false)
(check-expect (verifica-nome "Helena" MAPA) Helena)
(check-expect (verifica-nome "Toronto" MAPA) Toronto)
(check-expect (verifica-nome "Vancouver" MAPA) #false) 

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 04---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; TIPO LISTADESTRING-BOOLEANO ===================================================================================================================================================================================================================================================================================

;; Um elemento listadestring-booleano do conjunto ListaDeString-Booleano é:

;; 1. Um elemento de ListaDeString,

;; ou

;; 2. Um elemento de Booleano.

;; ENCONTRA-CAMINHO ====================================================================================================================================================================================================================================================================================

;; encontra-caminho: String String Grafo ListaDeString -> ListaDeString-Booleano

;; Objetivo: dados os nomes das cidades origem e destino, um grafo (mapa) e uma lista de cidades
;; já visitadas, esta função retorna um caminho entre a origem e o destino, de forma tal que cidades
;; já visitadas não sejam visitadas novamente. Se não existir caminho, a função retorna valor
;; lógico falso. Assume-se que as cidades fornecidas fazem parte do grafo.

;; Exemplos: (encontra-caminho "Chicago" "SantaFe" MAPA lista-strings-vazia) = (list "Chicago" "Duluth" "Winnipeg" "Helena" "Omaha" "Denver" "KansasCity" "OklahomaCity" "SantaFe")
;;           (encontra-caminho "Helena" "Atlanta" MAPA (list "Duluth" "Omaha")) = (list "Helena" "Winnipeg" "SaultStMarie" "Toronto" "Chicago" "SaintLouis" "KansasCity" "Denver" "OklahomaCity" "LittleRock" "Nashville" "Atlanta")
;;           (encontra-caminho "KansasCity" "LittleRock" MAPA (list "SaintLouis")) = (list "KansasCity" "Omaha" "Helena" "Winnipeg" "Duluth" "SaultStMarie" "Toronto" "Chicago" "Pittsburgh" "Nashville" "LittleRock")
;;           (encontra-caminho "Winnipeg" "Chicago" MAPA (list "SaultStMarie" "Helena" "Duluth")) = #false
;;           (encontra-caminho "Atlanta" "SantaFe" MAPA (list "Nashville")) = #false

(define (encontra-caminho origem destino grafo visitadas)
  (cond
    [(string=? origem destino) (list destino)]
    [else
     (local
       (
        (define visitadas-novo (cons origem visitadas))
        (define caminho (encontra-caminhos-vizinhos (subtrai-lista (nodo-vizinhos (verifica-nome origem grafo)) visitadas-novo) destino grafo visitadas-novo))
        )
       (cond
         [(boolean? caminho) #false]
         [else (cons origem caminho)]))]))

;; Modelo de solução:

;;  Se a origem for igual ao destino, retornar a lista com o destino.
;;  Se a origem e o destino forem diferentes, então

;;   Definir um nome local (visitadas-novo) que guarda os visitados, incluindo a origem (que agora é um nodo já visitado)
;;   e outro nome que guarda um caminho entre um dos vizinhos não visitados do nodo origem e o destino, se existir caminho.

;;    Em seguida, testar este nome local (caminho):
;;     Se o nome for um booleano (não há caminho), retornar valor lógico falso
;;     Se o nome não for um booleano (há um caminho), retornar esse caminho, colocando o nodo origem na frente.

;; Terminação: sabe-se que o algoritmo de backtracking percorre todos os elementos da lista que corresponde ao grafo
;; utilizando chamadas de referência mútua com a função encontra-caminhos-vizinhos. Em razão disso, em algum momento
;; da recursão o grafo estará todo percorrido (lista vazia), garantindo o término da função graças às funções
;; empty? e boolean?. Nos casos em que não existem caminhos possíveis de serem percorridos, o término também
;; ocorre em razão das funções empty? e boolean?.

;; Testes:
(check-expect (encontra-caminho "Chicago" "SantaFe" MAPA lista-strings-vazia) (list "Chicago" "Duluth" "Winnipeg" "Helena" "Omaha" "Denver" "KansasCity" "OklahomaCity" "SantaFe"))
(check-expect (encontra-caminho "Helena" "Atlanta" MAPA (list "Duluth" "Omaha")) (list "Helena" "Winnipeg" "SaultStMarie" "Toronto" "Chicago" "SaintLouis" "KansasCity" "Denver" "OklahomaCity" "LittleRock" "Nashville" "Atlanta"))
(check-expect (encontra-caminho "KansasCity" "LittleRock" MAPA (list "SaintLouis")) (list "KansasCity" "Omaha" "Helena" "Winnipeg" "Duluth" "SaultStMarie" "Toronto" "Chicago" "Pittsburgh" "Nashville" "LittleRock"))
(check-expect (encontra-caminho "Winnipeg" "Chicago" MAPA (list "SaultStMarie" "Helena" "Duluth")) #false)
(check-expect (encontra-caminho "Atlanta" "SantaFe" MAPA (list "Nashville")) #false)
     
;; ENCONTRA-CAMINHOS-VIZINHOS ====================================================================================================================================================================================================================================================================================

;; encontra-caminhos-vizinhos: ListaDeString String Grafo ListaDeString -> ListaDeString-Booleano

;; Objetivo: dadas uma lista de cidades origem, um destino, um grafo (mapa) e uma lista de cidades já visitadas,
;; esta função encontra um caminho entre alguma das origens e o destino. Se não existir caminho, a função retorna
;; valor lógico falso.

;; Exemplos: (encontra-caminhos-vizinhos (list "Duluth" "Omaha" "SaintLouis" "Pittsburgh" "Toronto") "SantaFe" MAPA (list "Chicago")) = (list "Duluth" "Winnipeg" "Helena" "Omaha" "Denver" "KansasCity" "OklahomaCity" "SantaFe")
;;           (encontra-caminhos-vizinhos (list "Winnipeg" "Denver") "Atlanta" MAPA (list "Winnipeg" "Denver")) = (list "Winnipeg" "Helena" "Duluth" "Omaha" "KansasCity" "OklahomaCity" "LittleRock" "Nashville" "Atlanta")
;;           (encontra-caminhos-vizinhos (list "KansasCity" "SaintLouis") "Toronto" MAPA (list "Omaha")) = (list "KansasCity" "Denver" "Helena" "Winnipeg" "Duluth" "SaultStMarie" "Toronto") 
;;           (encontra-caminhos-vizinhos (list "Chicago" "Toronto") "SantaFe" MAPA (list "Winnipeg" "Duluth" "Omaha" "KansasCity" "OklahomaCity")) = #false
;;           (encontra-caminhos-vizinhos (list "Helena" "Winnipeg") "Chicago" MAPA (list "Denver" "Omaha" "Duluth" "SaultStMarie")) = #false

(define (encontra-caminhos-vizinhos lista-origens destino grafo visitadas) 
  (cond
    [(empty? lista-origens) #false]
    [else (local
            (
             (define caminho (encontra-caminho (first lista-origens) destino grafo visitadas))
             )
            (cond
              [(boolean? caminho)(encontra-caminhos-vizinhos (rest lista-origens) destino grafo visitadas)] 
              [else caminho]))]))

;; Modelo de solução:

;;  Se a lista de origens for vazia, retornar valor lógico falso.
;;  Se a lista de origens não for vazia, então

;;   Definir um nome local que guarda um caminho entre o primeiro nodo da lista de origens e o destino,
;;   não passando pelos nodos já visitados, se não existir caminho false é armazenado.

;;   Em seguida, testar esse nome local (caminho):
;;    Se o caminho for um booleano, então procurar um caminho entre um nodo do resto da lista de origens até o destino
;;    Se o caminho não for um booleano, então devolver esse caminho.
 
;; Terminação: sabe-se que o algoritmo de backtracking percorre todos os elementos da lista que corresponde ao grafo
;; utilizando chamadas de referência mútua com a função encontra-caminhos. Em razão disso, em algum momento
;; da recursão o grafo estará todo percorrido (lista vazia), garantindo o término da recursão graças às funções
;; empty? e boolean?. Nos casos em que não existem caminhos possíveis de serem percorridos, o término também
;; ocorre em razão das funções empty? e boolean?.

;; Testes:
(check-expect (encontra-caminhos-vizinhos (list "Duluth" "Omaha" "SaintLouis" "Pittsburgh" "Toronto") "SantaFe" MAPA (list "Chicago")) (list "Duluth" "Winnipeg" "Helena" "Omaha" "Denver" "KansasCity" "OklahomaCity" "SantaFe"))
(check-expect (encontra-caminhos-vizinhos (list "Winnipeg" "Denver") "Atlanta" MAPA (list "Winnipeg" "Denver")) (list "Winnipeg" "Helena" "Duluth" "Omaha" "KansasCity" "OklahomaCity" "LittleRock" "Nashville" "Atlanta"))
(check-expect (encontra-caminhos-vizinhos (list "KansasCity" "SaintLouis") "Toronto" MAPA (list "Omaha")) (list "KansasCity" "Denver" "Helena" "Winnipeg" "Duluth" "SaultStMarie" "Toronto"))
(check-expect (encontra-caminhos-vizinhos (list "Chicago" "Toronto") "SantaFe" MAPA (list "Winnipeg" "Duluth" "Omaha" "KansasCity" "OklahomaCity")) #false)
(check-expect (encontra-caminhos-vizinhos (list "Helena" "Winnipeg") "Chicago" MAPA (list "Denver" "Omaha" "Duluth" "SaultStMarie")) #false)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; LISTA DE LISTA DE STRINGS ====================================================================================================================================================================================================================================================================================

;; Um elemento listadelistadestring do conjunto ListaDeListaDeString é

;; 1. Uma lista vazia empty, ou

;; 2. (cons lds ldlds), em que:

;; lds: ListaDeString
;; ldlds: ListaDeListaDeString

;; TIPO LISTADELISTADESTRING-BOOLEANO ===================================================================================================================================================================================================================================================================================

;; Um elemento listadelistadestring-booleano do conjunto ListaDeListaDeString-Booleano é:

;; 1. Um elemento de ListaDeListaDeString,

;; ou

;; 2. Um elemento de Booleano.

;; ENCONTRA-TODOS-CAMINHOS  ====================================================================================================================================================================================================================================================================================

;; encontra-todos-caminhos:  String String Grafo -> ListaDeListaDeString-Booleano

;; Objetivo: esta função recebe o nome de uma cidade de origem, o nome de uma cidade de destino e
;; um grafo. A função retorna todos os caminhos existentes entre a cidade de origem e a cidade de
;; destino. Assume-se que todas as cidades fornecidas pertencem ao grafo informado. Caso não exista
;; nenhum caminho possível de ser percorrido entre as duas cidades, a função retorna valor lógico falso.

;; Exemplos: (encontra-todos-caminhos "E" "G" GRAFO-TESTE) = (list (list "E" "F" "G")) 
;;           (encontra-todos-caminhos "A" "G" GRAFO-TESTE) = (list (list "A" "B" "E" "F" "G") (list "A" "B" "F" "G") (list "A" "E" "F" "G"))
;;           (encontra-todos-caminhos "A" "F" GRAFO-TESTE) = #false
;;           (encontra-todos-caminhos "D" "A" GRAFO-TESTE) = #false

(define (encontra-todos-caminhos origem destino grafo)
  (cond
    [(empty? (encontra-todos-caminhos-visitadas origem destino grafo empty)) #false]
    [else (encontra-todos-caminhos-visitadas origem destino grafo empty)]))

;; Testes:
(check-expect (encontra-todos-caminhos "E" "G" GRAFO-TESTE) (list (list "E" "F" "G")))
(check-expect (encontra-todos-caminhos "A" "G" GRAFO-TESTE) (list (list "A" "B" "E" "F" "G") (list "A" "B" "F" "G") (list "A" "E" "F" "G")))
(check-expect (encontra-todos-caminhos "E" "A" GRAFO-TESTE) #false)
(check-expect (encontra-todos-caminhos "D" "A" GRAFO-TESTE) #false)

;; ENCONTRA-TODOS-CAMINHOS-VISITADAS ====================================================================================================================================================================================================================================================================================

;; encontra-todos-caminhos-visitadas: String String Grafo ListaDeString -> ListaDeListaDeString

;; Objetivo: esta função auxiliar recebe o nome de uma cidade de origem, o nome de uma cidade de destino,
;; um grafo e uma lista contendo as cidades já visitadas. A função retorna todos os caminhos
;; existentes entre a cidade de origem e a cidade de destino, sem incluir as cidades da lista
;; de cidades já visitadas. Assume-se que todas as cidades fornecidas pertencem ao grafo informado.
;; Caso não exista nenhum caminho possível de ser percorrido entre as duas cidades, a função retorna
;; uma lista vazia.

;; Exemplos: (encontra-todos-caminhos-visitadas "E" "G" GRAFO-TESTE empty) = (list (list "E" "F" "G")) 
;;           (encontra-todos-caminhos-visitadas "A" "G" GRAFO-TESTE empty) = (list (list "A" "B" "E" "F" "G") (list "A" "B" "F" "G") (list "A" "E" "F" "G"))
;;           (encontra-todos-caminhos-visitadas "A" "F" GRAFO-TESTE (list "B" "E")) = empty
;;           (encontra-todos-caminhos-visitadas "D" "A" GRAFO-TESTE empty) = empty

(define (encontra-todos-caminhos-visitadas origem destino grafo visitadas)
  (cond
    [(string=? origem destino) (list (list destino))]
    [else
     (local
       (
        (define visitadas-novo (cons origem visitadas))
        (define caminho (encontra-todas-listas-caminhos (subtrai-lista (nodo-vizinhos (verifica-nome origem grafo)) visitadas-novo) destino grafo visitadas-novo))
        )
       (monta-caminhos origem caminho))]))

;; Modelo de solução:

;;  Se a origem e o destino forem iguais, devolver uma lista contendo uma lista somente com o destino.
;;  Se a origem e o destino forem diferentes, então:

;;   Definir uma lista nova de cidades visitadas (visitadas-novo) incluindo a cidade de origem no início da lista de cidades visitadas.
;;   Definir um nome local (caminho) que guarda todos os caminhos entre as cidades vizinhas e a cidade origem (considerando somente as que não foram visitadas ainda).
;;   Em seguida, colocar a cidade de origem no início de cada um desses caminhos gerados.

;; Terminação: sabe-se que o algoritmo de backtracking percorre todos os elementos da lista que corresponde ao grafo
;; utilizando chamadas de referência mútua com a função encontra-todas-listas-caminhos. Em razão disso, em algum momento
;; da recursão o grafo estará todo percorrido (lista vazia), garantindo o término da recursão graças às funções
;; empty? e boolean?. Nos casos em que não existem caminhos possíveis de serem percorridos, o término também
;; ocorre em razão das funções empty? e boolean?.

;; Testes:
(check-expect (encontra-todos-caminhos-visitadas "E" "G" GRAFO-TESTE empty) (list (list "E" "F" "G")))
(check-expect (encontra-todos-caminhos-visitadas "A" "G" GRAFO-TESTE empty) (list (list "A" "B" "E" "F" "G") (list "A" "B" "F" "G") (list "A" "E" "F" "G")))
(check-expect (encontra-todos-caminhos-visitadas "A" "F" GRAFO-TESTE (list "B" "E")) empty)
(check-expect (encontra-todos-caminhos-visitadas "D" "A" GRAFO-TESTE empty) empty)

;; ENCONTRA-TODAS-LISTAS-CAMINHOS ====================================================================================================================================================================================================================================================================================

;; encontra-todas-listas-caminhos: ListaDeString String Grafo ListaDeString -> ListaDeListaDeString

;; Objetivo: esta função auxiliar recebe uma lista de cidades vizinhas à uma determinada cidade,
;; o nome de uma cidade de destino, um grafo e uma lista de cidades já visitadas. A função retorna
;; todos os caminhos existentes entre todas as cidades da lista de cidades vizinhas até a cidade de
;; destino, sem incluir as cidades da lista de cidades já visitadas. Assume-se que todas as cidades
;; fornecidas pertencem ao grafo informado. Caso não exista nenhum caminho possível de ser percorrido
;; entre as duas cidades, a função retorna uma lista vazia.

;; Exemplos: (encontra-todas-listas-caminhos (list "B" "E") "G" GRAFO-TESTE (list "A")) = (list (list "B" "E" "F" "G") (list "B" "F" "G") (list "E" "F" "G"))
;;           (encontra-todas-listas-caminhos (list "C" "F") "G" GRAFO-TESTE empty)) = (list (list "F" "G"))
;;           (encontra-todas-listas-caminhos empty "A" GRAFO-TESTE empty) = empty
;;           (encontra-todas-listas-caminhos (list "A") "G" GRAFO-TESTE (list "B" "E")) = empty

(define (encontra-todas-listas-caminhos lista-origens destino grafo visitadas) 
  (cond
    [(empty? lista-origens) empty]
    [else (local
            (
             (define caminho (encontra-todos-caminhos-visitadas (first lista-origens) destino grafo visitadas))
             )
            (cond
              [else (append caminho (encontra-todas-listas-caminhos (rest lista-origens) destino grafo visitadas))]))])) 

;; Modelo de solução:

;;  Se a lista de origens for uma lista vazia, retornar uma lista vazia.
;;  Se a lista de origens não for uma lista vazia, então:

;;  Definir um nome local (caminho, que é uma lista) que guarda todos os caminhos entre a primeira cidade da lista de origens e a cidade destino (considerando somente as que não foram visitadas ainda).
;;  Em seguida, juntar essa lista (nome local) com todas as outras listas de caminhos existentes entre cada cidade da lista de origens e a cidade destino.

;; Terminação: sabe-se que o algoritmo de backtracking percorre todos os elementos da lista que corresponde ao grafo
;; utilizando chamadas de referência mútua com a função encontra-todos-caminhos-visitadas. Em razão disso, em algum momento
;; da recursão o grafo estará todo percorrido (lista vazia), garantindo o término da recursão graças às funções
;; empty? e boolean?. Nos casos em que não existem caminhos possíveis de serem percorridos, o término também
;; ocorre em razão das funções empty? e boolean?.

;; Testes:
(check-expect (encontra-todas-listas-caminhos (list "B" "E") "G" GRAFO-TESTE (list "A")) (list (list "B" "E" "F" "G") (list "B" "F" "G") (list "E" "F" "G")))
(check-expect (encontra-todas-listas-caminhos (list "C" "F") "G" GRAFO-TESTE empty) (list (list "F" "G")))
(check-expect (encontra-todas-listas-caminhos empty "A" GRAFO-TESTE empty) empty)
(check-expect (encontra-todas-listas-caminhos (list "A") "G" GRAFO-TESTE (list "B" "E")) empty)

;; MONTA-CAMINHOS ====================================================================================================================================================================================================================================================================================

;; monta-caminhos: String ListaDeListaDeString -> ListaDeListaDeString

;; Objetivo: esta função auxiliar recebe uma string e uma lista de listas de strings,
;; e devolve uma lista de listas de strings, onde cada uma das listas tem como primeiro
;; elemento o string fornecida.

;; Exemplos: (monta-caminhos "A" (list (list "B" "C") (list "D"))) = (list (list "A" "B" "C") (list "A" "D"))
;;           (monta-caminhos "A" empty) = empty
;;           (monta-caminhos "C" (list (list "A" "B" "D") (list "X" "Y" "Z"))) = (list (list "C" "A" "B" "D") (list "C" "X" "Y" "Z"))

(define (monta-caminhos nome lista)
  (cond
    [(empty? lista) empty]
    [else (cons (cons nome (first lista))(monta-caminhos nome (rest lista)))]))

;; Modelo de solução:

;;  Se a lista fornecida estiver vazia, retornar uma lista vazia.
;;  Se a lista fornecida não estiver vazia, então:

;;  Construir uma lista com

;;   A lista gerada colocando nome na frente da primeira lista de lista,
;;   e com as listas geradas colocando nome na frente das outras listas de lista.

;; Terminação: a função monta-caminhos percorre toda a lista de lista de strings recursivamente.
;; Em algum momento da recursão, não haverá mais lista de strings dentro da lista principal, o
;; que causará o término da recursão graças à função empty?.

;; Testes:
(check-expect (monta-caminhos "A" (list (list "B" "C") (list "D"))) (list (list "A" "B" "C") (list "A" "D")))
(check-expect (monta-caminhos "A" empty) empty)
(check-expect (monta-caminhos "C" (list (list "A" "B" "D") (list "X" "Y" "Z"))) (list (list "C" "A" "B" "D") (list "C" "X" "Y" "Z"))) 

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 06---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; MOSTRA-CAMINHOS ====================================================================================================================================================================================================================================================================================

;; mostra-caminhos: String String Grafo -> String

;; Objetivo: esta função recebe uma cidade origem, uma cidade destino e um grafo de cidades.
;; A função retorna uma string contendo na primeira linha o número de caminhos existentes
;; da cidade origem até a destino e depois a lista de todos os caminhos. Os caminhos serão
;; numerados, um em cada linha. Assume-se que as duas cidades fornecidas pertencem ao grafo.

;; Exemplos: (mostra-caminhos "A" "G" GRAFO-TESTE) = "Número de caminhos possíveis: 3\n1.  A -> B -> E -> F -> G \n2.  A -> B -> F -> G \n3.  A -> E -> F -> G \n"
;;           (mostra-caminhos "E" "G" GRAFO-TESTE) = "Número de caminhos possíveis: 1\n1.  E -> F -> G \n"
;;           (mostra-caminhos "G" "A" GRAFO-TESTE) = "Número de caminhos possíveis: 0\n"

(define (mostra-caminhos origem destino grafo)
  (mostra-varias-listas (encontra-todos-caminhos origem destino grafo)))

;; Testes:
(check-expect (mostra-caminhos "A" "G" GRAFO-TESTE) "Número de caminhos possíveis: 3\n1.  A -> B -> E -> F -> G \n2.  A -> B -> F -> G \n3.  A -> E -> F -> G \n")
(check-expect (mostra-caminhos "E" "G" GRAFO-TESTE) "Número de caminhos possíveis: 1\n1.  E -> F -> G \n")
(check-expect (mostra-caminhos "G" "A" GRAFO-TESTE) "Número de caminhos possíveis: 0\n")

;; MOSTRA-VARIAS-LISTAS ====================================================================================================================================================================================================================================================================================

;; mostra-varias-listas: ListaDeListaDeString-Booleano -> String

;; Objetivo: esta função auxiliar recebe uma lista de lista de strings, representando todos os
;; caminhos possíveis em um grafo, e retorna esses caminhos numa formatação adequada em strings.

;; Exemplos: (mostra-varias-listas (encontra-todos-caminhos "A" "G" GRAFO-TESTE) "A" "G" GRAFO-TESTE 0) = "Número de caminhos possíveis: 3\n1.  A -> B -> E -> F -> G \n2.  A -> B -> F -> G \n3.  A -> E -> F -> G \n"
;;           (mostra-varias-listas (encontra-todos-caminhos "E" "G" GRAFO-TESTE) "E" "G" GRAFO-TESTE 0) = "Número de caminhos possíveis: 1\n1.  E -> F -> G \n"
;;           (mostra-varias-listas (encontra-todos-caminhos "G" "A" GRAFO-TESTE) "G" "A" GRAFO-TESTE 0) = "Número de caminhos possíveis: 0\n"

(define (mostra-varias-listas caminhos)
  (local
    (
     (define tamanho (if (boolean? caminhos) 0 (length caminhos)))
     (define (enumera-listas lista numero)
       (if (boolean? lista) ""
           (cond
             [(empty? lista) ""]
             [else (string-append (number->string numero) ".  " (mostra-uma-lista (first lista)) "\n" (enumera-listas (rest lista) (+ 1 numero)))]))))
    (string-append "Número de caminhos possíveis: " (number->string tamanho) "\n" (enumera-listas caminhos 1))))

;; Modelo de solução:

;;  Definir uma constante local (tamanho) para representar a quantidade total de caminhos existentes. Se a função recebeu
;;  um booleano, essa constante é zero, caso contrário ela é a quantidade de caminhos existentes no grafo entre o destino
;;  e a origem.
;;  Definir a função local enumera-listas, que recebe uma lista de listas de string, e imprime essa lista precedida por um
;;  número que é incrementado a cada iteração de forma a criar uma representação em lista dentro da string final.
;;  Se a lista fornecida é um booleano, então retornar uma string vazia.
;;  Se a lista fornecida não é um booleano, então:

;;   Trabalhar com a lista:

;;    Se a lista for uma lista vazia, então retornar uma string vazia.
;;    Se a lista não for uma lista vazia, então retornar uma string com uma representação em lista com numeração e quebra de linhas,
;;    envolvendo todas as listas da lista de strings.

;; Terminação: a função mostra-varias-listas sempre trabalha com todos os elementos da
;; lista fornecida como parâmetro, sempre avançando nas posições da lista. Em razão disso,
;; em algum momento não haverá mais posições para serem trabalhada (lista vazia) e a recursão
;; será interrompida, graças à função empty?.

;; Testes:
(check-expect (mostra-varias-listas (encontra-todos-caminhos "A" "G" GRAFO-TESTE)) "Número de caminhos possíveis: 3\n1.  A -> B -> E -> F -> G \n2.  A -> B -> F -> G \n3.  A -> E -> F -> G \n")
(check-expect (mostra-varias-listas (encontra-todos-caminhos "E" "G" GRAFO-TESTE)) "Número de caminhos possíveis: 1\n1.  E -> F -> G \n")
(check-expect (mostra-varias-listas (encontra-todos-caminhos "G" "A" GRAFO-TESTE)) "Número de caminhos possíveis: 0\n")

;; ENUMERA-LISTAS ====================================================================================================================================================================================================================================================================================

;; enumera-listas: ListaDeListaDeString-Booleano Número -> String

;; Objetivo: esta função auxiliar e local recebe uma lista de listas de string, e imprime essa lista precedida por um número
;; que é incrementado a cada iteração de forma a criar uma representação em lista dentro da string final.

;; Exemplos: (enumera-listas (list (list "A" "B") (list "C" "D")) 0) = "0. A -> B\n 1. C -> D\n"
;;           (enumera-listas empty 10) = ""
;;           (enumera-listas #false 20) = ""

;; MOSTRA-UMA-LISTA ====================================================================================================================================================================================================================================================================================

;; mostra-uma-lista: ListaDeString -> String

;; Objetivo: esta função auxiliar recebe uma lista de strings, e retorna
;; uma única string contendo todo os elementos da lista de strings fornecida.
;; Caso a função receba uma lista vazia, a função retorna uma string vazia.

;; Exemplos: (mostra-uma-lista empty) = ""
;;           (mostra-uma-lista lista-strings-1) = "Morphy -> Steinitz -> Zukertort -> Eichborn -> Anderssen "
;;           (mostra-uma-lista lista-strings-2) = "Karpov -> Alekhine -> Botvinnik -> Mecking -> Korchnoi "
;;           (mostra-uma-lista lista-strings-3) = "Carlsen -> Kasparov -> Kamsky -> Caruana -> Giri "

(define (mostra-uma-lista lista)
  (cond
    [(empty? lista) ""]
    [(empty? (rest lista)) (string-append (first lista) " "(mostra-uma-lista (rest lista)))]
    [else (string-append (first lista) " -> " (mostra-uma-lista (rest lista)))]))

;; Modelo de solução:

;;  Se a lista fornecida for uma lista vazia, retornar uma string vazia.
;;  Se não existirem caminhos possíveis de serem percorridos entre a origem e o destino, retornar uma string informando isso.
;;  Se a lista fornecida não é vazia e existem caminhos possíveis de serem percorridos, então:

;;   Trabalhar com os parâmetros:

;;    Se o parâmetro n for igual a zero, informar uma única vez o número de caminhos possíveis,
;;    e abaixo colocar o primeiro caminho possível de ser percorrido, já com a sua respectiva numeração.

;;    Se o parâmetro n for diferente de zero, então criar uma string contendo o parâmetro n (usado para
;;    numeração), todos os elementos da primeira lista de strings e todos os elementos do restante da
;;    das outras listas da lista de lista de strings.

;; Terminação: a função mostra-uma-lista sempre trabalha com todos os elementos da lista
;; fornecida como parâmetro, sempre avançando nas posições da lista. Em razão disso, em
;; algum momento não haverá mais posições para serem trabalhada (lista vazia) e a recursão
;; será interrompida, graças à função empty?.

;; Testes:
(check-expect (mostra-uma-lista empty) "")
(check-expect (mostra-uma-lista lista-strings-1) "Morphy -> Steinitz -> Zukertort -> Eichborn -> Anderssen ") 
(check-expect (mostra-uma-lista lista-strings-2) "Karpov -> Alekhine -> Botvinnik -> Mecking -> Korchnoi ")
(check-expect (mostra-uma-lista lista-strings-3) "Carlsen -> Kasparov -> Kamsky -> Caruana -> Giri ")
