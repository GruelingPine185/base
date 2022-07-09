PROJECT =
PLATFORM =

INC_DIR = inc/$(PROJECT)
BIN_DIR = bin
SRC_DIR = src
LIB_DIR = lib
VND_DIR = vendor

INSTALL_DIR = /usr/local
INSTALL_INC_DIR = $(INSTALL_DIR)/include
INSTALL_LIB_DIR = $(INSTALL_DIR)/lib
LOCAL_DIR = $(PWD)
LIB_EXT =

CC =
C_STD = -std=c17
C_OPT = -O2
C_WARN = -Wall -Wextra -pedantic
CFLAGS = $(C_STD) $(C_OPT) $(C_WARN)
LDFLAGS =
INCLUDES = -I$(INC_DIR)


ifeq ($(OS),Windows_NT)
    PLATFORM = WINDOWS
	CC = gcc
	LIB_EXT = dll
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        PLATFORM = LINUX
		CC = gcc
		LIB_EXT = so
    endif
    ifeq ($(UNAME_S),Darwin)
        PLATFORM = OSX
		CC = clang
		LIB_EXT = dylib
    endif
endif

# 1: includes, 2: sources 3: library name 4: ldflags
define make_lib
	$(CC) $(CFLAGS) $(1) -fPIC -c $(2)
	mv *.o $(BIN_DIR)
	$(CC) $(CFLAGS) -shared $(BIN_DIR)/*.o -o $(3) $(4)
	mv $(3) $<
endef
