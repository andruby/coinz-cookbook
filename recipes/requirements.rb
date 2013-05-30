# Recipe that install all requirements

# Update apt-get
include_recipe "apt"

#
# Ruby 2.0
#
include_recipe "ruby_build"
ruby_build_ruby "2.0.0-p195"

#
# Postgresql
#
include_recipe "postgresql"
