
### Provides

Auto discovery from `domains.txt`.
###### Items prototypes
* **ssl ttl for {#DOMAIN}** - number of days before the expiration date

###### Trigger prototypes
* **low or bad ttl for ssl certificate for {#DOMAIN}** - expires in 7 days or less or error in fetching

___

### Installation

``` bash
cd /opt
git clone https://github.com/altuhovsu/https-ssl-cert-check-zabbix
echo "google.com:143/imap" > https-ssl-cert-check-zabbix/domains.txt # add some domains and ports/protocol
echo "google.com:443" > https-ssl-cert-check-zabbix/domains.txt # add some domains and ports/protocol
chown -R zabbix:zabbix https-ssl-cert-check-zabbix
cp userparameter_zabbix_https_checker.conf /etc/zabbix/zabbix_agent2.d/userparameter_zabbix_https_checker.conf
crontab -u zabbix -l | (cat - ; echo "*/10 * * * * /opt/https-ssl-cert-check-zabbix/cron.sh &> /dev/null") | crontab -u zabbix -
```

Import `template_zabbix-https-checker.yaml` to zabbix server and link with your host.

Based on the projects:
* [https-ssl-cert-check-zabbix](https://github.com/selivan/https-ssl-cert-check-zabbix)
* [zabbix-https-checker](https://github.com/tarwirdur/zabbix-https-checker).

