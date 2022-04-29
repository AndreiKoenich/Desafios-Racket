;;----------------------------------------------------------------------------------------------------EXERCÍCIO 01---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; estrutura aluno ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

(define-struct aluno (nomealuno matricula curso instituicao))

;; Um elemento aluno do conjunto Aluno é uma estrutura
;; (make-aluno nome matricula curso instituicao), em que:

;; nomealuno: String - corresponde ao nome do aluno;

;; matricula: Número - corresponde ao número de matrícula do aluno;

;; curso: String - corresponde ao curso do aluno;

;; instituicao: String - corresponde à instituição de ensino na qual o aluno está matriculado.

(define Jader (make-aluno "Jader" 130571 "EngenhariaEletrica" "UFRGS"))
(define Diego (make-aluno "Diego" 456723 "EngenhariaQuimica" "UFRGS"))
(define Idemir (make-aluno "Idemir" 110223 "EngenhariaCivil" "UFMG"))
(define Julio (make-aluno "Julio" 118059 "EngenhariaAmbiental" "UFMG"))
(define Estevao (make-aluno "Estevao" 117053 "EngenhariaMecanica" "UFRJ")) 
(define Elmar (make-aluno "Elmar" 777490 "EngenhariaFisica" "UFBA"))

;; estrutura instensino ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

(define-struct instensino (nomeinst anofundacao))

;; Um elemento instensino do conjunto InstEnsino é uma estrutura
;; (make-instensino nomeinst anofundacao), em que:

;; nomeinst: String - corresponde ao nome da instituição de ensino;

;; anofundacao: Número - corresponde ao ano de fundação da instituição de ensino.

(define UFRGS (make-instensino "UFRGS" 1968))
(define UFMG (make-instensino "UFMG" 1927))
(define UFRJ (make-instensino "UFRJ" 1920))
(define UFMA (make-instensino "UFMA" 1966))
(define UNIR (make-instensino "UNIR" 1982))
(define UFBA (make-instensino "UFBA" 1946)) 

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; MESMAINSTITUICAO? ==============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; mesmaInstituicao?: Aluno Aluno Instensino -> Booleano

;; Objetivo: esta função recebe o nome de dois alunos e o nome de uma instituição de ensino, e retorna um valor lógico verdadeiro caso os dois alunos estejam matriculados nessa
;; instituição e um valor lógico falso se os dois não estiverem matriculados na mesma instituição, utilizando as estruturas definidas no exercício 01.
 
;; Exemplos: (mesmaInstituicao? Jader Idemir UFRJ) = #false
;;           (mesmaInstituicao? Idemir Julio UFMG) = #true
;;           (mesmaInstituicao? Jader Estevao UFRGS) = #false

(define (mesmaInstituicao? aluno1 aluno2 inst_ensino)
  (and (string=? (aluno-instituicao aluno1)(aluno-instituicao aluno2))(string=? (aluno-instituicao aluno1)(instensino-nomeinst inst_ensino))))

;; Testes:
(check-expect (mesmaInstituicao? Jader Idemir UFRJ) #false)
(check-expect (mesmaInstituicao? Idemir Julio UFMG) #true)
(check-expect (mesmaInstituicao? Jader Estevao UFRGS) #false)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 03---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; IDADE ==========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; idade: Aluno Aluno Instensino -> Número

;; Objetivo: esta função recebe os nomes de dois alunos e o nome de uma instituição de ensino. Caso os dois alunos estejam
;; matriculados na instituição de ensino, a função retorna a idade da instituição. Caso os dois alunos não estejam matriculados
;; na instituição de ensino fornecida, a função retorna o número -1.

;; Exemplos: (idade Jader Diego UFRGS) = 52
;;           (idade Idemir Julio UFMG) = 93
;;           (idade Estevao Idemir UFRJ) = -1

(define (idade aluno1 aluno2 inst_ensino)
  [cond
    [(mesmaInstituicao? aluno1 aluno2 inst_ensino) (- 2020 (instensino-anofundacao inst_ensino))]
    [else -1]])

;; Testes:
(check-expect (idade Jader Diego UFRGS) 52)
(check-expect (idade Idemir Julio UFMG) 93)
(check-expect (idade Estevao Idemir UFRJ) -1)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 04---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; estrutura carro ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

(define-struct carro (ano modelo valor ar hidraulica vidroeletrico))

;; Um elemento carro do conjunto Carro leva sempre o nome do modelo do carro em questão seguido das letras da sua placa e é uma estrutura
;; (make-carro ano modelo valor ar hidraulica vidroeletrico), em que:

;; ano: Número - corresponde ao ano de fabricação do carro;

;; modelo: String - corresponde à descrição do modelo do carro;

;; valor: Número - corresponde ao valor de mercado do carro, em reais;

;; ar: Booleano - caso seja um valor lógico verdadeiro, significa que o carro em questão possui ar condicionado. Caso seja um valor lógico falso, significa que o carro em questão não possui ar condicionado;

;; hidraulica: Booleano - caso seja um valor lógico verdadeiro, significa que o carro em questão possui direção hidráulica. Caso seja um valor lógico falso, significa que o carro em questão não possui direção hidráulica;

;; vidroeletrico: Booleano - caso seja um valor lógico verdadeiro, significa que o carro em questão possui vidro elétrico. Caso seja um valor lógico falso, significa que o carro em questão não possui vidro elétrico.

(define celta-ILT (make-carro 2009 "celtaspirit" 25000 #true #true #true)) 
(define fiesta-IQA (make-carro 2012 "fiestahatch" 30000 #true #false #true))
(define uno-IGT (make-carro 2005 "unomille" 20000 #false #false #false))
(define corsa-ILS (make-carro 2000 "corsamaxx" 15000 #false #false #false))
(define palio-IJC (make-carro 2014 "paliofire" 40000 #true #true #true))
(define idea-ITR (make-carro 2015 "ideaattractive" 45000 #true #true #true)) 

;; CDC ============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; cdc: Carro -> Número

;; Objetivo: esta função recebe o nome de um carro da locadora (as letras da placa são informadas junto ao nome),
;; e retorna o valor em reais a ser cobrado pela locação diária do carro.

;; Exemplos: (cdc celta-ILT) = 152.50
;;           (cdc fiesta-IQA) = 135
;;           (cdc uno-IGT) = 50

(define (cdc nome_carro)
  (+ (valor-base-carros nome_carro)(valor-acrescimo-carros nome_carro)))

;; Testes:
(check-expect (cdc celta-ILT) 152.50)
(check-expect (cdc fiesta-IQA) 135)
(check-expect (cdc uno-IGT) 50)

;; VALOR-BASE-CARROS ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; valor-base-carros: Carro -> Número

;; Objetivo: esta função auxiliar recebe o nome de um carro da locadora (as letras da placa são informadas junto ao nome),
;; e retorna o valor base em reais a ser cobrado pela locação diária do carro.

;; Exemplos: (valor-base-carros celta-ILT) = 62.50
;;           (valor-base-carros fiesta-IQA) = 75
;;           (valor-base-carros uno-IGT) = 50

(define (valor-base-carros nome_carro)
  (/ (* 0.25 (carro-valor nome_carro)) 100))

;; Testes:
(check-expect (valor-base-carros celta-ILT) 62.50)
(check-expect (valor-base-carros fiesta-IQA) 75)
(check-expect (valor-base-carros uno-IGT) 50)

;; VALOR-BENEFICIOS ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; valor-beneficios: Booleano -> Número

;; Objetivo: esta função auxiliar recebe um valor lógico e retorna um número. Caso seja recebido o valor lógico verdadeiro,
;; a função retorna o número 30. Caso seja recebido o valor lógico falso, a função retorna o número zero.

;; Exemplos: (valor-beneficios #true) = 30
;;           (valor-beneficios #false) = 0

(define (valor-beneficios beneficio)
  (cond
    [beneficio 30]
    [else 0]))

;; Testes:
(check-expect (valor-beneficios #true) 30)
(check-expect (valor-beneficios #false) 0)

;; VALOR-ACRESCIMO-CARROS ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; valor-acrescimo-carros: Carro -> Número

;; Objetivo: esta função auxiliar recebe o nome de um carro da locadora (as letras da placa são informadas junto ao nome),
;; e retorna o valor em reais do acréscimo a ser cobrado pela locação diária do carro. Tal acréscimo é determinado em função
;; das características que o carro pode possuir, sendo elas: vidro eletrico, direção hidráulica e ar condicionado.

;; Exemplos: (valor-acrescimo-carros celta-ILT) = 90
;;           (valor-acrescimo-carros fiesta-IQA) = 60
;;           (valor-acrescimo-carros uno-IGT) = 0

(define (valor-acrescimo-carros nome_carro)
  (+ (valor-beneficios(carro-ar nome_carro))(valor-beneficios(carro-hidraulica nome_carro))(valor-beneficios(carro-vidroeletrico nome_carro))))

;; Testes:
(check-expect (valor-acrescimo-carros celta-ILT) 90)
(check-expect (valor-acrescimo-carros fiesta-IQA) 60)
(check-expect (valor-acrescimo-carros uno-IGT) 0)

;; estrutura moto ===================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

(define-struct moto (ano modelo valor))

;; Um elemento moto do conjunto Moto é uma estrutura
;; (make-moto ano modelo valor), em que:

;; ano: Número - corresponde ao ano de fabricação da moto;

;; modelo: String - corresponde à descrição do modelo da moto;

;; valor: Número - corresponde ao valor de mercado da moto, em reais.

(define hornet-IGF (make-moto 2009 "hornet600" 30000))
(define yamaha-IDE (make-moto 2018 "yamahaxt600" 40000))
(define dafra-IYF (make-moto 2015 "daframaxsym" 15000))
(define kawasaki-IRO (make-moto 2010 "kawasakiz750" 28000))
(define honda-IWQ (make-moto 2017 "hondapcxdlx" 12000))
(define honda-IEQ (make-moto 2015 "hondacb500x" 22000))

;; CDM ==============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; cdm: Moto -> Número

;; Objetivo: esta função recebe o nome de uma moto da locadora (as letras da placa são informadas junto ao nome),
;; e retorna o valor em reais a ser cobrado pela locação diária da moto.

;; Exemplos: (cdm hornet-IGF) = 145
;;           (cdm yamaha-IDE) = 190
;;           (cdm dafra-IYF) = 127.50

(define (cdm nome_moto)
  (+ (valor-base-motos nome_moto)(valor-seguro-motos nome_moto)))

;; Testes:
(check-expect (cdm hornet-IGF) 145)
(check-expect (cdm yamaha-IDE) 190)
(check-expect (cdm dafra-IYF) 127.50)

;; VALOR-BASE-MOTOS ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; valor-base-motos: Moto -> Número

;; Objetivo: esta função auxiliar recebe o nome de uma moto da locadora (as letras da placa são informadas junto ao nome),
;; e retorna o valor base em reais a ser cobrado pela locação diária da moto.

;; Exemplos: (valor-base-motos hornet-IGF) = 75
;;           (valor-base-motos yamaha-IDE) = 100
;;           (valor-base-motos dafra-IYF) = 37.50

(define (valor-base-motos nome_moto)
  (/ (* 0.25 (moto-valor nome_moto)) 100))

;; Testes:
(check-expect (valor-base-motos hornet-IGF) 75)
(check-expect (valor-base-motos yamaha-IDE) 100)
(check-expect (valor-base-motos dafra-IYF) 37.50)

;; VALOR-SEGURO-MOTOS ===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; valor-seguro-motos: Moto -> Número

;; Objetivo: esta função auxiliar recebe o nome de uma moto da locadora (as letras da placa são informadas junto ao nome),
;; e retorna o valor em reais do acréscimo a ser cobrado pela locação diária da moto.

;; Exemplos: (valor-seguro-motos hornet-IGF) = 70
;;           (valor-seguro-motos yamaha-IDE) = 90
;;           (valor-seguro-motos dafra-IYF) = 90

(define (valor-seguro-motos nome_moto)
  [cond
    [(< (moto-ano nome_moto) 2011) 70]
    [(>= (moto-ano nome_moto) 2011) 90]])

;; Testes:
(check-expect (valor-seguro-motos hornet-IGF) 70)
(check-expect (valor-seguro-motos yamaha-IDE) 90)
(check-expect (valor-seguro-motos dafra-IYF) 90)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 05---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; estrutura posn =================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; Um elemento posn do conjunto Posn é uma estrutura
;; (make-posn x y), em que:

;; x: Número - corresponde à coordenada x de um ponto no plano cartesiano, ou seja, a coordenada do eixo das abcissas;

;; y: Número - corresponde à coordenada y de um ponto no plano cartesiano, ou seja, a coordenada do eixo das ordenadas.

(define a1 (make-posn 5 -6))
(define a2 (make-posn 5 -15))
(define a3 (make-posn 2 -4))
(define a4 (make-posn 0 -4))
(define a5 (make-posn -3 4))
(define a6 (make-posn 0 0))

;; ÁREA ===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; área: Posn Posn -> Número

;; Objetivo: esta função recebe dois elementos do conjunto Posn, o primeiro representando os pontos no plano cartesiano onde está o centro de um círculo
;; e o segundo representando os pontos no plano cartesiano de um ponto da sua circunferência. A função retorna a área do círculo em questão.

;; Exemplos: (área a1 a2) = 254.34
;;           (área a3 a4) = 12.56
;;           (área a5 a6) = 78.50

(define (área elemento1 elemento2)
  (* 3.14 (sqr (raio elemento1 elemento2))))

;; Testes:
(check-expect (área a1 a2) 254.34)  
(check-expect (área a3 a4) 12.56) 
(check-expect (área a5 a6) 78.50)

;; RAIO ============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; raio: Posn Posn -> Número

;; Objetivo: esta função auxiliar recebe dois elementos do conjunto Posn, o primeiro representando os pontos no plano cartesiano onde está o centro de um círculo
;; e o segundo representando os pontos no plano cartesiano de um ponto da sua circunferência. A função retorna o raio do círculo em questão.

;; Exemplos: (raio a1 a2) = 9
;;           (raio a3 a4) = 2 
;;           (raio a5 a6) = 5

(define (raio elemento1 elemento2)
    (sqrt(+(sqr(-(posn-x elemento1)(posn-x elemento2)))(sqr(-(posn-y elemento1)(posn-y elemento2))))))

;; Testes:
(check-expect (raio a1 a2) 9)
(check-expect (raio a3 a4) 2) 
(check-expect (raio a5 a6) 5)
