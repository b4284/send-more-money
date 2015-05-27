(use-modules (ice-9 match) (srfi srfi-1))

(define 0-9 (reverse (iota 10)))

(define symbols '(s e n d m o r y))

(define (verify-2 l)
  (match l
    ((s e n d m o r y)
     (if (and (not (= s 0)) (not (= m 0)))
         (let ((send (digit-list->number (list s e n d)))
               (more (digit-list->number (list m o r e)))
               (money (digit-list->number (list m o n e y))))
           (if (= (+ send more) money)
               (format #t "match found: ~a\n" l)))))))

(define (digit-list->number l)
  (fold (lambda (a b) (+ a (* b 10))) 0 l))

(define (perm-3 l a f c)
  (if (zero? c)
      (f (reverse a))
      (let M ((left '()) (right l))
        (if (null? right)
            '()
            (let ((h (car right)) (t (cdr right)))
              (perm-3 (append (reverse left) t) (cons h a) f (1- c))
              (M (cons h left) t))))))

(perm-3 0-9 '() verify-2 8)
