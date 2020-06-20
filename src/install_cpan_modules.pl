#!/usr/bin/env perl

my @modules = (
    # Required modules
    "LWP::UserAgent",
    "Tk",
    "Tk::ToolBar",
    # Optional but recommended modules
    "Text::LevenshteinXS",
    "File::Which",
    "Image::Size",
    "LWP::Protocol::https",  # needed for update checking
);

foreach my $module (@modules) {
    system("cpanm --notest --install $module") == 0
        or die("Failed trying to install $module\n");
}