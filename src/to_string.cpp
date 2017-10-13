# include "to_string.hpp"
# include <mdl/intlen.hpp>
# include <mdl/getdigit.hpp>
# include <string.h>
# include <cstdlib>
constexpr char static int_as_char[10] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
char* mdl::to_string(uint_t __no) {
	uint_t len_of_int = intlen(__no);
	char *int_as_str = static_cast<char*>(malloc(len_of_int+1));
	memset(int_as_str, '\0', len_of_int+1);

	uint_t i = 0;
	for (; i != len_of_int; i ++) int_as_str[i] = int_as_char[getdigit(__no, i)];
	return int_as_str;
}
