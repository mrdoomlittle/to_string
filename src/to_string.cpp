# include "to_string.hpp"
constexpr mdl::echar_t int_as_char[10] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
mdl::echar_t *mdl::to_string(uint_t __no) {
	std::size_t len_of_int = intlen(__no);
	echar_t *int_as_str = static_cast<echar_t *>(malloc((len_of_int + 1) * sizeof(echar_t)));
	memset(int_as_str, '\0', (len_of_int + 1) * sizeof(echar_t));

	for (std::size_t o = 0; o != len_of_int; o ++) int_as_str[o] = int_as_char[getdigit(__no, o)];
	return int_as_str;
}
