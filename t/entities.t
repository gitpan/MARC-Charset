use strict;
use warnings;

use Test::More qw(no_plan);
use Unicode::Normalize;
use MARC::Charset 'marc8_to_utf8';

sub entityize {
    my $stuff = NFC(shift);
    $stuff =~ s/([\x{0080}-\x{fffd}])/sprintf('&#x%X;',ord($1))/sgoe;
    return $stuff;
}

is( 
    entityize(marc8_to_utf8('fotografâias')), 
    'fotograf&#xED;as' , 'marc8_to_utf8'
);

