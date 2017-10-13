# include <mdl/to_string.hpp>
# include <cstdio>
# include <cstdlib>
int main() {
	int unsigned x = 21299;
	char *t = mdl::to_string(x);
	printf("%s\n", t);
	free(t);
}
