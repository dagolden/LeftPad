use 5.008001;
use strict;
use warnings;
use Test::More 0.96;
binmode( Test::More->builder->$_, ":utf8" )
  for qw/output failure_output todo_output/;

use LeftPad;

# from https://github.com/camwest/left-pad/blob/master/test.js as of 2016-04-23
is( leftpad( 'foo',    5 ), '  foo',  "foo, 5" );
is( leftpad( 'foobar', 6 ), 'foobar', "foobar, 6" );
is( leftpad( 1, 2, 0 ),   '01', "1,2,0" );
is( leftpad( 1, 2, '-' ), '-1', "1,2,-" );

# additional tests
is( leftpad( "foobar", 5 ), "foobar", "foobar, 5" );
is( leftpad( undef,    6 ), "      ", "<undef>,6" );
is( leftpad( undef, 6, "0" ), "000000", "<undef,6,0>" );
is( leftpad("foo"), "foo", "foo, <undef>" );

done_testing;
# COPYRIGHT
# vim: set ts=4 sts=4 sw=4 et tw=75:
