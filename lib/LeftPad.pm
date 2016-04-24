use 5.008001;
use strict;
use warnings;

package LeftPad;
# ABSTRACT: Why should Node.js have all the fun?

our $VERSION = '0.004';

use base 'Exporter';
our @EXPORT = qw/leftpad/;

=func leftpad

    $string = leftpad( $string, $min_length );
    $string = leftpad( $string, $min_length, $pad_char );

Returns a copy of the input string with left padding if the input string
length is less than the minimum length.  It pads with spaces unless given a
pad character as a third argument.

Zero or negative minimum length returns the input string.  Only the first
character in the pad-character string is used.  Undefined warnings are
suppressed so an undefined input string is treated as an empty string.

=cut

sub leftpad {
    no warnings 'uninitialized';
    return "" . $_[0] if $_[1] < 1;
    return sprintf( "%*s", $_[1], $_[0] ) unless defined $_[2] && length $_[2];
    return substr( $_[2], 0, 1 ) x ( $_[1] - length $_[0] ) . $_[0];
}

1;

=head1 SYNOPSIS

    use LeftPad;

    $string = leftpad( $string, $min_length );
    $string = leftpad( $string, $min_length, $pad_char );

=head1 DESCRIPTION

This module provides left padding, just like you'd find for Node.js.

=head1 STABILITY

So that people may depend on this module for their production code,
the author commits to never delete it from CPAN.

=head1 SEE ALSO

=for :list
* L<String::Pad>
* L<Text::Padding>

=cut

# vim: ts=4 sts=4 sw=4 et tw=75:
