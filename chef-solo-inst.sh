#!/bin/bash -x

#writing logs
LOGS="/root/post-install.$(date -I)"
exec > $LOGS 2>&1

SOLODIR="/var/chef-solo"
CFGDIR="$SOLODIR/wp-aws-chef-solo"

# install Chef 
rpm -ivh http://opscode-omnitruck-release.s3.amazonaws.com/el/6/x86_64/chef-10.14.4-2.el6.x86_64.rpm

# install git
yum -y install git

#create dir and download cookbooks
mkdir "$SOLODIR"
cd "$SOLODIR"
git clone https://github.com/morkot/wp-aws-chef-solo
git clone https://github.com/morkot/cookbooks

#run chef-solo
chef-solo -c "$CFGDIR"/solo.rb -j "$CFGDIR"/node.json
