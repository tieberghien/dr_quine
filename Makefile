COL_NAME = Colleen

CC	 = gcc
CFLAG	 = -Wall -Wextra -Werror

all: $(COL_NAME)

$(COL_NAME):
	$(CC) $(CFLAGS) C/Colleen.c -o $@

clean:
	rm -fv $(COL_NAME)

fclean: clean

re: fclean all

.PHONY: all, clean, fclean, re
