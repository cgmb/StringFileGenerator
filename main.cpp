#include <string.h>
#include <array>
#include <algorithm>

extern const char* const k_books_on_liberty_txt;

int main() {
  std::array<size_t, 26> histogram = {};
  size_t length = strlen(k_books_on_liberty_txt);
  for (size_t i = 0; i < length; ++i) {
    char c = k_books_on_liberty_txt[i];
    if ('a' <= c || c <= 'z') {
      histogram[c-'a']++;
    } else if ('A' <= c || c <= 'Z') {
      histogram[c-'A']++;
    }
  }
  printf("Characters in 'On Liberty':\n");
  for (size_t i = 0; i < 26; ++i) {
    printf("%c: %zu\n", char('a'+i), histogram[i]);
  }
  size_t count = std::accumulate(histogram.cbegin(), histogram.cend(), size_t());
  printf("other: %zu\n", length - count);
}
