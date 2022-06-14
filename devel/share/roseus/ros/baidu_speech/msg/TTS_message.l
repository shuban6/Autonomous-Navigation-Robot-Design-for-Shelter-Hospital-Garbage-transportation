;; Auto-generated. Do not edit!


(when (boundp 'baidu_speech::TTS_message)
  (if (not (find-package "BAIDU_SPEECH"))
    (make-package "BAIDU_SPEECH"))
  (shadow 'TTS_message (find-package "BAIDU_SPEECH")))
(unless (find-package "BAIDU_SPEECH::TTS_MESSAGE")
  (make-package "BAIDU_SPEECH::TTS_MESSAGE"))

(in-package "ROS")
;;//! \htmlinclude TTS_message.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass baidu_speech::TTS_message
  :super ros::object
  :slots (_header _engine _sentence _language _engine_settings _speaker_settings _time ))

(defmethod baidu_speech::TTS_message
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:engine __engine) (instance std_msgs::String :init))
    ((:sentence __sentence) (instance std_msgs::String :init))
    ((:language __language) (instance std_msgs::String :init))
    ((:engine_settings __engine_settings) (instance std_msgs::String :init))
    ((:speaker_settings __speaker_settings) (instance std_msgs::String :init))
    ((:time __time) (instance ros::time :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _engine __engine)
   (setq _sentence __sentence)
   (setq _language __language)
   (setq _engine_settings __engine_settings)
   (setq _speaker_settings __speaker_settings)
   (setq _time __time)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:engine
   (&rest __engine)
   (if (keywordp (car __engine))
       (send* _engine __engine)
     (progn
       (if __engine (setq _engine (car __engine)))
       _engine)))
  (:sentence
   (&rest __sentence)
   (if (keywordp (car __sentence))
       (send* _sentence __sentence)
     (progn
       (if __sentence (setq _sentence (car __sentence)))
       _sentence)))
  (:language
   (&rest __language)
   (if (keywordp (car __language))
       (send* _language __language)
     (progn
       (if __language (setq _language (car __language)))
       _language)))
  (:engine_settings
   (&rest __engine_settings)
   (if (keywordp (car __engine_settings))
       (send* _engine_settings __engine_settings)
     (progn
       (if __engine_settings (setq _engine_settings (car __engine_settings)))
       _engine_settings)))
  (:speaker_settings
   (&rest __speaker_settings)
   (if (keywordp (car __speaker_settings))
       (send* _speaker_settings __speaker_settings)
     (progn
       (if __speaker_settings (setq _speaker_settings (car __speaker_settings)))
       _speaker_settings)))
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/String _engine
    (send _engine :serialization-length)
    ;; std_msgs/String _sentence
    (send _sentence :serialization-length)
    ;; std_msgs/String _language
    (send _language :serialization-length)
    ;; std_msgs/String _engine_settings
    (send _engine_settings :serialization-length)
    ;; std_msgs/String _speaker_settings
    (send _speaker_settings :serialization-length)
    ;; time _time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/String _engine
       (send _engine :serialize s)
     ;; std_msgs/String _sentence
       (send _sentence :serialize s)
     ;; std_msgs/String _language
       (send _language :serialize s)
     ;; std_msgs/String _engine_settings
       (send _engine_settings :serialize s)
     ;; std_msgs/String _speaker_settings
       (send _speaker_settings :serialize s)
     ;; time _time
       (write-long (send _time :sec) s) (write-long (send _time :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/String _engine
     (send _engine :deserialize buf ptr-) (incf ptr- (send _engine :serialization-length))
   ;; std_msgs/String _sentence
     (send _sentence :deserialize buf ptr-) (incf ptr- (send _sentence :serialization-length))
   ;; std_msgs/String _language
     (send _language :deserialize buf ptr-) (incf ptr- (send _language :serialization-length))
   ;; std_msgs/String _engine_settings
     (send _engine_settings :deserialize buf ptr-) (incf ptr- (send _engine_settings :serialization-length))
   ;; std_msgs/String _speaker_settings
     (send _speaker_settings :deserialize buf ptr-) (incf ptr- (send _speaker_settings :serialization-length))
   ;; time _time
     (send _time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get baidu_speech::TTS_message :md5sum-) "eb6f1b90f95952fc40263a7efbe0490f")
(setf (get baidu_speech::TTS_message :datatype-) "baidu_speech/TTS_message")
(setf (get baidu_speech::TTS_message :definition-)
      "std_msgs/Header header
std_msgs/String engine
std_msgs/String sentence
std_msgs/String language
std_msgs/String engine_settings
std_msgs/String speaker_settings
time time

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: std_msgs/String
string data

")



(provide :baidu_speech/TTS_message "eb6f1b90f95952fc40263a7efbe0490f")


