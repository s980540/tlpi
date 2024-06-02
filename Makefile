# Project: tlpi
# Makefile created by Steve Chang
# Date modified: 2024.06.02

BINNAME = tomato
PROJDIR = $(CURDIR)
SRCDIR = $(PROJDIR)/src
LIBDIR = $(PROJDIR)/lib
BINDIR = $(PROJDIR)/bin

SUBDIR = \
	src \
	src/crc \

COMMON_INCLUDE = \
	$(CURDIR)/include \

EXTERN_LIBDIR = \

EXTERN_INCLUDE = \

CC = gcc
AR = ar
LD = ld

MAKE_RULES := $(PROJDIR)/make/make_rules.mk

LDFLAGS = \
	$(addprefix -L,$(EXTERN_LIBDIR)) \
	$(addprefix -L,$(LIBDIR)) \

LIBS = \
	main \
	crc \

LDLIBS = $(foreach lib,$(LIBS),-l$(lib)) -lpthread

export BINNAME
export PROJDIR
export SRCDIR
export LIBDIR
export BINDIR
export COMMON_INCLUDE
export EXTERN_LIBDIR
export EXTERN_INCLUDE
export CC AR
export MAKE_RULES

.PHONY: all
all:
	mkdir -p $(BINDIR)
	mkdir -p $(LIBDIR)
	for dir in $(SUBDIR); do \
		cd $$dir; \
		make $@; \
		cd $(CURDIR); \
	done
	$(CC) $(LDFLAGS) $(LDLIBS) -o $(BINDIR)/$(BINNAME)

.PHONY: clean
clean:
	rm -f $(BINDIR)/$(BINNAME)
	rm -f $(LIBDIR)/*
	for dir in $(SUBDIR); do \
		cd $$dir; \
		make -j $@; \
		cd $(CURDIR); \
	done

.PHONY: objall
objall:
	for dir in $(SUBDIR); do \
		cd $$dir; \
		make -j $@; \
		cd $(CURDIR); \
	done

.PHONY: objclean
objclean:
	for dir in $(SUBDIR); do \
		cd $$dir; \
		make -j $@; \
		cd $(CURDIR); \
	done

.PHONY: depall
depall:
	for dir in $(SUBDIR); do \
		cd $$dir; \
		make -j $@; \
		cd $(CURDIR); \
	done

.PHONY: depclean
depclean:
	for dir in $(SUBDIR); do \
		cd $$dir; \
		make -j $@; \
		cd $(CURDIR); \
	done
