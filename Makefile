COL_NAME	= Colleen
GRA_NAME	= Grace
SUL_NAME	= Sully

CC		= gcc
CFLAG		= -Wall -Wextra -Werror

C_SRC		= C

all: $(COL_NAME) $(GRA_NAME) $(SUL_NAME)

$(COL_NAME): Colleen.o
	$(CC) $(CFLAGS) $(C_SRC)/Colleen.c -o $@

$(GRA_NAME): Grace.o
         $(CC) $(CFLAGS) $(C_SRC)/Grace.c -o $@

$(SUL_NAME): Sully.o
         $(CC) $(CFLAGS) $(C_SRC)/Sully.c -o $@

clean:
	rm -fv $(COL_NAME) $(GRA_NAME) $(SUL_NAME)

fclean: clean

re: fclean all

.PHONY: all, clean, fclean, re
