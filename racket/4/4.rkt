#lang racket

; (define input (file->lines "sample.txt"))
(define input (file->lines "input.txt"))

(define (is-range-included? line)
    (let* [
            (ranges (string-split line ","))
            (first-range-string (first ranges))
            (second-range-string (second ranges))
            (range-1 (map string->number (string-split first-range-string "-")))
            (range-2 (map string->number (string-split second-range-string "-")))
        ]

        (if
            (or
                (and (>= (first range-1) (first range-2)) (<= (second range-1) (second range-2)))
                (and (>= (first range-2) (first range-1)) (<= (second range-2) (second range-1)))
            )
            1
            0
        )
    )
)

(apply + (map is-range-included? input))