cmake_minimum_required(VERSION 3.1)
project(StringFileEx)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")
include(StringFileGenerator)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wextra")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror=return-type")

set(SOURCES
  main.cpp
)

add_string_files(STRINGS
  books/on_liberty.txt
)

add_executable(example ${SOURCES} ${STRINGS})
