use Test::More;
use Test::Exception;
use Data::Dumper;
use PGObject::Util::Replication::SMO;

plan skip_all => 'DB_TESTING not set' unless $ENV{DB_TESTING};
plan tests => 3;

my $master = PGObject::Util::Replication::SMO->new();
my $pmaster = PGObject::Util::Replication::SMO->new(persist_connect => 1);

my $badmaster = PGObject::Util::Replication::SMO->new(port => 5433);

=head1 TOPIC

Replication database connection testing

=head1 GUARANTEES

=head2 Can get connection

=cut

ok($master->connect(), 'got a connection');

=head3 same connection if persistence is enabled.

=cut

is($pmaster->connect(), $pmaster->connect(), 'got a persistent connection');

=head3 from non-recovering database

=cut

=head3 Superuser and replica role testing

=cut

lives_ok { $master->can_manage } 'We can determine if we can manage the db';

