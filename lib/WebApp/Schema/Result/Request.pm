package WebApp::Schema::Result::Request;
use utf8;
use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("request");

__PACKAGE__->load_components("InflateColumn::DateTime");

__PACKAGE__->add_columns(
    "id",
    { data_type => "integer", is_auto_increment => 1 },
    "created",
    { data_type => "timestamp with time zone" },
    "parameters",
    { data_type => "jsonb" },
);

__PACKAGE__->set_primary_key("id");

1;

