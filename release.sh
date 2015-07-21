#!/bin/bash
perl Build.PL
./Build clean
perl Build.PL
./Build distmeta
./Build distclean
./Build dist
( cd ~/home:smithfarm/perl-App-Dochazka-Common/ ; oosc rm App-Dochazka-Common-*.tar.gz )
cp App-Dochazka-Common-*.tar.gz ~/home:smithfarm/perl-App-Dochazka-Common
( cd ~/home:smithfarm/perl-App-Dochazka-Common/ ; oosc service dr ; oosc add App-Dochazka-Common-*.tar.gz ; oosc ci )
