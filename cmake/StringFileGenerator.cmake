# String File Generator
# Creates C++11 a raw string for each the given input files.

# Authored in 2018 by Cordell Bloor
# Published under the CC0 License
# https://creativecommons.org/publicdomain/zero/1.0/

function(add_string_file sources input)
  string(MAKE_C_IDENTIFIER "k_${input}" var)
  set(input_file "${CMAKE_CURRENT_SOURCE_DIR}/${input}")
  set(output_file "${CMAKE_CURRENT_BINARY_DIR}/${input}.cpp")
  set(script "${CMAKE_CURRENT_SOURCE_DIR}/cmake/CppStr.cmake")
  add_custom_command(OUTPUT "${output_file}"
    COMMAND ${CMAKE_COMMAND} -Dvar=${var} -Ddelimiter=*** -Dinfile=${input_file} -Doutfile=${output_file} -P ${script}
    MAIN_DEPENDENCY "${input_file}"
    DEPENDS "${script}"
    VERBATIM
  )
  # append our output file to the list named in source
  set(${sources} ${${sources}} ${output_file} PARENT_SCOPE)
endfunction()

macro(add_string_files sources)
  foreach(input ${ARGN})
    add_string_file(${sources} ${input})
  endforeach()
endmacro()
