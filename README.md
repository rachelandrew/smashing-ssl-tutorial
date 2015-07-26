HTTPS with Nginx and Varnish tutorial
=============

A simple packaged Vagrant environment for my tutorial. Uses Varnish 4. This is the starting point configuration in order that readers can work through the process with me.

Uses hiera for the configuration so you just need to edit the Vagrantfile to get it running and then set up your sites in `puppet/manifests/hiera/config.yaml`. 

I'm using an Ubuntu base box, the Puppet manifests are for Debian or Ubuntu. If you want to edit the Varnish configuration the templates are in varnish/templates. You would need to run varnish provision after editing to reprovision the VM and apply your changes.

It's not amazingly robust, and I don't have a Windows machine to test on. So if you spot an obvious Windows issue let me know!

## To run this

You need [VirtualBox](https://www.virtualbox.org/) and [Vagrant](http://www.vagrantup.com/) installed.

Git clone this box.

Edit the Vagrantfile, set the webroot to be the folder in which individual site folders live. This will be mapped to `/var/www` on the guest

Use an IP address not on your network. You will need to edit your hosts file or other internal DNS to map site URLs to that IP address.

The rest of your config happens via Hiera. In `puppet/manifests/hiera/config.yaml` you can set up some sites, databases and specify PHP.ini values.

Put your site folders into the folder you specified in the Vagrantfile and set the docroot as `/var/www/foldername`

Save the config, run vagrant up.
