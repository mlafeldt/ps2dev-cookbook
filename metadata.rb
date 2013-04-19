name              "ps2dev"
maintainer        "Mathias Lafeldt"
maintainer_email  "mathias.lafeldt@gmail.com"
license           "Apache 2.0"
description       "Installs a full-fledged PS2 development environment"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.5"
recipe            "ps2dev::default", "Installs a full-fledged PS2 development environment"

supports "ubuntu"
supports "debian"

depends "build-essential"
depends "git"
