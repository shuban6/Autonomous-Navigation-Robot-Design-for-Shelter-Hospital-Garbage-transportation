execute_process(COMMAND "/home/cjy/navigation_ws/build/xiaoqiang_tts/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/cjy/navigation_ws/build/xiaoqiang_tts/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
