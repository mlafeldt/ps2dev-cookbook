maintainer        "Mathias Lafeldt"
maintainer_email  "mathias.lafeldt@gmail.com"
license           "Apache 2.0"
description       "Installs a full-fledged PS2 development environment"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"
recipe            "ps2dev::default", "Installs a full-fledged PS2 development environment"

%w(ubuntu debian).each do |os|
  supports os
end

%w(build-essential git).each do |cb|
  depends cb
end
