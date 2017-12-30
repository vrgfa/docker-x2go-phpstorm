FROM vrgfa/docker-php-x2go
MAINTAINER Ferenc Varga

RUN (apt-get update && apt-get -y install tar curl gzip)
RUN (curl -V)
RUN (mkdir -p /opt/phpstorm)
#RUN (curl -sL https://download-cf.jetbrains.com/webide/PhpStorm-2017.3.2.tar.gz | tar zx -C /opt/phpstorm --strip-components 1)
RUN (curl -sLO https://download-cf.jetbrains.com/webide/PhpStorm-2017.3.2.tar.gz)
RUN (tar zxf PhpStorm-2017.3.2.tar.gz -C /opt/phpstorm --strip-components 1)
RUN (mkdir -p /var/www/html && chown 1000:1000 /var/www/html)
RUN (ln -s /opt/phpstorm/bin/phpstorm.sh /usr/local/bin/phpstorm)

#magento bash completion
RUN curl -o /etc/bash_completion.d/m2install-bash-completion https://raw.githubusercontent.com/yvoronoy/m2install/master/m2install-bash-completion
RUN curl -o /etc/bash_completion.d/magento2-bash-completion https://raw.githubusercontent.com/yvoronoy/magento2-bash-completion/master/magento2-bash-completion
RUN curl -o /etc/bash_completion.d/n98-magerun2.phar.bash https://raw.githubusercontent.com/netz98/n98-magerun2/master/res/autocompletion/bash/n98-magerun2.phar.bash


VOLUME /var/www/html
WORKDIR /var/www/html