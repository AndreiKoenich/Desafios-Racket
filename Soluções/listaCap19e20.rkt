;; ============================
;; DEFINIÇÕES DE TIPOS DE DADOS
;; ============================

;; TIPO RETANGULO:

(define-struct retangulo (lado1 lado2 cor nome))

;; Um elemento de Retangulo tem o formato
;; (make-retangulo lado1 lado2 c n), onde

;; lado1: Número, é a largura do retângulo;

;; lado2: Número, é a altura do retângulo;

;; cor : String, é a cor do retângulo;

;; nome : String, é o nome do retângulo.

(define R1 (make-retangulo 30 60 "red" "R1"))
(define R2 (make-retangulo 40 40 "green" "R2"))

;; TIPO TRIANGULO:

(define-struct triangulo (lado cor nome))

;; Um elemento de Triangulo tem o formato
;; (make-triangulo lado cor nome), onde

;; lado: Número, é o lado do triângulo;

;; cor: String, é a cor do triângulo;

;; nome: String, é o nome do triângulo.

(define T1 (make-triangulo 30 "blue" "T1"))
(define T2 (make-triangulo 40 "red" "T2"))

;; TIPO ELIPSE:

(define-struct elipse (largura altura cor nome))

;; Um elemento de Elipse tem o formato
;; (make-elipse largura altura cor nome), onde

;; largura: Número, é a largura da elipse;

;; altura: Número, é a altura da elipse;

;; cor : String, é a cor da elipse;

;; nome : String, é o nome da elipse.

(define E1 (make-elipse 30 50 "pink" "E1"))
(define E2 (make-elipse 40 20 "red" "E2"))

;; Uma Forma pode ser
 ;; 1. um Retangulo, ou
 ;; 2. um Triangulo, ou
 ;; 3. uma Elipse

;; Uma ListaFormas é
 ;; 1. vazia (empty), ou
 ;; 2. (cons f lf), onde
 ;; f : Forma
 ;; lf: ListaFormas

(define L0 empty)
(define L1 (cons E1 empty))
(define L2 (cons E1 (cons E2 (cons T1 (cons T2 (cons R1 (cons R2 empty)))))))
(define L3 (cons T1 (cons T1 (cons T1 (cons T2 (cons R1 (cons R1 empty)))))))
(define L4 (cons E2 (cons E2 (cons E2 (cons T2 empty)))))

;; desenha : Forma -> Imagem

;; Dada uma forma, gera uma imagem desta forma.

;; Exemplos:
;; (desenha E1) = .
;; (desenha T2) = .

 (define (desenha f)
 (cond
 [(retangulo? f) (rectangle (retangulo-lado1 f) (retangulo-lado2 f) "solid"
(retangulo-cor f))]
 [(triangulo? f) (triangle (triangulo-lado f) "solid"(triangulo-cor f))]
 [(elipse? f) (ellipse (elipse-largura f) (elipse-altura f) "solid" (elipse-cor
f))]))

;; Testes:
(check-expect (desenha E1) (ellipse 30 50 "solid" "pink"))
(check-expect (desenha T2) (triangle 40 "solid" "red"))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 01---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; LISTA DE STRINGS ====================================================================================================================================================================================================================================================================================

;; Um elemento listastring do conjunto ListaString pode ser

;; 1. A lista vazia empty

;; ou

;; 2. (cons s lds), em que:

;; s: String

;; lds: ListaString

;; Exemplos de elementos do conjunto ListaString:
(define lista-strings-vazia empty)
(define lista-strings-1 (cons "Morphy" (cons "Steinitz" (cons "Zukertort" empty))))
(define lista-strings-2 (cons "Karpov" (cons "Alekhine" (cons "Botvinnik" empty))))
(define lista-strings-3 (cons "Carlsen" (cons "Kasparov" (cons "Kamsky" empty))))

;; LISTA-ELIPSES ====================================================================================================================================================================================================================================================================================

;; lista-elipses: ListaFormas -> ListaFormas

;; Objetivo: esta função recebe uma lista de formas e retorna uma
;; lista com todas as elipses da lista fornecida. Caso a função receba
;; uma lista de formas vazia, a função retorna uma lista vazia. Caso
;; a lista fornecida não possua nenhuma elipse, a função retorna
;; uma lista vazia.

;; Exemplos: (lista-elipses L0) = empty
;;           (lista-elipses L1) = (cons E1 empty)
;;           (lista-elipses L2) = (cons E1 (cons E2 empty))
;;           (lista-elipses L3) = empty
;;           (lista-elipses L4) = (cons E2(cons E2(cons E2 empty)))

(define (lista-elipses lista)
  (filter elipse? lista))

;; Testes:
(check-expect (lista-elipses L0) empty) 
(check-expect (lista-elipses L1) (cons E1 empty))
(check-expect (lista-elipses L2) (cons E1 (cons E2 empty)))
(check-expect (lista-elipses L3) empty)
(check-expect (lista-elipses L4) (cons E2(cons E2(cons E2 empty))))

;; LISTA-NOMES-ELIPSES ====================================================================================================================================================================================================================================================================================

;; lista-nomes-elipses: ListaFormas -> ListaString

;; Objetivo: esta função recebe uma lista de formas, e retorna
;; uma lista contendo os nomes de todas as elipses da lista de
;; formas fornecida. Caso a função receba uma lista de formas
;; vazia, a função retorna uma lista vazia. Caso a lista fornecida
;; não possua nenhuma elipse, a função retorna uma lista vazia.

;; Exemplos: (lista-nomes-elipses L0) = empty
;;           (lista-nomes-elipses L1) = (cons "E1" empty)
;;           (lista-nomes-elipses L2) = (cons "E1"(cons "E2" empty))
;;           (lista-nomes-elipses L3) = empty
;;           (lista-nomes-elipses L4) = (cons "E2"(cons "E2"(cons "E2" empty)))

(define (lista-nomes-elipses lista)
  (map elipse-nome (lista-elipses lista)))

;; Testes:
(check-expect (lista-nomes-elipses L0) empty)
(check-expect (lista-nomes-elipses L1) (cons "E1" empty))
(check-expect (lista-nomes-elipses L2) (cons "E1"(cons "E2" empty)))
(check-expect (lista-nomes-elipses L3) empty)
(check-expect (lista-nomes-elipses L4) (cons "E2"(cons "E2"(cons "E2" empty))))

;; LISTA-ELIPSES-IMG ====================================================================================================================================================================================================================================================================================

;; lista-elipses-img: ListaFormas -> Imagem

;; Objetivo: esta função recebe uma lista de formas, e retorna uma imagem
;; contendo todas as elipses da lista original, na ordem inversa em que aparecem.
;; Caso a função receba uma lista de formas vazia, a função retorna uma imagem vazia.
;; Caso a lista fornecida não possua nenhuma elipse, a função retorna uma imagem vazia.

;; Exemplos: (lista-elipses-img L0) = empty-image
;;           (lista-elipses-img L1) = .
;;           (lista-elipses-img L2) = .
;;           (lista-elipses-img L3) = empty-image 
;;           (lista-elipses-img L4) = .

(define (lista-elipses-img lista)
  (desenha-lista-formas (foldl cons empty (lista-elipses lista))))

;; Testes:
(check-expect (lista-elipses-img L0) empty-image)
(check-expect (lista-elipses-img L1) (ellipse 30 50 "solid" "pink"))
(check-expect (lista-elipses-img L2) (beside (ellipse 40 20 "solid" "red") (ellipse 30 50 "solid" "pink")))
(check-expect (lista-elipses-img L3) empty-image)
(check-expect (lista-elipses-img L4) (beside (ellipse 40 20 "solid" "red") (beside (ellipse 40 20 "solid" "red") (ellipse 40 20 "solid" "red"))))
  
;; SOMA-LADOS-TRIANGULOS ====================================================================================================================================================================================================================================================================================

;; soma-lados-triangulos: ListaFormas -> Número

;; Objetivo: esta função recebe uma lista de formas, e retorna
;; e retorna o valor da soma dos lados dos triângulos da lista.
;; Caso não exista nenhum triângulo na lista de formas recebida,
;; a função retorna valor zero. Caso a função receba uma lista
;; de formas vazia, a função retorna valor zero.

;; Exemplos: (soma-lados-triangulos L0) = 0
;;           (soma-lados-triangulos L1) = 0
;;           (soma-lados-triangulos L2) = 70
;;           (soma-lados-triangulos L3) = 130
;;           (soma-lados-triangulos L4) = 40

(define (soma-lados-triangulos lista)
   (foldl + 0 (map triangulo-lado (filter triangulo? lista))))

;; Testes:
(check-expect (soma-lados-triangulos L0) 0)
(check-expect (soma-lados-triangulos L1) 0)
(check-expect (soma-lados-triangulos L2) 70) 
(check-expect (soma-lados-triangulos L3) 130)
(check-expect (soma-lados-triangulos L4) 40)
  
;; DESENHA-LISTA-FORMAS ====================================================================================================================================================================================================================================================================================

;; desenha-lista-formas: ListaFormas -> Imagem

;; Objetivo: esta função recebe uma lista de formas, e retorna uma
;; imagem com todas as formas lado a lado. Caso a função receba uma
;; lista de formas vazia, a função retorna uma imagem vazia.

;; Exemplos: (desenha-lista-formas L0) = empty-image
;;           (desenha-lista-formas L1) = .
;;           (desenha-lista-formas L2) = .
;;           (desenha-lista-formas L3) = .
;;           (desenha-lista-formas L4) = .

(define (desenha-lista-formas lista)
  (foldl beside empty-image (foldl cons empty(map desenha lista))))

;; Testes:
(check-expect (desenha-lista-formas L0) empty-image)
(check-expect (desenha-lista-formas L1) (ellipse 30 50 "solid" "pink"))
(check-expect (desenha-lista-formas L2) (beside (ellipse 30 50 "solid" "pink")(beside (ellipse 40 20 "solid" "red") (beside (triangle 30 "solid" "blue")(beside (triangle 40 "solid" "red")(beside (rectangle 30 60 "solid" "red")(rectangle 40 40 "solid" "green")))))))
(check-expect (desenha-lista-formas L3) (beside (triangle 30 "solid" "blue")(beside (triangle 30 "solid" "blue")(beside (triangle 30 "solid" "blue")(beside (triangle 40 "solid" "red") (beside (rectangle 30 60 "solid" "red")(rectangle 30 60 "solid" "red")))))))
(check-expect (desenha-lista-formas L4) (beside (ellipse 40 20 "solid" "red")(beside (ellipse 40 20 "solid" "red")(beside (ellipse 40 20 "solid" "red")(triangle 40 "solid" "red")))))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02A---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; TIPO ALUNO ====================================================================================================================================================================================================================================================================================
   
(define-struct aluno (nome turma nota1 nota2))

;; Um elemento aluno do conjunto Aluno é uma estrutura
;; (make-aluno um-nome uma-turma uma-nota1 uma-nota2), em que:

;; um-nome: String, representa o nome do aluno

;; uma-turma: String, representa a turma do aluno

;; uma-nota1: Número, representa a nota obtida pelo aluno na primeira prova

;; uma-nota2: Número, representa a nota obtida pelo aluno na segunda prova

;; Exemplos de elementos do conjunto Aluno:
(define Jader (make-aluno "Jader" "B" 4.5 6.5))
(define Idemir (make-aluno "Idemir" "B" 3.5 5.5))
(define Julio (make-aluno "Julio" "B" 7.5 8.5))
(define Elmar (make-aluno "Elmar" "B" 9.0 8.0))
(define Estevão (make-aluno "Estevão" "B" 8.3 9.2))
(define André (make-aluno "André" "B" 6.9 4.2))
(define Diego (make-aluno "Diego" "C" 7.5 6.8))
(define Ricardo (make-aluno "Ricardo" "C" 9.7 8.7))
(define JoséEduardo (make-aluno "JoséEduardo" "C" 6.1 4.2))
(define Alvaro (make-aluno "Alvaro" "C" 5.3 4.8))
(define Sandro (make-aluno "Sandro" "C" 6.8 9.2))
(define Luís (make-aluno "Luís" "C" 7.7 8.8))

;; LISTA DE ALUNOS ====================================================================================================================================================================================================================================================================================

;; Um elemento listadealunos do conjunto ListaDeAlunos pode ser

;; 1. a lista vazia empty

;; ou

;; 2. (cons aluno lda), em que:

;; aluno: Aluno

;; lda: ListaDeAlunos

;; Exemplos de elementos do conjunto ListaDeAlunos:
(define lista-alunos-vazia empty)
(define lista-alunos-turmaB (cons André(cons Elmar(cons Estevão(cons Idemir(cons Jader(cons Julio empty)))))))
(define lista-alunos-turmaC (cons Alvaro(cons Diego(cons JoséEduardo(cons Luís(cons Ricardo(cons Sandro empty)))))))
(define lista-alunos-1 (cons Jader(cons Julio(cons Elmar(cons Estevão(cons André(cons Luís empty)))))))
(define lista-alunos-2 (cons Idemir(cons Diego(cons Ricardo(cons Alvaro(cons Sandro(cons JoséEduardo(cons Luís(cons Jader(cons Julio empty))))))))))
(define lista-alunos-3 (cons Ricardo(cons Jader(cons Elmar(cons André empty)))))
(define lista-alunos-4 (cons Sandro(cons Idemir(cons Diego(cons Alvaro empty)))))
(define lista-alunos-5 (cons Idemir(cons Julio(cons Elmar(cons Alvaro(cons André(cons Estevão(cons Sandro empty))))))))

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02B---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; LISTA-ALUNOS-TURMA ====================================================================================================================================================================================================================================================================================

;; lista-alunos-turma: ListaDeAlunos String -> ListaDeAlunos

;; Objetivo: esta função recebe uma lista de alunos de um professor e uma turma,
;; e retorna uma lista contendo somente os alunos da lista fornecida cuja turma
;; corresponda à turma que foi informada. Caso a função receba uma lista de
;; alunos vazia, a função retorna uma lista de alunos vazia.

;; Exemplos: (lista-alunos-turma lista-alunos-vazia "C") = empty
;;           (lista-alunos-turma lista-alunos-1 "B") = (cons Jader(cons Julio(cons Elmar(cons Estevão(cons André empty)))))
;;           (lista-alunos-turma lista-alunos-2 "C") = (cons Diego(cons Ricardo(cons Alvaro(cons Sandro(cons JoséEduardo(cons Luís empty)))))) 
;;           (lista-alunos-turma lista-alunos-3 "C") = (cons Ricardo empty)
;;           (lista-alunos-turma lista-alunos-4 "B") = (cons Idemir empty)
;;           (lista-alunos-turma lista-alunos-5 "C") = (cons Alvaro(cons Sandro empty))
;;           (lista-alunos-turma lista-alunos-turmaC "B") = empty

(define (lista-alunos-turma lista turma)
  [cond
    [(empty? lista) empty]
    [(string=? (first(map aluno-turma lista)) turma) (cons (first lista)(lista-alunos-turma (rest lista) turma))]
    [else (lista-alunos-turma (rest lista) turma)]])

;; Testes:
(check-expect (lista-alunos-turma lista-alunos-vazia "C") empty)
(check-expect (lista-alunos-turma lista-alunos-1 "B") (cons Jader(cons Julio(cons Elmar(cons Estevão(cons André empty))))))
(check-expect (lista-alunos-turma lista-alunos-2 "C") (cons Diego(cons Ricardo(cons Alvaro(cons Sandro(cons JoséEduardo(cons Luís empty)))))))
(check-expect (lista-alunos-turma lista-alunos-3 "C") (cons Ricardo empty))
(check-expect (lista-alunos-turma lista-alunos-4 "B") (cons Idemir empty))
(check-expect (lista-alunos-turma lista-alunos-5 "C") (cons Alvaro(cons Sandro empty)))
(check-expect (lista-alunos-turma lista-alunos-turmaC "B") empty)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02C---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; TIPO PAR ====================================================================================================================================================================================================================================================================================

(define-struct par (nomealuno conceito))

;; Um elemento par do conjunto Par é uma estrutura
;; (make-par um-nomealuno um-conceito), em que:

;; um-nomealuno: String, representa o nome do aluno

;; um-conceito: String, representa o conceito do aluno

;; Exemplos de elementos do conjunto Par:
(define JaderD (make-par "Jader" "D"))
(define IdemirD (make-par "Idemir" "D"))
(define JulioB (make-par "Julio" "B"))
(define ElmarB (make-par "Elmar" "B"))
(define EstevãoB (make-par "Estevão" "B"))
(define AndréD (make-par "André" "D"))
(define DiegoC (make-par "Diego" "C"))
(define RicardoA (make-par "Ricardo" "A"))
(define JoséEduardoD (make-par "JoséEduardo" "D"))
(define AlvaroD (make-par "Alvaro" "D"))
(define SandroB (make-par "Sandro" "B"))
(define LuísB (make-par "Luís" "B"))

;; LISTA DE PARES ====================================================================================================================================================================================================================================================================================

;; Um elemento listadepares do conjunto ListaDePares pode ser

;; 1. a lista vazia empty

;; ou

;; 2. (cons par ldp), em que:

;; par: Par

;; ldp: ListaDePares

;; Exemplos de elementos do conjunto ListaDePares:
(define lista-pares-vazia empty)
(define lista-pares-1 (cons JaderD (cons IdemirD (cons SandroB empty))))
(define lista-pares-2 (cons AlvaroD (cons SandroB empty)))
(define lista-pares-3 (cons DiegoC (cons AndréD (cons EstevãoB empty))))

;; GERA-CONCEITOS ====================================================================================================================================================================================================================================================================================

;; gera-conceitos: ListaDeAlunos -> ListaDePares

;; Objetivo: esta função recebe uma lista de alunos, e retorna outra lista contendo os nomes dos alunos
;; e seus respectivos conceitos, que são calculados com base nas notas obtidas nas provas por ele realizadas.
;; Médias entre 9 e 10 (inclusive) geram conceito A, entre 7.5 (inclusive) e 9 (exclusive) geram conceito B,
;; entre 6 (inclusive) e 7.5 (exclusive) geram conceito C, nos outros casos o conceito é D. Caso a função receba
;; uma lista vazia, a função retorna uma lista vazia.

;; Exemplos: (gera-conceitos lista-alunos-vazia) = empty
;;           (gera-conceitos lista-alunos-1) = (list JaderD JulioB ElmarB EstevãoB AndréD LuísB)
;;           (gera-conceitos lista-alunos-2) = (list IdemirD DiegoC RicardoA AlvaroD SandroB JoséEduardoD LuísB JaderD JulioB)
;;           (gera-conceitos lista-alunos-3) = (list RicardoA JaderD ElmarB AndréD)

(define (gera-conceitos lista)
  [cond
    [(empty? lista) empty]
    [else (cons (make-par (aluno-nome (first lista)) (first (map determina-conceitos-aluno lista)))(gera-conceitos (rest lista)))]])

;; Testes:
(check-expect (gera-conceitos lista-alunos-vazia) empty)
(check-expect (gera-conceitos lista-alunos-1)(list JaderD JulioB ElmarB EstevãoB AndréD LuísB))
(check-expect (gera-conceitos lista-alunos-2)(list IdemirD DiegoC RicardoA AlvaroD SandroB JoséEduardoD LuísB JaderD JulioB))
(check-expect (gera-conceitos lista-alunos-3)(list RicardoA JaderD ElmarB AndréD))

;; DETERMINA-CONCEITOS-ALUNO  ====================================================================================================================================================================================================================================================================================

;; determina-conceitos-aluno: Aluno -> String

;; Objetivo: esta função auxiliar recebe um aluno, e retorna o conceito final do aluno com base nas notas obtidas nas duas
;; provas por ele realizadas. Médias entre 9 e 10 (inclusive) geram conceito A, entre 7.5 (inclusive) e 9 (exclusive) geram
;; conceito B, entre 6 (inclusive) e 7.5 (exclusive) geram conceito C, nos outros casos o conceito é D.

;; Exemplos: (determina-conceitos-aluno Ricardo) = "A"
;;           (determina-conceitos-aluno Estevão) = "B"
;;           (determina-conceitos-aluno Diego) = "C"
;;           (determina-conceitos-aluno Idemir) = "D"

(define (determina-conceitos-aluno student)
  [cond
    [(< (calcula-media student) 6) "D"]
    [(< (calcula-media student) 7.5) "C"]
    [(< (calcula-media student) 9) "B"]
    [else "A"]])

;; Testes:
(check-expect (determina-conceitos-aluno Ricardo) "A")
(check-expect (determina-conceitos-aluno Estevão) "B")
(check-expect (determina-conceitos-aluno Diego) "C")
(check-expect (determina-conceitos-aluno Idemir) "D")

;; CALCULA-MEDIA ====================================================================================================================================================================================================================================================================================

;; calcula-media: Aluno -> Número

;; Objetivo: esta função auxiliar recebe um aluno, e retorna a média aritmética
;; das notas obtidas pelo aluno na primeira e na segunda prova.

;; Exemplos: (calcula-media Jader) = 5.5 
;;           (calcula-media Estevão) = 8.75
;;           (calcula-media JoséEduardo) = 5.15

(define (calcula-media student)
  (/(+ (aluno-nota1 student) (aluno-nota2 student))2))

;; Testes:
(check-expect (calcula-media Jader) 5.5)
(check-expect (calcula-media Estevão) 8.75)
(check-expect (calcula-media JoséEduardo) 5.15)

;;----------------------------------------------------------------------------------------------------EXERCÍCIO 02D---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; ORDENA-TURMA ====================================================================================================================================================================================================================================================================================

;; ordena-turma: ListaDeAlunos String (ListaDeAlunos -> ListaDeAlunos) -> ListaDeAlunos

;; Objetivo: esta função recebe uma lista de alunos, uma turma e um critério de ordenação que é representado por uma função.
;; Considerando apenas os alunos da lista que estão matriculados na turma fornecida, a função retorna esses alunos ordenados
;; em uma lista segundo o critério de ordenação estabelecido pela função fornecida como parâmetro. Caso a função receba uma
;; lista de alunos vazia, a função retorna uma lista de alunos vazia.

;; Exemplos: (ordena-turma lista-alunos-vazia "C" maiornome) = empty
;;           (ordena-turma lista-alunos-turmaB "B" maiornota) = (list Estevão Elmar Julio André Jader Idemir)
;;           (ordena-turma lista-alunos-turmaC "C" ordemalfabetica) = (list Alvaro Diego JoséEduardo Luís Ricardo Sandro)
;;           (ordena-turma lista-alunos-1 "B" maiornome) = (list Estevão Jader Julio Elmar André)
;;           (ordena-turma lista-alunos-2 "C" maiornota) = (list Ricardo Luís Sandro Diego JoséEduardo Alvaro)
;;           (ordena-turma lista-alunos-3 "B" ordemalfabetica) = (list André Elmar Jader)
;;           (ordena-turma lista-alunos-4 "C" maiornota) = (list Sandro Diego Alvaro)
;;           (ordena-turma lista-alunos-5 "B" maiornome) = (list Estevão Idemir Julio Elmar André)

(define (ordena-turma lista turma criterio)
  (criterio (lista-alunos-turma lista turma))) 

;; Testes:
(check-expect (ordena-turma lista-alunos-vazia "C" maiornome) empty)
(check-expect (ordena-turma lista-alunos-turmaB "B" maiornota) (list Estevão Elmar Julio André Jader Idemir))
(check-expect (ordena-turma lista-alunos-turmaC "C" ordemalfabetica) (list Alvaro Diego JoséEduardo Luís Ricardo Sandro))
(check-expect (ordena-turma lista-alunos-1 "B" maiornome) (list Estevão Jader Julio Elmar André))
(check-expect (ordena-turma lista-alunos-2 "C" maiornota) (list Ricardo Luís Sandro Diego JoséEduardo Alvaro))
(check-expect (ordena-turma lista-alunos-3 "B" ordemalfabetica) (list André Elmar Jader))
(check-expect (ordena-turma lista-alunos-4 "C" maiornota) (list Sandro Diego Alvaro))
(check-expect (ordena-turma lista-alunos-5 "B" maiornome) (list Estevão Idemir Julio Elmar André))

;; ORDEMALFABETICA ====================================================================================================================================================================================================================================================================================
 
;; ordemalfabetica: ListaDeAlunos -> ListaDeAlunos

;; Objetivo: esta função auxiliar recebe uma lista de alunos, e retorna
;; outra lista contendo todos os alunos da lista que foi fornecida, mas
;; posicionados na lista de acordo com a ordem alfabética dos seus nomes.
;; Caso a função receba uma lista de alunos vazia, a função retorna uma
;; lista de alunos vazia.

;; Exemplos: (ordemalfabetica lista-alunos-vazia) = empty
;;           (ordemalfabetica lista-alunos-1) = (list André Elmar Estevão Jader Julio Luís)
;;           (ordemalfabetica lista-alunos-2) = (list Alvaro Diego Idemir Jader JoséEduardo Julio Luís Ricardo Sandro)
;;           (ordemalfabetica lista-alunos-3) = (list André Elmar Jader Ricardo)
;;           (ordemalfabetica lista-alunos-4) = (list Alvaro Diego Idemir Sandro)
;;           (ordemalfabetica lista-alunos-5) = (list Alvaro André Elmar Estevão Idemir Julio Sandro)

(define (ordemalfabetica lista)
  (local
    (
     (define (insere-ordemalfabetica student lista) 
       (cond
         [(empty? lista) (cons student empty)]
         [(string<=? (aluno-nome student) (aluno-nome (first lista))) (cons student lista)]
         [(string>? (aluno-nome student) (aluno-nome (first lista))) (cons (first lista)(insere-ordemalfabetica student (rest lista)))]))
     (define (ordena-ordemalfabetica lista)
       (cond
         [(empty? lista) empty]
         [else (insere-ordemalfabetica (first lista) (ordena-ordemalfabetica (rest lista)))]))  
     ) (ordena-ordemalfabetica lista)))

;; Testes:
(check-expect (ordemalfabetica lista-alunos-vazia) empty)
(check-expect (ordemalfabetica lista-alunos-1) (list André Elmar Estevão Jader Julio Luís))
(check-expect (ordemalfabetica lista-alunos-2) (list Alvaro Diego Idemir Jader JoséEduardo Julio Luís Ricardo Sandro))
(check-expect (ordemalfabetica lista-alunos-3) (list André Elmar Jader Ricardo))
(check-expect (ordemalfabetica lista-alunos-4) (list Alvaro Diego Idemir Sandro))
(check-expect (ordemalfabetica lista-alunos-5) (list Alvaro André Elmar Estevão Idemir Julio Sandro))

;; ORDENA-ORDEMALFABETICA ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; ordena-ordemalfabetica: ListaDeAlunos -> ListaDeAlunos

;; Objetivo: esta função auxiliar recebe uma lista de alunos, e retorna uma lista
;; contendo todos os aluno da da lista fornecida, mas organizados segundo a ordem
;; alfabética. Caso a função receba uma lista vazia, a função retorna uma lista vazia.

;; Exemplos: (ordena-ordemalfabetica lista-alunos-vazia) = empty
;;           (ordena-ordemalfabetica lista-alunos-1) = (ordena-ordemalfabetica lista-alunos-1) = (list André Elmar Estevão Jader Julio Luís)
;;           (ordena-ordemalfabetica lista-alunos-2) = (ordena-ordemalfabetica lista-alunos-2) = (list Alvaro Diego Idemir Jader JoséEduardo Julio Luís Ricardo Sandro)

;; INSERE-ORDEMALFABETICA ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; insere-ordemalfabetica: Aluno ListaDeAlunos -> ListaDeAlunos

;; Objetivo: esta função auxiliar recebe uma lista de alunos e um aluno, e retorna
;; uma nova lista contendo todos os alunos da lista que foi fornecida e mais o aluno
;; que foi fornecido, que estará posicionado de forma a deixar a lista de alunos
;; organizada segundo a ordem alfabética, ou seja, o aluno que foi fornecido estará
;; na posição imediatamente anterior à posição do primeiro aluno da lista cujo nome
;; seja superior ou igual ao nome do aluno que foi fornecido, segundo a ordem lexicográfica.

;; Exemplos: (insere-ordemalfabetica Jader lista-alunos-vazia) = (list Jader)
;;           (insere-ordemalfabetica Idemir lista-alunos-1) = (list Idemir Jader Julio Elmar Estevão André Luís)
;;           (insere-ordemalfabetica André lista-alunos-2) = (list André Idemir Diego Ricardo Alvaro Sandro JoséEduardo Luís Jader Julio)

;; MAIORNOTA ====================================================================================================================================================================================================================================================================================

;; maiornota: ListaDeAlunos -> ListaDeAlunos

;; Objetivo: esta função auxiliar recebe uma lista de alunos, e retorna
;; outra lista contendo todos os alunos da lista que foi fornecida, mas
;; posicionados na lista de acordo com a média final obtida por eles, que
;; é calculada considerando as notas obtidas nas duas provas realizadas
;; (em ordem decrescente). Caso a função receba uma lista de alunos vazia,
;; a função retorna uma lista de alunos vazia.

;; Exemplos: (maiornota lista-alunos-vazia) = empty
;;           (maiornota lista-alunos-1) = (list Estevão Elmar Luís Julio André Jader)
;;           (maiornota lista-alunos-2) = (list Ricardo Luís Julio Sandro Diego Jader JoséEduardo Alvaro Idemir)
;;           (maiornota lista-alunos-3) = (list Ricardo Elmar André Jader)
;;           (maiornota lista-alunos-4) = (list Sandro Diego Alvaro Idemir)
;;           (maiornota lista-alunos-5) = (list Estevão Elmar Sandro Julio André Alvaro Idemir)

(define (maiornota lista)
  (local
    (
     (define (insere-maiornota student lista) 
       (cond
         [(empty? lista) (cons student empty)]
         [(> (calcula-media student) (calcula-media (first lista))) (cons student lista)]
         [(<= (calcula-media student) (calcula-media (first lista))) (cons (first lista)(insere-maiornota student (rest lista)))]))
     (define (ordena-maiornota lista)
       (cond
         [(empty? lista) empty]
         [else (insere-maiornota (first lista) (ordena-maiornota (rest lista)))]))  
     ) (ordena-maiornota lista)))

;; Testes:
(check-expect (maiornota lista-alunos-vazia) empty)
(check-expect (maiornota lista-alunos-1) (list Estevão Elmar Luís Julio André Jader))
(check-expect (maiornota lista-alunos-2) (list Ricardo Luís Julio Sandro Diego Jader JoséEduardo Alvaro Idemir))
(check-expect (maiornota lista-alunos-3) (list Ricardo Elmar André Jader))
(check-expect (maiornota lista-alunos-4) (list Sandro Diego Alvaro Idemir))
(check-expect (maiornota lista-alunos-5) (list Estevão Elmar Sandro Julio André Alvaro Idemir))

;; ORDENA-MAIORNOTA ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; ordena-maiornota: ListaDeAlunos -> ListaDeAlunos

;; Objetivo: esta função auxiliar recebe uma lista de alunos, e retorna uma lista
;; contendo todos os aluno da da lista fornecida, mas organizados de acordo com a
;; sua nota final, que é calculada considerando as notas obtidas nas duas provas
;; realizadas (em ordem decrescente). Caso a função receba uma lista de alunos vazia,
;; a função retorna uma lista vazia.

;; Exemplos: (ordena-maiornota lista-alunos-vazia) = empty
;;           (ordena-maiornota lista-alunos-1) = (list Estevão Elmar Luís Julio André Jader)
;;           (ordena-maiornota lista-alunos-2) = (list Ricardo Luís Julio Sandro Diego Jader JoséEduardo Alvaro Idemir)

;; INSERE-MAIORNOTA ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; insere-maiornota: Aluno ListaDeAlunos -> ListaDeAlunos

;; Objetivo: esta função auxiliar recebe uma lista de alunos e um aluno, e retorna
;; uma nova lista contendo todos os alunos da lista que foi fornecida e mais o aluno
;; que foi fornecido, que estará posicionado de forma a deixar a lista de alunos
;; organizada segundo a nota final de cada aluno (de forma decrescente), ou seja,
;; o aluno que foi fornecido estará na posição imediatamente anterior à posição
;; do primeiro aluno da lista que possuir uma nota final menor ou igual do que a
;; nota do aluno que foi fornecido.

;; Exemplos: (insere-maiornota Jader lista-alunos-vazia) = (list Jader)
;;           (insere-maiornota Ricardo lista-alunos-1) = (list Ricardo Jader Julio Elmar Estevão André Luís)
;;           (insere-maiornota Idemir lista-alunos-3) = (list Ricardo Jader Elmar André Idemir)

;; MAIORNOME ====================================================================================================================================================================================================================================================================================

;; maiornome: ListaDeAlunos -> ListaDeAlunos

;; Objetivo: esta função auxiliar recebe uma lista de alunos, e retorna
;; outra lista contendo todos os alunos da lista que foi fornecida, mas
;; posicionados na lista de acordo com a quantidade de letras que o seu
;; nome possui (em ordem decrescente). Caso a função receba uma lista de
;; alunos vazia, a função retorna uma lista de alunos vazia.

;; Exemplos: (maiornome lista-alunos-vazia) = empty
;;           (maiornome lista-alunos-1) = (list Estevão Jader Julio Elmar André Luís)
;;           (maiornome lista-alunos-2) = (list JoséEduardo Ricardo Idemir Alvaro Sandro Diego Jader Julio Luís)
;;           (maiornome lista-alunos-3) = (list Ricardo Jader Elmar André)
;;           (maiornome lista-alunos-4) = (list Sandro Idemir Alvaro Diego)
;;           (maiornome lista-alunos-5) = (list Estevão Idemir Alvaro Sandro Julio Elmar André)

(define (maiornome lista)
  (local
    (
     (define (insere-maiornome student lista)
       (cond
         [(empty? lista) (cons student empty)]
         [(>= (string-length (aluno-nome student)) (string-length(aluno-nome(first lista)))) (cons student lista)]
         [(< (string-length (aluno-nome student)) (string-length(aluno-nome(first lista)))) (cons (first lista) (insere-maiornome student (rest lista)))]))
     (define (ordena-maiornome lista)
       (cond
         [(empty? lista) empty]
         [else (insere-maiornome (first lista) (ordena-maiornome (rest lista)))]))  
     ) (ordena-maiornome lista)))
 
;; Testes:
(check-expect (maiornome lista-alunos-vazia) empty)
(check-expect (maiornome lista-alunos-1) (list Estevão Jader Julio Elmar André Luís))
(check-expect (maiornome lista-alunos-2) (list JoséEduardo Ricardo Idemir Alvaro Sandro Diego Jader Julio Luís))
(check-expect (maiornome lista-alunos-3) (list Ricardo Jader Elmar André))
(check-expect (maiornome lista-alunos-4) (list Sandro Idemir Alvaro Diego))
(check-expect (maiornome lista-alunos-5) (list Estevão Idemir Alvaro Sandro Julio Elmar André))

;; ORDENA-MAIORNOME ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; ordena-maiornome: ListaDeAlunos -> ListaDeAlunos

;; Objetivo: esta função auxiliar recebe uma lista de alunos, e retorna uma lista
;; contendo todos os aluno da da lista fornecida, mas organizados de acordo com o
;; tamanho do seu nome (em ordem decrescente). Caso a função receba uma lista de
;; alunos vazia, a função retorna uma lista vazia.

;; Exemplos: (ordena-maiornome lista-alunos-vazia) = empty
;;           (ordena-maiornome lista-alunos-1) = (list Estevão Jader Julio Elmar André Luís)
;;           (ordena-maiornome lista-alunos-2) = (list JoséEduardo Ricardo Idemir Alvaro Sandro Diego Jader Julio Luís)

;; INSERE-MAIORNOME ================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

;; insere-maiornome: Aluno ListaDeAlunos -> ListaDeAlunos

;; Objetivo: esta função auxiliar recebe uma lista de alunos e um aluno, e retorna
;; uma nova lista contendo todos os alunos da lista que foi fornecida e mais o aluno
;; que foi fornecido, que estará posicionado de forma a deixar a lista de alunos
;; organizada segundo o tamanho do nome de cada aluno (de forma decrescente), ou seja,
;; o aluno que foi fornecido estará na posição imediatamente anterior à posição do
;; primeiro aluno da lista que possuir um nome de tamanho menor ou igual ao nome do aluno
;; que foi fornecido.

;; Exemplos: (insere-maiornome Jader lista-alunos-vazia) = (list Jader)
;;           (insere-maiornome Ricardo lista-alunos-1) = (list Ricardo Jader Julio Elmar Estevão André Luís)
;;           (insere-maiornome Julio lista-alunos-3) = (list Ricardo Julio Jader Elmar André Idemir)
