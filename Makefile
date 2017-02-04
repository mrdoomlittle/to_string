all:
	g++ -c -std=c++11 -DARC64 -o src/to_string.o src/to_string.cpp
	ar rcs lib/libto_string.a src/to_string.o

	g++ -std=c++11 -Iinc -Llib -DARC64 -o to_string to_string.cpp -lto_string -lgetdigit -lintlen
clean:
	rm src/*.o
	rm lib/*.a

