use v5.24.0;

package Synergy::ReplyChannel;

use Moose;
use namespace::autoclean;

use experimental qw(signatures);

my $i = 0;

has [ qw(public_address private_address) ] => (
  is  => 'ro',
  isa => 'Defined',
  weak_ref => 1,
  required => 1,
);

has channel => (
  is    => 'ro',
  does  => 'Synergy::Role::Channel',
  required => 1,
);

sub reply ($self, $text) {
  return $self->channel->send_text($self->public_address, $text);
}

1;
