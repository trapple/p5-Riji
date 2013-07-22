package Riji::Model::BlogSetting;
use strict;
use warnings;
use utf8;

use Git::Repository 'FileHistory';
use Path::Tiny;

sub new {
    my ($class, %args) = @_;
    bless {%args}, $class;
}

sub base_dir { shift->{base_dir} }
sub fqdn     { shift->{fqdn}   }
sub url_root { "http://@{[shift->fqdn]}/" }
sub author   { shift->{author}   }
sub title    { shift->{title}    }
sub mkdn_dir { shift->{mkdn_dir} }

sub mkdn_path {
    my $self = shift;
    $self->{mkdn_path} //= path($self->base_dir, $self->mkdn_dir);
}

sub repo {
    my $self = shift;
    $self->{repo} //= Git::Repository->new(work_tree => $self->base_dir);
}

1;