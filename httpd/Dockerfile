FROM yukoff/slackware-32bit
MAINTAINER yukoff

RUN slackpkg -batch=on -default_answer=y update
RUN slackpkg -batch=on -default_answer=y install httpd-2.4.6-i486-1 apr-util-1.5.1-i486-1 sqlite-3.7.17-i486-1 cyrus-sasl-2.1.23-i486-5 apr-1.4.6-i486-1
RUN chmod +x /etc/rc.d/rc.httpd
EXPOSE 80
VOLUME ["/var/www","/etc/httpd","/var/log/httpd"]
ENTRYPOINT ["sh","-c", "/usr/sbin/httpd -DFOREGROUND"]

# docker run -p 6666:80 yukoff/slackware-httpd-32bit
