# Helper for StringFileGenerator.cmake
#
# Published under the CC0 License
# https://creativecommons.org/publicdomain/zero/1.0/

file(READ "${infile}" contents)
string(LENGTH "${contents}" filesize)

if(DEFINED delimiter)
  set(use_raw_string TRUE)
else()
  set(use_raw_string FALSE)
endif()

if(WIN32 AND ${filesize} GREATER 65535)
  set(use_raw_string FALSE)
endif()

if(use_raw_string)
  # fast - raw string
  file(WRITE ${outfile} "#include <stddef.h>
extern const char* const ${var} = R\"${delimiter}(${contents})${delimiter}\";
extern const size_t ${var}_len = ${filesize};
")
else()
  # slow - hex-encoded array
  file(READ ${infile} contents HEX)
  string(REGEX REPLACE "(..)" "'\\\\x\\1'," arr_oneline "${contents}")
  # wrap lines. note: '\xnn', is 7 chars
  set(LINE_LENGTH ".................................................\
.................................................") # 98 char
  string(REGEX REPLACE "(${LINE_LENGTH})" "\\1\n" arr "${arr_oneline}")
  file(WRITE ${outfile} "#include <stddef.h>
static const char ${var}_arr[] = {\n${arr}'\\x00'};
extern const char* const ${var} = ${var}_arr;
extern const size_t ${var}_len = ${filesize};
")
endif()
