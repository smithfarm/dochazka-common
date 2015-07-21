#!/bin/bash
CPAN_NAME='App-Dochazka-Common'
OBS_NAME='perl-App-Dochazka-Common'
OBS_DIR="~/home:smithfarm/$OBS_NAME/"
perl Build.PL
./Build distmeta
./Build dist
( cd $OBS_DIR ; osc rm $CPAN_NAME-*.tar.gz )
cp $CPAN_NAME-*.tar.gz $OBS_DIR
./Build distclean
( cd $OBS_DIR ; osc service dr ; osc add $CPAN_NAME-*.tar.gz ; osc -A https://api.opensuse.org/ commit )
