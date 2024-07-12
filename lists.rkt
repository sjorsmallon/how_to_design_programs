;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lists) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))

(define three-ones (cons 1 (cons 1 (cons 1 empty))))

(define (add-up-three list)
  (+ (first list) (+ (first (rest list)) (first (rest (rest list))))))

;; note the recursive here. Evaluate first, if not first, apply the same function to the rest.
(define (contains-doll? a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) false]
    [else (cond
            [(symbol=? (first a-list-of-symbols) 'doll) true]
            [else (contains-doll? (rest a-list-of-symbols))])]
            ))


(define (how-many? list-of-symbols)
  (cond
    [(empty? list-of-symbols) 0]
    [else
     (+ (how-many? (rest list-of-symbols)) 1)]))

(define (sum a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    [else (+ (sum (rest a-list-of-nums)) (first a-list-of-nums))]))


(define (wage h)
  (* 12 h))

(define (hours->wages alon)
  (cond
    [(empty? alon) empty]
    [ else (cons (wage (first alon)) (hours->wages (rest alon)))]))


(define-struct ir (name price))


(define (extract1 an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (cond
            [(<= (ir-price (first an-inv)) 1.00)
              (cons (first an-inv) (extract1 (rest an-inv)))]
            [else (extract1 (rest an-inv))])]))