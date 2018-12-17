# StringFileGenerator

An example project for turning files into C++11 raw strings using CMake.

## Ubuntu Dependencies

    sudo apt install cmake build-essential

## How to Build

    cmake -H. -Bbuild     # configure
    cmake --build build   # build
    build/example         # run (Linux)
    build\Debug\example   # run (Windows)
