# ************************************************************************* 
# Copyright (c) 2014, SUSE LLC
# 
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
# 
# 3. Neither the name of SUSE LLC nor the names of its contributors may be
# used to endorse or promote products derived from this software without
# specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
# ************************************************************************* 

# ------------------------
# Model module
# ------------------------

package App::Dochazka;

use 5.012;
use strict;
use warnings;

use Exporter 'import';
use Time::Piece;
use Time::Seconds;



=head1 NAME

App::Dochazka - Dochazka Attendance and Time Tracking System shared modules




=head1 VERSION

Version 0.189

=cut

our $VERSION = '0.189';




=head1 DESCRIPTION

This distro contains modules that are used by both the server
L<App::Dochazka::REST> and the command-line client L<App::Dochazka::CLI>.

=cut



=head1 PACKAGE VARIABLES AND EXPORTS

=cut

our ( $t, $today, $yesterday, $tomorrow );

our @EXPORT_OK = qw( 
    $t
    $today
    $yesterday
    $tomorrow
    init_timepiece
);



=head1 FUNCTIONS


=head2 init_timepiece

(Re-)initialize the date/time-related package variables

=cut

sub init_timepiece {
    #print "Entering " . __PACKAGE__ . "::init_timepiece\n";
    $t = localtime;
    $today = $t->ymd;
    $yesterday = ($t - ONE_DAY)->ymd;
    $tomorrow = ($t + ONE_DAY)->ymd;
}


1;


