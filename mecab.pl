#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;

my @arr = <STDIN>;
my $form = {
        txt => join "", @arr,
};

my $ua = LWP::UserAgent->new;
my $res = $ua->post('http://oasob.com/tools/mecab/', $form);

if ($res->is_success) {
        print $1 if ($res->decoded_content =~ /<pre>(.*?)<\/pre>/gs);
}

