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
    my $params ||= $c->req->data || $c->req->params;
    my $requests = $c->model('DB::Request');

    $requests = $requests->search(undef,{
        order_by => [
            { '-DESC' => 'created' }
        ],
        page => $params->{'page'} || 1,
        rows => $params->{'rows'} || 50,
    });
    my @requests_data;
    for my $request ($requests->all) {
        push @requests_data, {
            requested => $request->created->strftime('%Y-%m-%dT%H:%M:%S%z'),
            parameters => from_json($request->parameters),
        };
    }
    $self->status_ok( $c, entity => {
        requests => \@requests_data,
        pager => {
            current_page => $requests->pager->current_page+0,
            total_entries => $requests->pager->total_entries+0,
            entries_per_page => $requests->pager->entries_per_page+0,
        }
    });
}

__PACKAGE__->meta->make_immutable;

1;
