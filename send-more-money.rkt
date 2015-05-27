#lang racket

(require srfi/1)
(require racket/match)
(require racket/future)

(define 0-9 (iota 10))

(define symbols '(s e n d m o r y))

(define (verify l)
  (match (cddr l)
    ((list s e n d m o r y)
     (if (and (not (= s 0)) (not (= m 0)))
         (let ((send (digit-list->number (list s e n d)))
               (more (digit-list->number (list m o r e)))
               (money (digit-list->number (list m o n e y))))
           (if (= (+ send more) money)
            (printf "match found: ~a~n" (cddr l))
            '()))
         '()))))

(define (verify-2 l)
  (match l
    ((list s e n d m o r y)
     (if (and (not (= s 0)) (not (= m 0)))
         (let ((send (digit-list->number (list s e n d)))
               (more (digit-list->number (list m o r e)))
               (money (digit-list->number (list m o n e y))))
           (if (= (+ send more) money)
            (printf "match found: ~a~n" l)
            '()))
         '()))))
  
(define (digit-list->number l)
  (let M ((a 0) (b 1) (l2 (reverse l)))
    (if (null? l2)
        a
        (M (+ a (* b (car l2))) (* 10 b) (cdr l2)))))

(define (perm l)
  (if (null? l)
      '(())
      (let M ((left '()) (right l) (perms '()))
        (if (null? right)
            perms
            (let ((h (car right)) (t (cdr right)))
              (M (cons h left) t
                 (append perms (map (λ (ps) (cons h ps))
                                    (perm (append (reverse left) t))))))))))

(define (perm-2 l a f)
  (if (null? l)
      (f (reverse a))
      (let M ((left '()) (right l))
        (if (null? right)
            '()
            (let ((h (car right)) (t (cdr right)))
              (perm-2 (append (reverse left) t) (cons h a) f)
              (M (cons h left) t))))))


(define (perm-3 l a f c)
  (if (zero? c)
      (f (reverse a))
      (let M ((left '()) (right l))
        (if (null? right)
            '()
            (let ((h (car right)) (t (cdr right)))
              (perm-3 (append (reverse left) t) (cons h a) f (sub1 c))
              (M (cons h left) t))))))

(define (perm-3-b l a f c)
  (if (zero? c)
      (f (reverse a))
      (let M ((left '()) (right l) (ft '()))
        (if (null? right)
            (for-each touch ft)
            (let ((h (car right)) (t (cdr right)))
              (M (cons h left) t
                 (cons (future
                        (lambda () (perm-3 (append (reverse left) t)
                                       (cons h a) f (sub1 c)))) ft)))))))

(define 0-9perms (perm '(1 2 3 4)))

(perm-3 0-9 '() verify-2 8)
