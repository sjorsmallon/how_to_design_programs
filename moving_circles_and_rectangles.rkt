;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname moving_circles_and_rectangles) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))



; a colored-circled is a center( posn), radius (Number) and a color ('Symbol).

(define-struct circle (center radius color))


(define red-circle (make-circle (make-posn 150 150) 50 'red))
(define red-pixel (make-posn 150 150))

;(define (fun-for-circle circle) ..)

(define (draw-a-circle circle)
  (draw-circle (circle-center circle)(circle-radius circle) (circle-color circle))
  )

;> (define red-circle (make-circle (make-posn 150 150) 50 'red))
;> (draw-a-circle red-circle)

; if x is between the left bound and the right bound
; if y is between the lower bound and upper bound


; helpers for in-circle
(define (left-x circle)
  (- (posn-x (circle-center circle)) (circle-radius circle)))

(define (right-x circle)
  (+ (posn-x (circle-center circle)) (circle-radius circle)))

(define (lower-y circle)
  (- (posn-y (circle-center circle)) (circle-radius circle)))
 
(define (upper-y circle)
  (+ (posn-y (circle-center circle)) (circle-radius circle)))

(define (is-between? lower-bound upper-bound value)
  (and (> value lower-bound) (< value upper-bound)))


(define (x-between? circle pixel)
  (is-between? (left-x circle) (right-x circle) (posn-x pixel)))

(define (y-between? circle pixel)
  (is-between? (lower-y circle) (upper-y circle) (posn-y pixel)))

; in circle
(define (in-circle? circle pixel)
  (and (x-between? circle pixel) (y-between? circle pixel)))

(define (translate-circle circle delta)
  (make-circle (make-posn (+ delta (posn-x (circle-center circle))) (posn-y (circle-center circle))) (circle-radius circle) (circle-color circle)))

(define (clear-a-circle circle)
  (draw-a-circle (make-circle (circle-center circle) (circle-radius circle) 'white))) 

; this is kind of ugly but there is left-to-right evaluation, as well some sort of weird thing
; where if I put the and in a sleep with the draw-a-circle in one and conditional, the sleep is evaluated
; before the draw-a-circle is. That does not make sense to me.
(define (draw-and-clear circle)
  (and  (and  (draw-a-circle circle) true) (and (sleep-for-a-while 1) (clear-a-circle circle) )))

(define (move-circle delta a-circle)
  (cond
    [(draw-and-clear a-circle) (translate-circle a-circle delta)]
    [else a-circle]))


;(draw-a-circle (move-circle 10 (move-circle 10 (move-circle 10 (move-circle 10 red-circle)))))