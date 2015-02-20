package WebApp::Controller::REST;
use Moose;
use namespace::autoclean;
use utf8;
use JSON qw(encode_json decode_json from_json);
use Data::Dumper;

BEGIN { extends 'Catalyst::Controller::REST' }
__PACKAGE__->config(
    default => 'application/json',
    map => { 'application/javascript' => 'JSONP' }
);

sub request : Local : ActionClass("REST") {
}

sub request_GET {
    my ($self, $c) = @_;
    my @requests;
    for my $request ($c->model('DB::Request')->all) {
        push @requests, {
            requested => $request->created->strftime('%Y-%m-%dT%H:%M:%S%z'),
            parameters => from_json($request->parameters),
        };
    }
    $self->status_ok( $c, entity => {
        requests => \@requests,
    });
}

__PACKAGE__->meta->make_immutable;

1;
