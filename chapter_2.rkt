;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname chapter_2) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define (area-of-disk r )
   (* 3.14 (* r r )))

(define (area-of-ring outer inner)
  (-(area-of-disk outer)
    (area-of-disk inner)))

; I DID THIS!
(define (Fahrenheit->Celsius f)
  ( * ( / 5 9) (- f 32)))

(define (Dollar->Euro D)
  ( * D 0.94))

(define (triangle side height)
  ( * 0.5 (* side height)))

(define (convert3 a b c)
  ( + a (+ (* b 10) (* c 100))
        ))

(define (one n)
  (+ 10 (* n n)))

(define (two n)
  (+ 20  (* 0.5 (* n n))))

(define (three n)
  (- 2 (/ 1 n)))

;2.3
(define (wage h)
  (* 12 h))

(define (tax grosspay)
  (* 0.15 grosspay))


(define (netpay h)
(- (wage h) (tax (wage h)) ))

(define (sum-coins pennies nickels dimes quarters)
   (+ (+ (+ (* pennies 0.01) (* nickels 0.05)) (* dimes 0.1)) (* quarters 0.25)))


(define (total-profit n)
  ( - ( - ( * n 5) 20) (* n 0.5)))


;2.4
(define (f x)
  (+ x 10))

(define (g x)
  (+ x 10))

(define (h x)
  (+ x 10))



(define base-cost 180)

(define cost-per-attendee 0.04)
(define base-ticketprice 5.0)
(define base-attendees 120)
(define attendee-increment 15)
(define ticketprice-increment .10)


(define (profit ticketprice)
  (- (revenue ticketprice) (cost ticketprice)))

(define (revenue ticketprice)
  (* (attendees ticketprice) ticketprice))



(define (cost ticketprice)
  (+ base-cost (* (attendees ticketprice) cost-per-attendee)))



(define (attendees ticketprice)
  (+ base-attendees (* (/ attendee-increment ticketprice-increment) (- base-ticketprice ticketprice))))




; these should take a const cm_in_inches (for example).

(define (inches->cm inches)
  (* inches 2.54))

(define (feet->inches feet )
  (* feet 12))

(define (yard->feet yard)
  (* yard 3))

(define (rod->yard rod)
  (* rod 5.5))

(define (furlong->rod furlong)
  (* furlong 40))

(define (mile->furlong mile)
  (* mile 8))

(define (feet->cm feet)
  (inches->cm (feet->inches feet)))

(define (yards->cm yards)
  (inches->cm (feet->inches (yard->feet yards))))

(define (rods->inches rods)
  (feet->inches (yard->feet (rod->yard rods))))

(define (miles->feet miles)
  (yard->feet (rod->yard (furlong->rod (mile->furlong miles)))))



(define PI 3.14159)

(define (circle-area r)
  (* r(* PI r)))

(define (area-cylinder radius height)
  (+ (* 2(circle-area radius))
    (* (* (* 2 PI) radius) height)))


(define (is-between-3-7 n)
  (and (>= n 3) (< n 7)))

; cond examples
(define (interest-rate amount)
  (cond
    [(<= amount  1000) 0.04]
    [(<= amount 5000) 0.045]
    [(> amount 5000) 0.05])) ;even though this last conditional is redundant, I prefer specifying it anyway.

; it truly helps to understand that this define just merely means: replace this first bracket-enclosed expression by the second one, where you can substitute the variable by this name by the variable of the same name.
(define (interest amount)
  (cond
    [(<= amount 1000) (* amount 0.04)] ; hold up: I can understand function application being like macro substitution. But why is cond different? only if this conditional is true, it is replaced by this?
    [(<= amount 5000) (* amount 0.045)]
    [(> amount 5000) (* amount 0.05)]
    ))

(define (tax2 gross-pay)
  (cond
    [(<= gross-pay 240) 0] ; hold up: I can understand function application being like macro substitution. But why is cond different? only if this conditional is true, it is replaced by this?
    [(<= gross-pay 480) (* gross-pay 0.15)]
    [(> gross-pay 480) (* gross-pay 0.28)]
    ))

(define (gross-pay hours)
  (* hours 12))

(define (net-pay hours)
  (- (gross-pay hours) (tax2(gross-pay hours))))


; some nice "recursive" function application!
(define (pay-back charge)
  (cond
    [(<= charge 500) (* 0.0025 charge)]
    [(<= charge 1500) (+ (pay-back 500)  (* (- charge 500) 0.005))]
    [(<= charge 2500) (+ (pay-back 1500) (* (- charge 1500) 0.0075))]
    [(> charge 2500) (+ (pay-back 2500) (* (- charge 2500) 0.01))]
    ))

; assume a is nonzero.
(define (how-many a b c)
  (cond
    [(> (* b b) (* (* 4 a) c)) 2]
    [(= (* b b) (* (* 4 a) c)) 1]
    [ else 0]))

; 5.1

(define (distance-to-0 a-posn)
  (sqrt
   (+ (sqrt(posn-x a-posn))
      (sqrt(posn-y a-posn)))))


(start 300 300)
(draw-solid-line (make-posn 1 1) (make-posn 5 5) 'red)
(draw-solid-rect (make-posn 20 10) 50 200 'blue)
(draw-circle (make-posn 200 10) 50 'red)
(draw-solid-disk (make-posn 200 10) 50 'green)



