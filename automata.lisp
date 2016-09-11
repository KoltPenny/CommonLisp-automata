(defparameter curr-st nil)
(defparameter strlist nil)

(defun state-check (q sigma)
  "executes the relation of pertenence and returns a state"
  (if (assoc sigma (rest (assoc curr-st q)))
      (setf curr-st (latom (assoc sigma (rest (assoc curr-st q)))))
      'nr))

(defun automata (q str)
  "Checks if a string belongs to an alphabet and if it validates a terminal state"
  (defparameter curr-st (caar q))
  (defparameter strlist nil)
  (let ((states nil))
    (setf strlist (map 'list #'(lambda (x) x) str))
    (setf states (mapcar #'(lambda (x) (state-check q x)) strlist))
    (if (not (find 'nr states))
	(if (find 't (assoc curr-st q))
	    (format t "SUCCESS")
	    (format t "FAILED"))
	(format t "NOT RECOGNISED"))))
