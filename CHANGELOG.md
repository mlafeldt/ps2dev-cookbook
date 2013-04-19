1.0.5 (Apr 19 2013)
-------------------

Take over changes from [skeleton cookbook](https://github.com/mlafeldt/skeleton-cookbook):

* Update gem dependencies (berkshelf 1.4, foodcritic 2.0, chef 10.24).
* Remove Vagrant from gems; get it from http://downloads.vagrantup.com/.
* Update Vagrantfile to v2 syntax and enable the _vagrant-berkshelf_ plugin.
* Add new tasks to Rakefile, e.g. `clobber` and `test:integration`. Replace
  `COOKBOOKS_PATH` with `FIXTURES_PATH` which defaults to _fixtures_.
* Let Travis run tests against Ruby 2.0.0.
* Add this CHANGELOG file.


1.0.0 (Sep 18 2012)
-------------------

* First tagged version.
