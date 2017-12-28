#lang racket
(require "parser.rkt" "funcs.rkt" "plug.rkt")
(provide getInput loop)

;;TODO: write a proper help menu
(define (showHelp) 
  (newline)
  (display "Using Algebracket") 
  (newline)
  (newline)
  (display "Equations must be passed in parentheses like so: (1 + 3), with spaces between all the terms.")
  (newline)
  (display "If you have an equation with a variable, and want to plug in that variables, do so like this: (1 + x at 4). This will evaluate to 5.")
  (newline)
  (display "Order of operations must be designated with parentheses. Example: ((x * 2) + 4)")
  (newline)
  (newline)
  (display "Type 'exit' at anytime to quit the program")
  (newline))

(define (getInput)
  (display "> ")
  (let* [(in (read))
         (val (getVal in))]
    (cond [(equal? in 'help) (showHelp)]
          [(equal? in 'exit) (exit)]
          [(not (list? in)) (display "Unrecognized command -- type 'help' for more information.")]
          [else 
            (if (null? val)
            (display (plug in val))
            (display (plug (take in (- (length in) 2)) val)))])))

(define (loop f)
  (f)
  (newline)
  (loop f))
