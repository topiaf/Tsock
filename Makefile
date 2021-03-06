#Creation de l'executable Tsock
DEBUG=
FORK=-DFORK
CFLAGS=-Wall -std=c99 ${DEBUG}
all : main.o Udp.o Tcp.o
	gcc ${CFLAGS} main.o Udp.o Tcp.o -o Tsock

#Creation des sous parties
main.o : main.c Udp.h Tcp.h Heads.h
	gcc -c ${CFLAGS} main.c -o main.o

Udp.o : Udp.c Udp.h Heads.h
	gcc -c ${CFLAGS} Udp.c -o Udp.o

Tcp.o : Tcp.c Tcp.h Heads.h
	gcc -c ${CFLAGS} ${FORK} Tcp.c -o Tcp.o

#Suppression des fichiers temporaires
clean:
	rm -rf *.o

#Suppression de tous les fichiers, sauf les sources,
#en vue d'une reconstruction  complète

mrpropre: clean
	rm -rf Tsock
	

