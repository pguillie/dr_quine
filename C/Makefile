#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pguillie <pguillie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/02/19 15:39:06 by pguillie          #+#    #+#              #
#    Updated: 2019/02/19 15:52:05 by pguillie         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

ALL	= Colleen/Colleen Grace/Grace Sully/Sully

CC	= gcc
CFLAGS	= -Wall -Wextra -Werror

OBJECTS	= Colleen/Colleen.o Grace/Grace.o Sully/Sully.o

.PHONY: all clean fclean re

all: $(ALL)

Colleen: Colleen.o
	$(CC) -o $@ $<

Grace: Grace.o
	$(CC) -o $@ $<

Sully: Sully.o
	$(CC) -o $@ $<

$(OBJECTS): Makefile

clean:
	rm -f $(OBJECTS)

fclean: clean
	rm -f $(ALL)

re: fclean all
