package MojoX::Renderer::YAML;

use strict;
use warnings;

require YAML::Syck;

our $VERSION = '0.10';

sub build {
  shift;    # ignore
  my %opt = @_;

  return sub {
    my ($mojo, $ctx, $output) = @_;

    local $YAML::Syck::Headless        = $opt{Headless}        if exists $opt{Headless};
    local $YAML::Syck::SortKeys        = $opt{SortKeys}        if exists $opt{SortKeys};
    local $YAML::Syck::SingleQuote     = $opt{SingleQuote}     if exists $opt{SingleQuote};
    local $YAML::Syck::ImplicitTyping  = $opt{ImplicitTyping}  if exists $opt{ImplicitTyping};
    local $YAML::Syck::ImplicitUnicode = $opt{ImplicitUnicode} if exists $opt{ImplicitUnicode};
    local $YAML::Syck::ImplicitBinary  = $opt{ImplicitBinary}  if exists $opt{ImplicitBinary};
    local $YAML::Syck::UseCode         = $opt{UseCode}         if exists $opt{UseCode};
    local $YAML::Syck::LoadCode        = $opt{LoadCode}        if exists $opt{LoadCode};
    local $YAML::Syck::DumpCode        = $opt{DumpCode}        if exists $opt{DumpCode};

    $$output = YAML::Syck::Dump($ctx->stash->{result});

    return 1;
  };
}

1;

__END__

=encoding utf-8

=head1 NAME

MojoX::Renderer::YAML - YAML renderer for Mojo

=head1 SYNOPSIS

  use MojoX::Renderer::YAML;

  sub startup {
    my $self = shift;

    $self->types->type(yml => 'application/x-yaml');

    my $render = MojoX::Renderer::YAML->build(
      Headless => 1,
      SortKeys => 1,
    );

    $self->renderer->add_handler(yml => $render);
  }

=head1 DESCRIPTION

Once added this renderer will be called by L<MojoX::Renderer> for any given template
where the suffix of the specified template matches the suffix used in the C<add_handler>
method.

This renderer converts the C<result> element in the stash to YAML using the given options.
The template name is ignored.

=head1 METHODS

=head2 build

This method returns a handler for the Mojo renderer.

Supported parameters are names of variables used by L<YAML::Syck>. See L<YAML::Syck> for their definitions

=over 4

=item * Headless

=item * SortKeys

=item * SingleQuote

=item * ImplicitTyping

=item * ImplicitUnicode

=item * ImplicitBinary

=item * UseCode

=item * LoadCode

=item * DumpCode

=back

=head1 AUTHOR

Graham Barr <gbarr@cpan.org>

=head1 BUGS

Please report any bugs or feature requests to C<bug-mojox-renderer-yaml at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MojoX-Renderer-YAML>.
I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 SEE ALSO

L<YAML::Syck>, L<MojoX::Renderer>

=head1 COPYRIGHT & LICENSE

Copyright (C) 2008 Graham Barr

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
