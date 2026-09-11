FROM    debian:bookworm

# "Execute this command while BUILDING the Docker image."

RUN     apt-get update && \
        apt-get install -y nginx openssl curl && \
         rm -rf /var/lib/apt/lists/*

RUN     mkdir -p /etc/nginx/ssl && \
        openssl req -x509 -nodes \
        #save the certificate here
        -out /etc/nginx/ssl/inception.crt \
        #where to save the private key 
        -keyout /etc/nginx/ssl/inception.key \
        #identity information inside the certificate
        -subj "/C=MO/ST=KH/L=KH/O=1337/OU=1337/CN=sabadri.42.fr"

COPY    conf/nginx.conf /etc/nginx/nginx.conf
        # keep nginx running in the foreground
CMD     ["nginx", "-g", "daemon off;"]
