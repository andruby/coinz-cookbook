name             "coinz"
maintainer       "Andrew Fecheyr"
maintainer_email "andrew@bedesign.be"
license          "All rights reserved"
description      "Installs/Configures coinz"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "ruby_build", "~> 0.8.0"
depends "postgresql", "~> 3.0.0"
depends "apt", "~> 1.10.0"
depends "database", "~> 1.4.0"

supports "ubuntu"