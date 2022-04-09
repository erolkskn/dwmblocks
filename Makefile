PREFIX  := /usr/local
CC      := cc
CFLAGS  := -pedantic -Wall -Wno-deprecated-declarations -Os
LDFLAGS := -lX11

SCRIPTS_DIR := scripts

# FreeBSD (uncomment)
#LDFLAGS += -L/usr/local/lib -I/usr/local/include
# # OpenBSD (uncomment)
#LDFLAGS += -L/usr/X11R6/lib -I/usr/X11R6/include

all: options dwmblocks check_scripts

options:
	@echo dwmblocks build options:
	@echo "CFLAGS  = ${CFLAGS}"
	@echo "LDFLAGS = ${LDFLAGS}"
	@echo "CC      = ${CC}"

dwmblocks: dwmblocks.c blocks.def.h blocks.h
	${CC} -o dwmblocks dwmblocks.c ${CFLAGS} ${LDFLAGS}

blocks.h:
	cp blocks.def.h $@

clean:
	rm -f *.o *.gch dwmblocks

check_scripts:
	shellcheck ${SCRIPTS_DIR}/*.sh

install: dwmblocks
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f dwmblocks ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/dwmblocks
	chmod 755 scripts/*
	cp ${SCRIPTS_DIR}/*.sh ${DESTDIR}${PREFIX}/bin

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/dwmblocks

.PHONY: all options clean install uninstall check_scripts
