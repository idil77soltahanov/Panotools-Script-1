#!/usr/bin/perl
#Editor vim:syn=perl

use strict;
use warnings;
use Test::More 'no_plan';
use Math::Trig;
use lib 'lib';

use Panotools::Matrix qw(rollpitchyaw2matrix matrix2rollpitchyaw);

# 0, 45, 0
my $pitch45 = rollpitchyaw2matrix (map (deg2rad ($_),(0, -45, 0)));

# 5, -5, 10
my $foo = rollpitchyaw2matrix (map (deg2rad ($_),(5, -5, 10)));

my $result = $pitch45->multiply ($foo);

my @rpy = matrix2rollpitchyaw ($result);

@rpy = map (rad2deg ($_), @rpy);

like ($rpy[0], '/-5.79921896/');
like ($rpy[1], '/-49.0553302/');
like ($rpy[2], '/15.3057553/');

