package WebApp::Controller::Root;
use utf8;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use JSON;
use Try::Tiny;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(
    namespace => '',
);


sub logger : Path('/logger.png') {
    my ( $self, $c ) = @_;
    if (my $params = $c->req->query_parameters) {
        $c->model("DB::Request")->create({
            created => \'NOW()',
            parameters => to_json($params),
        });
    }
    $c->serve_static_file("root/assets/img/empty.png");
}

sub default : Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

__PACKAGE__->meta->make_immutable;

1;
