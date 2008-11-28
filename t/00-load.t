#!perl -T

use Test::More tests => 1;

BEGIN {
        use_ok( 'MojoX::Renderer::YAML' );
}

diag( "Testing MojoX::Renderer::YAML $MojoX::Renderer::YAML::VERSION, Perl $], $^X" );
