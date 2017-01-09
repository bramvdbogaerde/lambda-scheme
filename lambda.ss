(define (repeat n f x)
  (if (> n 0)
	(repeat (- n 1) f (f x))
	x))

(define (c-n n)
  (lambda (f)
	(lambda (x)
	  (repeat n f x))))

(define (to-int cn)
  ((cn (lambda (x) (+ x 1))) 0))

(define (plus n)
  (lambda (m)
	(lambda (f)
	  (lambda (x)
		((n f) ((m f) x))))))

(define (times n)
  (lambda (m)
	(lambda (f)
		(n (m f)))))

(define true
  (lambda (a)
	(lambda (b)
	  a)))

(define false
  (lambda (a)
	(lambda (b)
	  b)))

(define (iszero n)
  ((n (lambda (x) false)) true))

(define (lif t)
  (lambda (c)
	(lambda (a)
	  ((t c) a))))

