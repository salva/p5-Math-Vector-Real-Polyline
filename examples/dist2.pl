#!/usr/bin/perl

use strict;
use warnings;

use Math::Vector::Real;
use Math::Vector::Real::Polyline;

my $p = Math::Vector::Real::Polyline->new([0, 0], [1, 0], [1, 1], [0.5, 1.5], [1, 1.8], [0, 1.7], [0, 0]);
my $q = Math::Vector::Real::Polyline->new([-2, 0], [-1,2], [3,2], [5, 5], [3, -1], [-1, 0]);

my $d2 = $p->dist2_to_polyline($q);

printf "Distance between %s and %s is %f\n", $p, $q, sqrt($d2);

