# Makefile for building dserve, dservehttps and nsmeasure
#
# dserve: database http tool as a standalone http server or cgi
# dservehttps: database https tool as a standalone https server or cgi
# nsmeasure: utility for speed testing the server over http
#
# This makefile assumes you have built and installed the whitedb library.
#
# Alternatively compile directly against the whitedb library as:
# 
# gcc dserve.c dserve_util.c dserve_net.c  -o dserve -O2 -lwgdb -lpthread
# gcc -DUSE_OPENSSL dserve.c dserve_util.c dserve_net.c  -o dservehttps -O2 -lwgdb -lpthread -lssl -lcrypto
# gcc nsmeasure.c -o nsmeasure -O2 -lpthread
#
# or use compile.sh directly against the whitedb source without building a library first.
#
# dserve can be also compiled to work as a cgi or command line tool only
# without using pthreads by:
# - removing #define SERVEROPTION from dserve.h
# - compiling by gcc dserve.c dserve_util.c -o dserve -O2 -lwgdb 
#
# Compiling under windows:
# copy the files dbapi.h and wgdb.lib into the same folder where you compile, then build
# server version:
# cl /Ox /I"." Server\dserve.c Server\dserve_util.c Server\dserve_net.c wgdb.lib
# cl /Ox /I"." Server\dserve.c Server\dserve_util.c wgdb.lib
# or a non-server version

 

CFLAGS = -O2 -c
CFLAGSHTTPS = -O2 -DUSE_OPENSSL -Wall -c
CC = gcc

all: dserve dservehttps nsmeasure

dserve: dserve.o dserve_util.o dserve_net.o yajl_all.o
	$(CC) dserve.o dserve_net.o dserve_util.o yajl_all.o -o dserve -lpthread -lwgdb

dservehttps: dservehttps.o dserve_utilhttps.o dserve_nethttps.o yajl_all.o
	$(CC) dservehttps.o dserve_nethttps.o dserve_utilhttps.o yajl_all.o -o dservehttps -lpthread -lwgdb -lssl -lcrypto

nsmeasure: nsmeasure.o
	$(CC) nsmeasure.o -o nsmeasure -lpthread

dserve.o: dserve.h dserve.c
	$(CC) $(CFLAGS) dserve.c

dservehttps.o: dserve.h dserve.c
	$(CC) $(CFLAGSHTTPS) dserve.c -o dservehttps.o

dserve_net.o: dserve.h dserve_net.c
	$(CC) $(CFLAGS) dserve_net.c

dserve_nethttps.o: dserve.h dserve_net.c
	$(CC) $(CFLAGSHTTPS) dserve_net.c -o dserve_nethttps.o
  
dserve_util.o: dserve.h dserve_util.c
	$(CC) $(CFLAGS) dserve_util.c 

dserve_utilhttps.o: dserve.h dserve_util.c
	$(CC) $(CFLAGSHTTPS) dserve_util.c -o dserve_utilhttps.o 

yajl_all.o: ../json/yajl_all.h ../json/yajl_all.c
	$(CC) $(CFLAGS) ../json/yajl_all.c -o yajl_all.o

nsmeasure.o: nsmeasure.c
	$(CC) $(CFLAGS) nsmeasure.c

clean: nsmeasure.c
	rm *.o *dserve dservehttps nsmeasure *.gch 

