package Dist::Zilla::PluginBundle::Mercurial;

use strict;
use warnings;

use Moose;

with 'Dist::Zilla::Role::PluginBundle';

my @names   = qw{ Check Tag Push };

sub bundle_config {
    my $self = shift;
    my $section = shift;

    my @config;

    for my $name (@names) {
        my $class = "Dist::Zilla::Plugin::Mercurial::$name";

        push @config, [ "$section->{name}/$name" => $class => {} ];
    }

    return @config;
}

no Moose;

__PACKAGE__->meta->make_immutable;

1;

# ABSTRACT: Bundles the Mercurial Check, Tag, and Push plugins

__END__

=for Pod::Coverage
    bundle_config

=head1 SYNOPSIS

In your F<dist.ini>:

  [@Mercurial]

=head1 DESCRIPTION

This is a plugin bundle to load all git plugins. It is equivalent to:

  [Mercurial::Check]
  [Mercurial::Tag]
  [Mercurial::Push]

