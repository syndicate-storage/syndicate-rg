# build environment
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
BUILD    ?= $(ROOT_DIR)/build/out
DISTRO   ?= DEBIAN
BUILD_BINDIR := $(BUILD)/bin
BUILD_LIBDIR := $(BUILD)/lib
BUILD_LIBEXEC_DIR := $(BUILD)/lib/syndicate
BUILD_INCLUDEDIR := $(BUILD)/include/

# install environment
DESTDIR        ?=
PREFIX         ?= /usr/local
BINDIR         ?= $(DESTDIR)$(PREFIX)/bin
LIBDIR         ?= $(DESTDIR)$(PREFIX)/lib
LIBEXECDIR     ?= $(DESTDIR)$(PREFIX)/lib/syndicate
INCLUDEDIR     ?= $(DESTDIR)$(PREFIX)/include
PKGCONFIGDIR   ?= $(DESTDIR)$(PREFIX)/lib/pkgconfig

# replica gateway
BUILD_RG    := $(BUILD_BINDIR)
BUILD_RG_DIRS     := $(BUILD_RG)

# compiler
CPPFLAGS := -std=c++11 -Wall -g -fPIC -fstack-protector -fstack-protector-all -pthread
CPP      := c++ $(CPPFLAGS)
INC      := -I. -I$(ROOT_DIR)
DEFS     := -D_THREAD_SAFE -D__STDC_FORMAT_MACROS -D_DISTRO_$(DISTRO)
LIBINC   := -L$(BUILD_LIBDIR)

# build setup
BUILD_DIRS   := $(BUILD_RG_DIRS)

# misc
ifeq ($(DISTRO),DEBIAN)
   LIBJSON ?= json-c
else
   LIBJSON ?= json
endif

all:

build_setup: $(BUILD_DIRS)

$(BUILD_DIRS):
	@mkdir -p $@

# debugging...
print-%: ; @echo $*=$($*)
