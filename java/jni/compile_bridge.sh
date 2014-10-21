#!/bin/sh
#
[ "X${JAVA_HOME}" = "X" ] && JAVA_HOME=/usr/lib/jvm/java-6-openjdk
#DBDIR=../../../Db

# run unite.sh if needed
if [ ! -f ../../whitedb.c ]; then
  cd ../..; ./unite.sh; cd -
fi

cd library
gcc  -O2 -lm -fPIC -shared -I${JAVA_HOME}/include -I../../.. \
  ../src/native/whitedbDriver.c ../../../whitedb.c -o libwhitedbDriver.so

#gcc  -O2 -lm -fPIC -shared -I${JAVA_HOME}/include ../src/native/whitedbDriver.c ${DBDIR}/dbmem.c ${DBDIR}/dballoc.c ${DBDIR}/dbdata.c ${DBDIR}/dblock.c ${DBDIR}/dbindex.c ${DBDIR}/dblog.c ${DBDIR}/dbhash.c ${DBDIR}/dbcompare.c ${DBDIR}/dbquery.c ${DBDIR}/dbutil.c ${DBDIR}/dbmpool.c ${DBDIR}/dbschema.c ${DBDIR}/dbjson.c ${DBDIR}/../json/yajl_all.c -o libwhitedbDriver.so

