# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cjy/navigation_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cjy/navigation_ws/build

# Include any dependencies generated for this target.
include xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/depend.make

# Include the progress variables for this target.
include xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/progress.make

# Include the compile flags for this target's objects.
include xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/flags.make

xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/src/iat_sample.c.o: xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/flags.make
xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/src/iat_sample.c.o: /home/cjy/navigation_ws/src/xf-ros/xfei_asr/src/iat_sample.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cjy/navigation_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/src/iat_sample.c.o"
	cd /home/cjy/navigation_ws/build/xf-ros/xfei_asr && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/iat_sample.dir/src/iat_sample.c.o   -c /home/cjy/navigation_ws/src/xf-ros/xfei_asr/src/iat_sample.c

xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/src/iat_sample.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/iat_sample.dir/src/iat_sample.c.i"
	cd /home/cjy/navigation_ws/build/xf-ros/xfei_asr && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cjy/navigation_ws/src/xf-ros/xfei_asr/src/iat_sample.c > CMakeFiles/iat_sample.dir/src/iat_sample.c.i

xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/src/iat_sample.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/iat_sample.dir/src/iat_sample.c.s"
	cd /home/cjy/navigation_ws/build/xf-ros/xfei_asr && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cjy/navigation_ws/src/xf-ros/xfei_asr/src/iat_sample.c -o CMakeFiles/iat_sample.dir/src/iat_sample.c.s

# Object files for target iat_sample
iat_sample_OBJECTS = \
"CMakeFiles/iat_sample.dir/src/iat_sample.c.o"

# External object files for target iat_sample
iat_sample_EXTERNAL_OBJECTS =

/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/src/iat_sample.c.o
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/build.make
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /opt/ros/noetic/lib/libroscpp.so
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /opt/ros/noetic/lib/librosconsole.so
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /opt/ros/noetic/lib/librostime.so
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /opt/ros/noetic/lib/libcpp_common.so
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: /home/cjy/navigaton_ws/src/xfei_asr/lib/libmsc.so
/home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample: xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cjy/navigation_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable /home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample"
	cd /home/cjy/navigation_ws/build/xf-ros/xfei_asr && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/iat_sample.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/build: /home/cjy/navigation_ws/devel/lib/xfei_asr/iat_sample

.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/build

xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/clean:
	cd /home/cjy/navigation_ws/build/xf-ros/xfei_asr && $(CMAKE_COMMAND) -P CMakeFiles/iat_sample.dir/cmake_clean.cmake
.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/clean

xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/depend:
	cd /home/cjy/navigation_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cjy/navigation_ws/src /home/cjy/navigation_ws/src/xf-ros/xfei_asr /home/cjy/navigation_ws/build /home/cjy/navigation_ws/build/xf-ros/xfei_asr /home/cjy/navigation_ws/build/xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_sample.dir/depend
