# -*- perl -*-

use inc::Module::Install;

perl_version    5.008008;

module_name     'MojoX::Renderer::YAML';
all_from        'lib/MojoX/Renderer/YAML.pm';

resources  repository  => 'http://git.goingon.net/?p=MojoX-Renderer-YAML.git';

requires        'YAML::Syck';

auto_install;

WriteAll(
  sign => 1
);
