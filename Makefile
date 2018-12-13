COL_NAME	= Colleen
GRA_NAME	= Grace
SUL_NAME	= Sully

CC			= gcc
CFLAG		= -Wall -Wextra -Werror

C_SRC		= C

all: $(COL_NAME) $(GRA_NAME) $(SUL_NAME)

$(COL_NAME):
	$(CC) $(CFLAGS) $(C_SRC)/Colleen.c -o $@

$(GRA_NAME):
	$(CC) $(CFLAGS) $(C_SRC)/Grace.c -o $@

$(SUL_NAME):
	$(CC) $(CFLAGS) $(C_SRC)/Sully.c -o $@

clean:
	rm -fv $(COL_NAME) $(GRA_NAME) $(SUL_NAME)
	rm -rf %.o Grace_kid.c Sully_0 Sully_1 Sully_2 Sully_3 Sully_4 Sully_5 Sully_0.c Sully_1.c Sully_2.c Sully_3.c Sully_4.c Sully_5.c

fclean: clean

re: fclean all

.PHONY: all, clean, fclean, re
