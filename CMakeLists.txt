cmake_minimum_required(VERSION 3.6)
project(WebServer)

set(CMAKE_CXX_STANDARD 11)


find_package(Boost 1.57.0 COMPONENTS system filesystem thread REQUIRED)

if(Boost_FOUND)

    message(STATUS "Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
    message(STATUS "Boost_LIBRARIES: ${Boost_LIBRARIES}")
    message(STATUS "Boost_VERSION: ${Boost_VERSION}")

    include_directories(${Boost_INCLUDE_DIRS})

endif()

set(SOURCE_FILES # main.cpp connection.cpp connection.h connection_manager.cpp connection_manager.h mime_types.cpp mime_types.h reply.cpp reply.h request_handler.cpp request_handler.h request_parser.cpp request_parser.h server.cpp server.h request.h header.h)
        main.cpp com.jack.server/ServerMain.cpp com.jack.server/ServerMain.h com.jack.server/utils/ConnectionManager.cpp com.jack.server/utils/ConnectionManager.h
        com.jack.server/RequestHandler.cpp com.jack.server/RequestHandler.h com.jack.server/model/Connection.cpp com.jack.server/model/Connection.h
        com.jack.server/model/Request.h com.jack.server/model/Header.h com.jack.server/model/Reply.cpp com.jack.server/model/Reply.h com.jack.server/utils/RequestParser.cpp
        com.jack.server/utils/RequestParser.h)

add_executable(WebServer ${SOURCE_FILES})

if(Boost_FOUND)

    target_link_libraries(WebServer -lpthread ${Boost_LIBRARIES})

endif()


#include_directories(${MY_SOURCE_DIR}/libevent)
#add_subdirectory(zlib)
#set(ZLIB_LIBRARY zlib)
#set(ZLIB_INCLUDE_DIR zlib)
#add_subdirectory(libevent)
