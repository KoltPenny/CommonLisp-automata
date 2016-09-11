(defun automata (q str)
  "Checks if a string belongs to an alphabet and if it validates a terminal state"
  (let ((states nil) (strlist nil) (curr-st (caar q)))
    (setf strlist (map 'list #'(lambda (x) x) str))
    (setf states (mapcar #'
		  (lambda (sigma)
		    (if (assoc sigma (rest (assoc curr-st q)))
			(setf curr-st (car(last(assoc sigma (rest (assoc curr-st q))))))
			'nr)) strlist))
    (if (not (find 'nr states))
	(if (find 't (assoc curr-st q))
	    (format t "SUCCESS")(format t "FAILED"))
	(format t "NOT RECOGNISED"))))
