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

# Utility rule file for NightlyConfigure.

# Include the progress variables for this target.
include libevent/CMakeFiles/NightlyConfigure.dir/progress.make

libevent/CMakeFiles/NightlyConfigure:
	cd /home/jack/CLionProjects/WebServer/cmake-build-debug/libevent && /home/jack/Documents/clion-2016.3.2/bin/cmake/bin/ctest -C . -D NightlyConfigure

NightlyConfigure: libevent/CMakeFiles/NightlyConfigure
NightlyConfigure: libevent/CMakeFiles/NightlyConfigure.dir/build.make

.PHONY : NightlyConfigure

# Rule to build all files generated by this target.
libevent/CMakeFiles/NightlyConfigure.dir/build: NightlyConfigure

.PHONY : libevent/CMakeFiles/NightlyConfigure.dir/build

libevent/CMakeFiles/NightlyConfigure.dir/clean:
	cd /home/jack/CLionProjects/WebServer/cmake-build-debug/libevent && $(CMAKE_COMMAND) -P CMakeFiles/NightlyConfigure.dir/cmake_clean.cmake
.PHONY : libevent/CMakeFiles/NightlyConfigure.dir/clean

libevent/CMakeFiles/NightlyConfigure.dir/depend:
	cd /home/jack/CLionProjects/WebServer/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jack/CLionProjects/WebServer /home/jack/CLionProjects/WebServer/libevent /home/jack/CLionProjects/WebServer/cmake-build-debug /home/jack/CLionProjects/WebServer/cmake-build-debug/libevent /home/jack/CLionProjects/WebServer/cmake-build-debug/libevent/CMakeFiles/NightlyConfigure.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libevent/CMakeFiles/NightlyConfigure.dir/depend

