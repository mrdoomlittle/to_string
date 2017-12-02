SHELL :=/bin/bash
def_install_dir=/usr/local
ifndef install_dir
 install_dir=$(def_install_dir)
endif

no_binary=true
ifndef getdigit_inc_dir
 getdigit_inc_dir=$(def_install_dir)/include
endif

ifndef getdigit_lib_dir
 getdigit_lib_dir=$(def_install_dir)/lib
endif

ifndef intlen_inc_dir
 intlen_inc_dir=$(def_install_dir)/include
endif

ifndef intlen_lib_dir
 intlen_lib_dir=$(def_install_dir)/lib
endif

ifndef mdlint_inc_dir
 mdlint_inc_dir=$(def_install_dir)/include
endif

inc_flags=-Iinc -I$(mdlint_inc_dir) -I$(getdigit_inc_dir) -I$(intlen_inc_dir)
lib_flags=-Llib -L$(getdigit_lib_dir) -L$(intlen_lib_dir)

ifndef arc
 arc=ARC32
endif

ld_flags=-lmdl-to_string -lmdl-getdigit -lmdl-intlen
all:
	g++ -c -std=c++11 $(inc_flags) -D__$(arc) -o src/to_string.o src/to_string.cpp
	ar rcs lib/libmdl-to_string.a src/to_string.o

	cp src/to_string.hpp inc/mdl/to_string.hpp

	if [ $(no_binary) = false ]; then \
		g++ -std=c++11 $(inc_flags) $(lib_flags) -D__$(arc) -o bin/to_string to_string.cpp $(ld_flags);\
	fi;

install:
	cp lib/libmdl-to_string.a $(install_dir)/lib

	mkdir -p $(install_dir)/include/mdl
	cp src/to_string.hpp $(install_dir)/include/mdl
uninstall:
	rm -f $(install_dir)/lib/libmdl-to_string.a
	rm -rf $(install_dir)/include/mdl
clean:
	rm -f src/*.o
	rm -f lib/*.a
	rm -f inc/mdl/*.hpp
	rm -f bin/*

