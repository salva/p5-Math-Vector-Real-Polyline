package Math::Vector::Real::Polyline;

use strict;
use warnings;

use Math::Vector::Real;

sub new {
    my $class = shift;
    my $self = [map V($_), @_];
    bless $self, $class;
}

sub dist2_to_point {
    my $self = shift;
    my $p = V(shift);
    return unless @$self;
    my $min_d2 = $self->[0]->dist2($p);

    for my $i (1..$#$self) {
        my $d2 = $p->dist2_to_segment($self->[$i-1], $self->[$i]);
        $min_d2 = $d2 if $d2 < $min_d2;
    }

    $min_d2;
}

sub _dist2_to_polyline_brute_force {
    my ($self, $other, $min_d2) = @_;

    for my $i (1..$#$self) {
        for my $j (1..$#other) {
            my $d2 = Math::Vector::Real->dist2_between_segments($self->[$i-1], $self->[$i],
                                                                $other->[$j-1], $other->[$j]);
            $min_d2 = $d2 if $d2 < $min_d2;
        }
    }
    return $min_d2;
}

my $cutoff = 1;

sub dist2_to_polyline {
    my $self = shift;
    my $other = shift;
    return unless @$self and @$other;
    return $other->dist2_to_point($self->[0]) if @$self == 1;
    return $self->dist2_to_point($other->[0]) if @$other == 1;

    my $min_d2 = $self->[0]->dist2($other->[0]);
    my @queue = [$self, $other, 0];

    while (@queue) {
        my ($a, $b, $bb_d2) = @{pop @queue};
        last if $bb_d2 >= $min_d2;

        if (@$self <= $cutoff or @$other <= $cutoff) {
            $min_d2 = _dist2_to_polyline_brute_force($self, $other, $min_d2);
        }
        else {
            
        }
    }

    my $a0 = Math::Vector::Real::Polyline->new(

    my @self_bb, $self_bb_1) = Math::Vector::Real->box(@$self);
    my ($other_bb_0, $other
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Math::Vector::Real::Polyline - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Math::Vector::Real::Polyline;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Math::Vector::Real::Polyline, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Salvador Fandiño, E<lt>salva@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2017 by Salvador Fandiño

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.24.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
