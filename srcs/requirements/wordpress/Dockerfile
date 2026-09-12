FROM debian:bookworm

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y \
	#fast-cgi
        php8.2-fpm \
	
	#to communicate with mariadb
        php8.2-mysql \
	
	#php-cli because wpcli is php based application
        php8.2-cli \
	
	#installation tool
        wget \
	rm -rf /var/lib/apt/lists/*

	#Change PHP-FPM from a Unix socket to port 9000
RUN	sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' \
	/etc/php/8.2/fpm/pool.d/www.conf
	
	#changing the location would also work , jst semantics
COPY	tools/exec.sh /user/local/bin/exec.sh

RUN	chmod +x /usr/local/bin/exec.sh

ENTRYPOINT	["user/local/bin/exec.sh"]
