#lang racket
(define (cube-root x)
    (define min 0.00001)
    (define (cube-iter guess)
        (if (good-enough? guess)
            guess
            (cube-iter (guess-new guess))))
    (define (good-enough? guess)
        (< (abs (- (* guess guess guess) x )) min))
    (define (guess-new y)
        (/ (+ (/ x (* y y)) y y) 3))
    (cube-iter 1.0))



(provide cube-root)