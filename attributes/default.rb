override['glusterfs']['yum']['baseurl'] = 'http://download.gluster.org/pub/gluster/glusterfs/3.7/LATEST/EPEL.repo/epel-$releasever/$basearch/'
override['glusterfs']['client']['version'] = nil

default['sandy']['storage']['volumes'] = {}