use strict;
use Test::More;
use xt::CLI;
use Cwd;

{
    my $app = cli();

    $app->dir->touch("cpanfile", <<EOF);
requires 'HTML::Parser';
EOF

    $app->run("install");
    $app->run("tree");

    like $app->stdout, qr/^HTML::Parser \(HTML-Parser-/m;
    like $app->stdout, qr/^ HTML::Tagset \(HTML-Tagset-/m;
}

done_testing;



