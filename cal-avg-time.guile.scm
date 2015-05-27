(use-modules (srfi srfi-1)
             (ice-9 rdelim)
             (ice-9 format))

(define (read->list m)
  (call-with-input-file m
      (lambda (f)
        (let M ((l (read-line f)) (q '()))
          (if (eof-object? l)
              (reverse q)
              (M (read-line f) (cons l q)))))))

(define (main x)
  (let ((lon (map string->number (read->list (cadr x)))))
    (format #t "~,3f\n" (/ (apply + lon) (length lon)))))
