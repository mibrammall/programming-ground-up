.DEFAULT_GOAL := all

all: build link clean run

build:
	@as ./max.s -o out.o

link:
	@ld out.o -o out.bin

clean:
	@rm out.o

run:
	@./out.bin

