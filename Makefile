SHELL :=/bin/bash
DEF_INSTALL=/usr/local
INSTALL_DIR=$(DEF_INSTALL)

NO_BINARY=false
INC_DIR_NAME=include

GETDIGIT_INC=$(DEF_INSTALL)/$(INC_DIR_NAME)
GETDIGIT_LIB=$(DEF_INSTALL)/lib
INTLEN_INC=$(DEF_INSTALL)/$(INC_DIR_NAME)
INTLEN_LIB=$(DEF_INSTALL)/lib
MDLINT_INC=$(DEF_INSTALL)/$(INC_DIR_NAME)

INC=-Iinc -I$(MDLINT_INC) -I$(GETDIGIT_INC) -I$(INTLEN_INC)
LIB=-Llib -L$(GETDIGIT_LIB) -L$(INTLEN_LIB)
ARC=ARC32
LL=-lmdl-to_string -lmdl-getdigit -lmdl-intlen
all:
	g++ -c -std=c++11 $(INC) -D__$(ARC) -o src/to_string.o src/to_string.cpp
	ar rcs lib/libmdl-to_string.a src/to_string.o

	cp src/to_string.hpp inc/mdl/to_string.hpp

	if [ $(NO_BINARY) = false ]; then\
		g++ -std=c++11 $(INC) $(LIB) -D__$(ARC) -o bin/to_string to_string.cpp $(LL);\
	fi;

install:
	cp lib/libmdl-to_string.a $(INSTALL_DIR)/lib

	mkdir -p $(INSTALL_DIR)/$(INC_DIR_NAME)/mdl
	cp src/to_string.hpp $(INSTALL_DIR)/$(INC_DIR_NAME)/mdl
uninstall:
	rm -f $(INSTALL_DIR)/lib/libmdl-to_string.a
	rm -rf $(INSTALL_DIR)/$(INC_DIR_NAME)/mdl
clean:
	rm -f src/*.o
	rm -f lib/*.a
	rm -f inc/mdl/*.hpp
	rm -f bin/*

