package Dist::Zilla::Plugin::Mercurial::Push;

use strict;
use warnings;
use autodie qw( :all );

use Moose;

with 'Dist::Zilla::Role::AfterRelease';

sub after_release {
    my $self = shift;

    system( 'hg push' );
}

no Moose;

__PACKAGE__->meta()->make_immutable();

1;

# ABSTRACT: Push the current Mercurial branch

__END__

=for Pod::Coverage
    after_release

=head1 SYNOPSIS

In your F<dist.ini>:

  [Mercurial::Push]

=head1 DESCRIPTION

Once the release is done, this plugin will push current Mercurial branch.

=cut
