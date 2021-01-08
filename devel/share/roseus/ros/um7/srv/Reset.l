;; Auto-generated. Do not edit!


(when (boundp 'um7::Reset)
  (if (not (find-package "UM7"))
    (make-package "UM7"))
  (shadow 'Reset (find-package "UM7")))
(unless (find-package "UM7::RESET")
  (make-package "UM7::RESET"))
(unless (find-package "UM7::RESETREQUEST")
  (make-package "UM7::RESETREQUEST"))
(unless (find-package "UM7::RESETRESPONSE")
  (make-package "UM7::RESETRESPONSE"))

(in-package "ROS")





(defclass um7::ResetRequest
  :super ros::object
  :slots (_zero_gyros _reset_ekf _set_mag_ref ))

(defmethod um7::ResetRequest
  (:init
   (&key
    ((:zero_gyros __zero_gyros) nil)
    ((:reset_ekf __reset_ekf) nil)
    ((:set_mag_ref __set_mag_ref) nil)
    )
   (send-super :init)
   (setq _zero_gyros __zero_gyros)
   (setq _reset_ekf __reset_ekf)
   (setq _set_mag_ref __set_mag_ref)
   self)
  (:zero_gyros
   (&optional __zero_gyros)
   (if __zero_gyros (setq _zero_gyros __zero_gyros)) _zero_gyros)
  (:reset_ekf
   (&optional __reset_ekf)
   (if __reset_ekf (setq _reset_ekf __reset_ekf)) _reset_ekf)
  (:set_mag_ref
   (&optional __set_mag_ref)
   (if __set_mag_ref (setq _set_mag_ref __set_mag_ref)) _set_mag_ref)
  (:serialization-length
   ()
   (+
    ;; bool _zero_gyros
    1
    ;; bool _reset_ekf
    1
    ;; bool _set_mag_ref
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _zero_gyros
       (if _zero_gyros (write-byte -1 s) (write-byte 0 s))
     ;; bool _reset_ekf
       (if _reset_ekf (write-byte -1 s) (write-byte 0 s))
     ;; bool _set_mag_ref
       (if _set_mag_ref (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _zero_gyros
     (setq _zero_gyros (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _reset_ekf
     (setq _reset_ekf (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _set_mag_ref
     (setq _set_mag_ref (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass um7::ResetResponse
  :super ros::object
  :slots ())

(defmethod um7::ResetResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass um7::Reset
  :super ros::object
  :slots ())

(setf (get um7::Reset :md5sum-) "626ea3efbc6874926126840202a803dd")
(setf (get um7::Reset :datatype-) "um7/Reset")
(setf (get um7::Reset :request) um7::ResetRequest)
(setf (get um7::Reset :response) um7::ResetResponse)

(defmethod um7::ResetRequest
  (:response () (instance um7::ResetResponse :init)))

(setf (get um7::ResetRequest :md5sum-) "626ea3efbc6874926126840202a803dd")
(setf (get um7::ResetRequest :datatype-) "um7/ResetRequest")
(setf (get um7::ResetRequest :definition-)
      "bool zero_gyros
bool reset_ekf
bool set_mag_ref
---

")

(setf (get um7::ResetResponse :md5sum-) "626ea3efbc6874926126840202a803dd")
(setf (get um7::ResetResponse :datatype-) "um7/ResetResponse")
(setf (get um7::ResetResponse :definition-)
      "bool zero_gyros
bool reset_ekf
bool set_mag_ref
---

")



(provide :um7/Reset "626ea3efbc6874926126840202a803dd")


