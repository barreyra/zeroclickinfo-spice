package DDG::Spice::PhishNet;
# ABSTRACT: Write an abstract here
# Start at https://duck.co/duckduckhack/spice_overview if you are new
# to instant answer development

use DDG::Spice;

# Caching - https://duck.co/duckduckhack/spice_advanced_backend#caching
spice is_cached => 1; 

# Metadata.  See https://duck.co/duckduckhack/metadata for help in filling out this section.
name "PhishNet";
source "http://phish.net";
icon_url "http://phish.net";
description "Retrieves setlist information from phish.net";
primary_example_queries "phish 1995-12-31";
secondary_example_queries "optional -- demonstrate any additional triggers";
# Uncomment and complete: https://duck.co/duckduckhack/metadata#category
category "entertainment";
# Uncomment and complete: https://duck.co/duckduckhack/metadata#topics
topics "music";
code_url "https://github.com/duckduckgo/zeroclickinfo-spice/blob/master/lib/DDG/Spice/PhishNet.pm";
attribution github => ["barreyra", "Bruno R. Barreyra"],
            twitter => "bbarreyra";

# API endpoint - https://duck.co/duckduckhack/spice_attributes#spice-codetocode
spice to => 'http://api.phish.net/api.js?api=2.0&method=pnet.shows.setlists.get&format=json&apikey=MYAPIKEY&showdate=$1&callback={{callback}}';

# Triggers - https://duck.co/duckduckhack/spice_triggers
triggers any => "phish";

# Handle statement
handle remainder => sub {

    print "Remainder is $_\n";
    # optional - regex guard
    # return unless qr/^\w+/;

    return unless $_;    # Guard against "no answer"

    return $_;
};

1;
