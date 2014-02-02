PS2 Development Cookbook
========================

This cookbook installs a full-fledged PS2 development environment.

Requirements
------------

### Platform:

* Ubuntu
* Debian

### Cookbooks:

* build-essential
* git

Recipes
-------

### ps2dev::default

Installs a full-fledged PS2 development environment which will include:

- ee-gcc
- iop-gcc
- ps2client
- homebrew PS2 SDK

Testing
-------

[![Build Status](https://travis-ci.org/mlafeldt/ps2dev-cookbook.png?branch=master)](https://travis-ci.org/mlafeldt/ps2dev-cookbook)

The cookbook provides the following Rake tasks for testing:

    rake foodcritic                   # Lint Chef cookbooks
    rake integration                  # Alias for kitchen:all
    rake kitchen:all                  # Run all test instances
    rake kitchen:default-ubuntu-1004  # Run default-ubuntu-1004 test instance
    rake rubocop                      # Run RuboCop style and lint checks
    rake spec                         # Run ChefSpec examples
    rake test                         # Run all tests

License and Author
------------------

Author:: Mathias Lafeldt (<mathias.lafeldt@gmail.com>)

Copyright:: 2012-2013, Mathias Lafeldt

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Contributing
------------

We welcome contributed improvements and bug fixes via the usual workflow:

1. Fork this repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request
