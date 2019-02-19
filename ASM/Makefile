#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pguillie <pguillie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/02/19 15:52:54 by pguillie          #+#    #+#              #
#    Updated: 2019/02/19 15:53:30 by pguillie         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

ALL	= Colleen/Colleen Grace/Grace Sully/Sully

AS	= nasm
ASFLAGS	= -fmacho64

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
