#lang racket
(provide derive)
(require "parser.rkt" "funcs.rkt")

(define (derive f val)
  (let* [(ff (filter hasX f))]
    ff))
