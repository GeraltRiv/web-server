# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

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
CMAKE_COMMAND = /home/jack/Documents/clion-2016.3.2/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/jack/Documents/clion-2016.3.2/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jack/CLionProjects/WebServer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jack/CLionProjects/WebServer/cmake-build-debug

# Include any dependencies generated for this target.
include libevent/CMakeFiles/time-test.dir/depend.make

# Include the progress variables for this target.
include libevent/CMakeFiles/time-test.dir/progress.make

# Include the compile flags for this target's objects.
include libevent/CMakeFiles/time-test.dir/flags.make

libevent/CMakeFiles/time-test.dir/sample/time-test.c.o: libevent/CMakeFiles/time-test.dir/flags.make
libevent/CMakeFiles/time-test.dir/sample/time-test.c.o: ../libevent/sample/time-test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jack/CLionProjects/WebServer/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libevent/CMakeFiles/time-test.dir/sample/time-test.c.o"
	cd /home/jack/CLionProjects/WebServer/cmake-build-debug/libevent && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/time-test.dir/sample/time-test.c.o   -c /home/jack/CLionProjects/WebServer/libevent/sample/time-test.c

libevent/CMakeFiles/time-test.dir/sample/time-test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/time-test.dir/sample/time-test.c.i"
	cd /home/jack/CLionProjects/WebServer/cmake-build-debug/libevent && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jack/CLionProjects/WebServer/libevent/sample/time-test.c > CMakeFiles/time-test.dir/sample/time-test.c.i

libevent/CMakeFiles/time-test.dir/sample/time-test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/time-test.dir/sample/time-test.c.s"
	cd /home/jack/CLionProjects/WebServer/cmake-build-debug/libevent && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jack/CLionProjects/WebServer/libevent/sample/time-test.c -o CMakeFiles/time-test.dir/sample/time-test.c.s

libevent/CMakeFiles/time-test.dir/sample/time-test.c.o.requires:

.PHONY : libevent/CMakeFiles/time-test.dir/sample/time-test.c.o.requires

libevent/CMakeFiles/time-test.dir/sample/time-test.c.o.provides: libevent/CMakeFiles/time-test.dir/sample/time-test.c.o.requires
	$(MAKE) -f libevent/CMakeFiles/time-test.dir/build.make libevent/CMakeFiles/time-test.dir/sample/time-test.c.o.provides.build
.PHONY : libevent/CMakeFiles/time-test.dir/sample/time-test.c.o.provides

libevent/CMakeFiles/time-test.dir/sample/time-test.c.o.provides.build: libevent/CMakeFiles/time-test.dir/sample/time-test.c.o


# Object files for target time-test
time__test_OBJECTS = \
"CMakeFiles/time-test.dir/sample/time-test.c.o"

# External object files for target time-test
time__test_EXTERNAL_OBJECTS =

libevent/bin/time-test: libevent/CMakeFiles/time-test.dir/sample/time-test.c.o
libevent/bin/time-test: libevent/CMakeFiles/time-test.dir/build.make
libevent/bin/time-test: libevent/lib/libevent_extra.a
libevent/bin/time-test: zlib/libz.so.1.2.11
libevent/bin/time-test: libevent/CMakeFiles/time-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jack/CLionProjects/WebServer/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bin/time-test"
	cd /home/jack/CLionProjects/WebServer/cmake-build-debug/libevent && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/time-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libevent/CMakeFiles/time-test.dir/build: libevent/bin/time-test

.PHONY : libevent/CMakeFiles/time-test.dir/build

libevent/CMakeFiles/time-test.dir/requires: libevent/CMakeFiles/time-test.dir/sample/time-test.c.o.requires

.PHONY : libevent/CMakeFiles/time-test.dir/requires

libevent/CMakeFiles/time-test.dir/clean:
	cd /home/jack/CLionProjects/WebServer/cmake-build-debug/libevent && $(CMAKE_COMMAND) -P CMakeFiles/time-test.dir/cmake_clean.cmake
.PHONY : libevent/CMakeFiles/time-test.dir/clean

libevent/CMakeFiles/time-test.dir/depend:
	cd /home/jack/CLionProjects/WebServer/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jack/CLionProjects/WebServer /home/jack/CLionProjects/WebServer/libevent /home/jack/CLionProjects/WebServer/cmake-build-debug /home/jack/CLionProjects/WebServer/cmake-build-debug/libevent /home/jack/CLionProjects/WebServer/cmake-build-debug/libevent/CMakeFiles/time-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libevent/CMakeFiles/time-test.dir/depend

