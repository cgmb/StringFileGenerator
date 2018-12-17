cmake_minimum_required(VERSION 3.1)
project(StringFileEx)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")
include(StringFileGenerator)

SET(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if (UNIX)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror=return-type")
endif()

set(SOURCES
  example.cpp
)

add_string_files(STRINGS
  books/on_liberty.txt
)

add_executable(example ${SOURCES} ${STRINGS})
