(defstruct city
  (name nil :type string)
  (population nil :type number))

(defparameter *cities*
  (list (make-city :name "Lagos"                :population 21.0)
        (make-city :name "Cairo"                :population 15.2)
        (make-city :name "Kinshasa-Brazzaville" :population 11.3)
        (make-city :name "Greater Johannesburg" :population  7.55)
        (make-city :name "Mogadishu"            :population  5.85)
        (make-city :name "Khartoum-Omdurman"    :population  4.98)
        (make-city :name "Dar Es Salaam"        :population  4.7)
        (make-city :name "Alexandria"           :population  4.58)
        (make-city :name "Abidjan"              :population  4.4)
        (make-city :name "Casablanca"           :population  3.98)))

(defun main ()
  (let ((answer1 (position "Dar Es Salaam" *cities* :key #'city-name :test #'string=))
        (answer2 (city-name (find-if (lambda (population) (< population 5))
                                     *cities* :key #'city-population)))
        (answer3 (city-population (find-if (lambda (name) (char= (char name 0) #\A))
                                           *cities* :key #'city-name))))
    (format t "Answer 1: ~A~%" answer1)
    (format t "Answer 2: ~A~%" answer2)
    (format t "Answer 3: ~A~%" answer3)))