package List::Slice;
# ABSTRACT: Slice-like operations on lists

use strict; use warnings;
require Exporter;

our @ISA        = qw(Exporter);
our @EXPORT_OK  = qw( head tail );

require XSLoader;
XSLoader::load('List::Slice', $List::Slice::VERSION);

1;

__END__

=head1 SYNOPSIS

    use List::Slice qw( head tail );

=head1 DESCRIPTION

This module provides functions for slicing lists. This is helpful when you
want to do a chain of manipulations on a list (map, grep, sort) and then
slice, without the cumbersome C<(...)[x]> syntax.

=cut

=head1 FUNCTIONS

=head2 head

    my @values = head $size, @list;

Returns the first C<$size> elements from C<@list>. If C<$size> is negative, returns
all but the last C<$size> elements from C<@list>.

    @result = head 2, qw( foo bar baz );
    # foo, bar

    @result = head -2, qw( foo bar baz );
    # foo

=head2 tail

    my @values = tail $size, @list;

Returns the last C<$size> elements from C<@list>. If C<$size> is negative, returns
all but the first C<$size> elements from C<@list>.

    @result = tail 2, qw( foo bar baz );
    # bar, baz

    @result = tail -2, qw( foo bar baz );
    # baz

=head1 SEE ALSO

L<List::Util>, L<List::MoreUtils>, L<List::UtilsBy>
