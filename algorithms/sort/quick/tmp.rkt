#lang racket
(define lst '( 1 2 3 0 9 8 7 6 5 4))
(define vec (list->vector lst))
(define pos 3)
(define element (vector-ref vec pos))
(define sze (vector-length vec))
(define v 12)
(vector-set! vec pos v)
(define random-element
  (lambda(vec)
    (random (vector-length vec))))

(define (partition vec p r)
  (define x (vector-ref vec r))
  (define i (sub1 p))
  (for ([j (in-range p r)])
    (
    

(define (Quicksort vec p r)
  (if (< p r)
      (let ([q (partition vec p r)])
        (Quicksort( vec p (sub1 q)))
        (Quicksort( vec (add1 q) r)))
      #t))
	
	if(p&lt;r){
		int q = Partition(A, p, r);
		Quicksort(A, p, q-1);
		Quicksort(A, q+1, r);
	}
}

int Partition(int A[], int p, int r){
	int j, temp;
	
	int x = A[r];
	int i = p -1;
	
	for(j = p;j&lt;r;j++){
		if(A[j]&lt;= x)
		{
			i++;
			temp = A[i];
			A[i] = A[j];
			A[j] = temp;
		}
	}
	temp = A[r];
	A[r] = A[i +1];
	A[i+1] = temp;
	
	return i+1;
My Scheme Implementation