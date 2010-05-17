package Dist::Zilla::Plugin::Mercurial::Check;

use strict;
use warnings;

use Moose;

with 'Dist::Zilla::Role::BeforeRelease';

sub before_release {
    my $self = shift;

    my $branch = `hg branch`;
    chomp $branch;

    if ( my @output = `hg status` ) {
        my $errmsg
            = "This branch ($branch) has some files that are not yet committed:\n"
            . join q{}, map {"\t$_"} @output;
        $self->log_fatal($errmsg);
    }

    $self->log("This branch ($branch) is in a clean state");
}

no Moose;

__PACKAGE__->meta()->make_immutable();

1;

# ABSTRACT: Check for modified/removed/unknown files

__END__

=for Pod::Coverage
    before_release

=head1 SYNOPSIS

In your F<dist.ini>:

  [Mercurial::Check]

=head1 DESCRIPTION

This plugin checks that your working copy is in a clean state before
releasing. This means that C<hg status> returns no output.

=cut
