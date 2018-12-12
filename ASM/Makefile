ASM = nasm
ASMFLAGS = -f macho64
COLLEEN = Colleen

all: $(COLLEEN)

$(COLLEEN): Colleen.s
	$(ASM) $(ASMFLAGS) $^ 
	$(CC) -o $@ Colleen.o

clean:
	rm -rf *.o #Grace_kid.s Sully_*

fclean: clean
	rm -rf $(COLLEEN)

re: fclean all
