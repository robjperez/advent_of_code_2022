#lang racket

; (require racket/trace)

; (define input (file->lines "sample.txt"))
(define input (file->lines "input.txt"))

(define max-chars 4) ; Part 1
; (define max-chars 14) ; Part 2

(define
  (do-process-line line acc idx)
  (if
    (and
      (= (length acc) (- max-chars 1))
      (not (check-duplicates (append acc (list (car line)))))
    )

    (+ idx 1)

    (if
      (= (length acc) (- max-chars 1))
      (do-process-line (rest line) (append (rest acc) (list (car line))) (+ 1 idx))
      (do-process-line (rest line) (append acc (list (car line))) (+ 1 idx))
    )
  )

)

(define
  (process-line line)
  (do-process-line line '() 0)
)

; (trace bar)
(map process-line (map string->list input))