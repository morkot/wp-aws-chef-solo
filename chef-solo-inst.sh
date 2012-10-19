#!/bin/bash -x

SOLODIR="/var/chef-solo"
CFGDIR="$SOLODIR/wp-aws-chef-solo"
#COOKBOOKDIR="$SOLODIR/cookbooks"

# install Chef 
rpm -ivh http://opscode-omnitruck-release.s3.amazonaws.com/el/6/x86_64/chef-10.14.4-2.el6.x86_64.rpm

#create dir and download cookbooks
mkdir "$SOLODIR"
cd "$SOLODIR"
git clone https://github.com/morkot/wp-aws-chef-solo
git clone https://github.com/morkot/cookbooks

#run chef-solo
chef-solo -c "$CFGDIR"/solo.rb -j "$CFGDIR"/node.json
