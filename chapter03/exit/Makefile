.DEFAULT_GOAL := all

all: build link clean

build:
	@as ./enter_exit.s -o exit.o

link:
	@ld exit.o -o exit.bin

clean:
	@rm exit.o
