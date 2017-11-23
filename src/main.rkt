#lang racket
(require "parser.rkt" "funcs.rkt" "plug.rkt")
(provide getInput loop)

;;TODO: write a proper help menu
(define (showHelp) 
  (display "Help menu") 
  (newline))


(define (getInput)
  (let* [(in (read))
         (val (getVal in))]
    (cond [(equal? in 'help) (showHelp)]
          [(equal? in 'exit) (exit)]
          [else 
            (if (null? val)
            (display (plug in val))
            (display (plug (take in (- (length in) 2)) val)))])))

(define (loop f)
  (f)
  (newline)
  (loop f))
