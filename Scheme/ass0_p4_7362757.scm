;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; HELPER FUNCTIONS ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; FIND MINIMUM 
; function to find the minimum number in vector
(define find_Min
  (lambda (vec)
    ; looping over all the elements...
    (define looping
      (lambda (i v-min)
        (if (= i (vector-length vec))
          v-min
          (looping (+ i 1) (min v-min (vector-ref vec i))))))
    (looping 1 (vector-ref vec 0))))

;; INDEX OF A VECTOR GETTER
; finding index of a list
; converting a vector to a list
; it's possible to find the index
; at which the min number is present at
(define (index_Getter n l)
  (define sl (member n l))
  (if sl
      (- (length l)
         (length sl))
      #f))

;; GET A'S SOLUTION
; getSol_A takes in the index
; at which the first minimum cost
; exists and returns the solution 
(define getSol_A
  (lambda (min_cost_A_index)
    ; checking to see if the supply is greater than demand 
    (if(> (vector-ref supply min_cost_A_index) (vector-ref demand 0) )
      (begin ; if so ...
        ; then the solution value for the vector at index "min_cost_A_index" is 0
        (vector-set! solA min_cost_A_index ( vector-ref demand 0))
        ; if supply > demand then we set supply to (supply - demand) and replace with original value
        (vector-set! supply min_cost_A_index (- (vector-ref supply min_cost_A_index) (vector-ref demand 0))))
    ; checking to see if the demand is greater than the supply
    (if (< (vector-ref supply min_cost_A_index) (vector-ref demand 0) )
      (begin
        ; then the total demand becomes the solution at the A vector
        (vector-set! solA min_cost_A_index ( vector-ref supply min_cost_A_index ))
        ; and supply is now 0
        (vector-set! supply min_cost_A_index 0 ))))))

;; GET B'S SOLUTION
; same as previous function
(define getSol_B
  (lambda (min_cost_B_index)
    (if(> (vector-ref supply min_cost_B_index) (vector-ref demand 1) )
      (begin 
        (vector-set! solB min_cost_B_index ( vector-ref demand 1))
        (vector-set! supply min_cost_B_index (- (vector-ref supply min_cost_B_index) (vector-ref demand 1)))
        ())
    (if (< (vector-ref supply min_cost_B_index) (vector-ref demand 1) )
      (begin
        (vector-set! solB min_cost_B_index ( vector-ref supply min_cost_B_index ))
        (vector-set! supply min_cost_B_index 1 ))
    () ))))

;; GET C'S SOLUTION 
(define getSol_C
  (lambda (min_cost_C_index)
    (if(> (vector-ref supply min_cost_C_index) (vector-ref demand 2) )
      (begin 
        (vector-set! solC min_cost_C_index ( vector-ref demand 2))
        (vector-set! supply min_cost_C_index (- (vector-ref supply min_cost_C_index) (vector-ref demand 2))))
    (if (< (vector-ref supply min_cost_C_index) (vector-ref demand 2) )
      (begin
        (vector-set! solC min_cost_C_index ( vector-ref supply min_cost_C_index ))
        (vector-set! supply min_cost_C_index 2 ))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; HELPER FUNCTIONS ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; MAIN ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; defining variables and making 
; vectors to hold the value of 
; each cost
(define costA #(0 0 0))
(define costB #(0 0 0))
(define costC #(0 0 0))

; a solution vector where the 
; resulting initial solution will
; be stored
(define solA #(0 0 0))
(define solB #(0 0 0))
(define solC #(0 0 0))

;; Costs for all Factories
; setting up costs for factory A
(vector-set! costA 0 6)
(vector-set! costA 1 7)
(vector-set! costA 2 4)

; setting up costs for factory B
(vector-set! costB 0 8)
(vector-set! costB 1 11)
(vector-set! costB 2 5)

; setting up costs for factory C
(vector-set! costC 0 10)
(vector-set! costC 1 11)
(vector-set! costC 2 12)

; setting up the supply & demand
(define supply (make-vector 3))
(vector-set! supply 0 150)
(vector-set! supply 1 175)
(vector-set! supply 2 275)
(define demand (make-vector 3))
(vector-set! demand 0 200)
(vector-set! demand 1 100)
(vector-set! demand 2 300)

; finding the minimum cost in each A,B,C vector
(define min_cost_A (find_Min costA))
(define min_cost_B (find_Min costB))
(define min_cost_C (find_Min costB))

; using the known minimum cost, find 
; the index of that.
(define min_cost_A_index (index_Getter min_cost_A (vector->list costA)))
(define min_cost_B_index (index_Getter min_cost_B (vector->list costB)))
(define min_cost_C_index (index_Getter min_cost_C (vector->list costB)))

;;;;;;;; FOR A ;;;;;;;;;;;;
(getSol_A min_cost_A_index)
(getSol_B min_cost_B_index)
(getSol_C min_cost_C_index)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; MAIN ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
