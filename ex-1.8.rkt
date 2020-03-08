#lang racket
(define (cube-root x)
    (define (aux guess )
        (if (good-enough? guess)
            guess
            (aux (improve guess))))
    (define (good-enough? guess)
        (< (abs (- (* guess guess guess) x )) 0.00001))
    (define (improve y)
        (/ (+ (/ x (* y y)) y y) 3))
    (aux 1.0))



(provide cube-root)