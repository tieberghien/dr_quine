COL_NAME	= Colleen
GRA_NAME	= Grace

CC		= gcc
CFLAG		= -Wall -Wextra -Werror

C_SRC		= C

all: $(COL_NAME) $(GRA_NAME)

$(COL_NAME):
	$(CC) $(CFLAGS) $(C_SRC) -o $@

clean:
	rm -fv $(COL_NAME) $(GRA_NAME)

fclean: clean

re: fclean all

.PHONY: all, clean, fclean, re
