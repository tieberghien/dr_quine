COLLEEN = Colleen
GRACE = Grace

ASM = nasm
ASMFLAGS = -f macho64

all: $(COLLEEN) $(GRACE)

$(COLLEEN): Colleen.s
	$(ASM) $(ASMFLAGS) $^ 
	$(CC) -o $@ Colleen.o

$(GRACE): Grace.s
	$(ASM) $(ASMFLAGS) $^
	$(CC) -o $@ Grace.o

clean:
	rm -rf *.o #Grace_kid.s Sully_*

fclean: clean
	rm -rf $(COLLEEN)

re: fclean all
