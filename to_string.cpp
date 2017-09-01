# include "src/to_string.hpp"
# include <echar_t.hpp>
# include <cstdio>
int main() {
	int unsigned x = 21299;
	mdl::echar_t *t = mdl::to_string(x);
	printf("%s\n", t);
	std::free(t);
}
