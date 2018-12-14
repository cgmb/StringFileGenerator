# Helper for StringFileGenerator.cmake
#
# Published under the CC0 License
# https://creativecommons.org/publicdomain/zero/1.0/

file(READ ${infile} contents)
file(WRITE ${outfile} "extern const char* const ${var} =\nR\"${delimiter}(${contents})${delimiter}\";\n")
