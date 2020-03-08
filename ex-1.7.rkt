#lang racket
; Exercise 1.7

;;O erro para números pequenos é que o radicante
;;é muito menor do que o limite 0,001 estabelecido,
;;com isso fica indisponível a melhoria
;;do palpite além desse limite.
;;Por exemplo, a raiz quadrada de 0,00008 é ~ 0,00894427191
;;, mas o valor calculado com o limite 0,001 e com isso
;;o valor dessa raiz quadrada mostrada é 
;;0.03209789809712894, errando o valor.
;;O erro para números grandes é que se encontra um loob infinito
;;, pois o valor do aprimoramento nunca chegará ao limite,
;; pois a diferênça entre o valor aprimorado e o pedindo não
;;chegará proxima ao limite, ou seja o valor aprimorado se tornará
;; o próprio x e assim não atingirá uma solução exata, como por exemplo,
;; (sqrt 10000000000)=100000, ja, (sqrt 10000000000123)
;; o programa mostra 1000000.1035227422 e o certo é 3162277.6

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (average x y)
  (/ (+ x y) 2))

(define (square b)
  (* b b))

(define (sqrt x)
  (define (good-enough? guess)
    (< (/ (abs (- (square guess) x)) x) 0.00001))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))

  (sqrt-iter 1.0))

(provide sqrt)
