(defun automata (q str &aux (state (caar q)) (l-str (coerce str 'list)))
  "Check if a string belongs to an alphabet and if it validates a terminal state."
  (format
   t(cond((find 'nr (mapcar #'(lambda(s)(if(assoc s (rest (assoc state q)))
					   (setf state (car(last(assoc s (rest(assoc state q))))))
					   'nr)) l-str)) "NOT RECOGNISED")
	 ((find 't (assoc state q)) "SUCCESS")(t "FAILED"))))
