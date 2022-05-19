;;----------------------------------------------------------------------------------------------------EXERCÍCIO 01---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; estrutura carro ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

(define-struct carro (ano modelo preco ar hidraulica vidro))

;; Um elemento carro do conjunto Carro leva sempre o nome do modelo do carro em questão seguido das letras da sua placa e é uma estrutura
;; (make-carro um-ano um-modelo um-preco um-ar uma-hidraulica um-vidro) em que:

;; um-ano: Número - corresponde ao ano de fabricação do carro;

;; um-modelo: String - corresponde à descrição do modelo do carro;

;; um-preco: Número - corresponde ao preço de mercado do carro, em reais;

;; um-ar: Booleano - caso seja um valor lógico verdadeiro, significa que o carro em questão possui ar condicionado. Caso seja um valor lógico falso, significa que o carro em questão não possui ar condicionado;

;; uma-hidraulica: Booleano - caso seja um valor lógico verdadeiro, significa que o carro em questão possui direção hidráulica. Caso seja um valor lógico falso, significa que o carro em questão não possui direção hidráulica;

;; um-vidro: Booleano - caso seja um valor lógico verdadeiro, significa que o carro em questão possui vidro elétrico. Caso seja um valor lógico falso, significa que o carro em questão não possui vidro elétrico.

;; Exemplos de elementos do conjunto Carro:
(define celta-ILT (make-carro 2009 "celtaspirit" 25000 #true #true #true))
(define uno-IGT (make-carro 2005 "unomille" 20000 #false #false #false))
(define fiesta-IQA (make-carro 2012 "fiestahatch" 30000 #true #false #true))
(define corsa-ILS (make-carro 2000 "corsamaxx" 15000 #false #false #false))
(define palio-IJC (make-carro 2014 "paliofire" 40000 #true #true #true))
(define gol-IGF (make-carro 1998 "golvolkswagen" 12000 #false #false #false))
(define idea-ITR (make-carro 2015 "ideaattractive" 45000 #true #true #true))
(define parati-IFT (make-carro 1997 "parativolkswagen" 11000 #false #false #false))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; lista de carros ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; Um elemento lista-de-carros do conjunto Lista-de-carros é:

;; 1. A lista vazia empty

;; ou

;; 2. (cons c ldc), em que
;; c: Carro e
;; ldc: Lista-de-carros

;; Exemplos:
(define lista-carros-vazia empty)
(define lista-de-carros-1 (cons celta-ILT(cons uno-IGT(cons fiesta-IQA(cons corsa-ILS empty)))))
(define lista-de-carros-2 (cons palio-IJC(cons gol-IGF(cons idea-ITR(cons parati-IFT empty)))))
(define lista-de-carros-3 (cons uno-IGT(cons corsa-ILS(cons gol-IGF(cons parati-IFT empty)))))

;; TEMAC? ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; temAC?: Lista-de-carros -> Booleano

;; Objetivo: esta função recebe um cadastro de carros em forma de lista, e retorna valor
;; lógico verdadeiro caso pelo menos um carro da lista possua ar condicionado, ou valor
;; lógico falso caso nenhum carro da lista possua ar condicionado. Caso a função receba
;; uma lista vazia, a função retorna valor lógico falso.

;; Exemplos: (temAC? lista-carros-vazia) = #false
;;           (temAC? lista-de-carros-1) = #true
;;           (temAC? lista-de-carros-2) = #true
;;           (temAC? lista-de-carros-3) = #false

(define (temAC? uma-lista-de-carros)
  [cond
    [(empty? uma-lista-de-carros) #false]
    [else
     [cond
       [(carro-ar (first uma-lista-de-carros)) #true]
       [else (temAC? (rest uma-lista-de-carros))]]]])

;; Testes:
(check-expect (temAC? lista-carros-vazia) #false)
(check-expect (temAC? lista-de-carros-1) #true)
(check-expect (temAC? lista-de-carros-2) #true)
(check-expect (temAC? lista-de-carros-3) #false)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 03---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; QUANTOSVE ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; quantosVE: Lista-de-carros -> Número

;; Objetivo: esta função recebe um cadastro de carros em forma de lista, e retorna
;; um valor numérico representando a quantidade de carros da lista que possuem
;; vidro elétrico. Caso a função receba uma lista de carros vazia, a função retorna
;; o número zero.

;; Exemplos: (quantosVE lista-carros-vazia) = 0
;;           (quantosVE lista-de-carros-1) = 2
;;           (quantosVE lista-de-carros-2) = 2
;;           (quantosVE lista-de-carros-3) = 0

(define (quantosVE uma-lista-de-carros)
  [cond
    [(empty? uma-lista-de-carros) 0]
    [else (+ (contador (carro-vidro (first uma-lista-de-carros))) (quantosVE (rest uma-lista-de-carros)))]])

;; Testes:
(check-expect (quantosVE lista-carros-vazia) 0)
(check-expect (quantosVE lista-de-carros-1) 2)
(check-expect (quantosVE lista-de-carros-2) 2)
(check-expect (quantosVE lista-de-carros-3) 0)


;; CONTADOR ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; contador: Booleano -> Número

;; Objetivo: esta função auxiliar recebe um valor lógico, e retorna o número 1
;; se o valor lógico for verdadeiro e 0 se o valor lógico for falso.

;; Exemplos: (contador #true) = 1
;;           (contador #false) = 0
;;           (contador (carro-vidro uno-IGT)) = 0

(define (contador valorlogico)
  [cond
    [valorlogico 1]
    [else 0]])

;; Testes:
(check-expect (contador #true) 1)
(check-expect (contador #false) 0)
(check-expect (contador (carro-vidro uno-IGT)) 0)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 04---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; VALOR ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; valor: Lista-de-carros -> Número

;; Objetivo: esta função recebe um cadastro de carros em forma de lista, e retorna
;; um valor numérico representando a soma do valor de mercado (em reais) de todos
;; os carros da lista. Caso a função receba uma lista vazia, a função retorna o
;; número zero.

;; Exemplos: (valor lista-carros-vazia) = 0
;;           (valor lista-de-carros-1) = 90000
;;           (valor lista-de-carros-2) = 108000
;;           (valor lista-de-carros-3) = 58000

(define (valor uma-lista-de-carros)
  [cond
    [(empty? uma-lista-de-carros) 0]
    [else (+ (carro-preco (first uma-lista-de-carros)) (valor (rest uma-lista-de-carros)))]])

;; Testes:
(check-expect (valor lista-carros-vazia) 0)
(check-expect (valor lista-de-carros-1) 90000)
(check-expect (valor lista-de-carros-2) 108000)
(check-expect (valor lista-de-carros-3) 58000)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; TIPO CARRO-STRING =======================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; Um elemento carro-string do conjunto Carro-String é

;; 1. Um elemento de Carro;

;; ou

;; 2. Um elemento de String.

;; Exemplos de elementos do conjunto Carro-String:
(define idea-INJ (make-carro 2017 "ideaattractive" 48000 #true #true #true))
(define celta-IWT (make-carro 2011 "celtaspirit" 30000 #true #true #true))
(define constanteN "N")

;; DECVALOR ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================
 
;; decValor: Lista-de-carros Número -> Carro-String

;; Objetivo: esta função recebe um cadastro de carros em forma de lista e um número representando
;; o ano corrente, e retorna um (qualquer um) carro com ano de fabricação igual ao ano corrente,
;; com valor de mercado decrescido de 10%. Se não houver nenhum carro com ano de fabricação 
;; igual ao ano corrente, retorna “Não há carros deste ano no cadastro”. Caso a função receba uma
;; lista vazia, a função retorna “Não há carros deste ano no cadastro”.
 
;; Exemplos: (decValor lista-carros-vazia 2010) = "Não há carros deste ano no cadastro"
;;           (decValor lista-de-carros-1 2012) = (make-carro 2012 "fiestahatch" 30000 #true #false #true) 
;;           (decValor lista-de-carros-2 2015) = (make-carro 2015 "ideaattractive" 405000 #true #true #true)
;;           (decValor lista-de-carros-3 2009) = "Não há carros deste ano no cadastro"

(define (decValor uma-lista-de-carros ano-corrente)
  [cond
    [(empty? uma-lista-de-carros) "Não há carros deste ano no cadastro"]
    [(= ano-corrente (carro-ano(first uma-lista-de-carros))) (reduzvalor (first uma-lista-de-carros))] 
    [else (decValor (rest uma-lista-de-carros) ano-corrente)]]) 

;; Testes:
(check-expect (decValor lista-carros-vazia 2010) "Não há carros deste ano no cadastro")
(check-expect (decValor lista-de-carros-1 2012) (make-carro 2012 "fiestahatch" 27000 #true #false #true))
(check-expect (decValor lista-de-carros-2 2015) (make-carro 2015 "ideaattractive" 40500 #true #true #true))
(check-expect (decValor lista-de-carros-3 2009) "Não há carros deste ano no cadastro")

;; REDUZVALOR ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================
 
;; reduzvalor: Carro -> Carro

;; Objetivo: esta função auxiliar recebe um carro, e retorna o carro
;; com o seu preço de mercado original reduzido em dez por cento.
       
;; Exemplos: (reduzvalor celta-ILT) = (make-carro 2009 "celtaspirit" 22500 #true #true #true)
;;           (reduzvalor uno-IGT) = (make-carro 2005 "unomille" 18000 #false #false #false)
;;           (reduzvalor fiesta-IQA) = (make-carro 2012 "fiestahatch" 27000 #true #false #true)

(define (reduzvalor um-carro)
  (make-carro (carro-ano um-carro)(carro-modelo um-carro)(* 0.90 (carro-preco um-carro))(carro-ar um-carro)(carro-hidraulica um-carro)(carro-vidro um-carro)))

;; Testes:
(check-expect (reduzvalor celta-ILT) (make-carro 2009 "celtaspirit" 22500 #true #true #true))
(check-expect (reduzvalor uno-IGT) (make-carro 2005 "unomille" 18000 #false #false #false))
(check-expect (reduzvalor fiesta-IQA) (make-carro 2012 "fiestahatch" 27000 #true #false #true))
