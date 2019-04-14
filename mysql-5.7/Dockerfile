FROM appz/mysql:5.7.base
MAINTAINER @rejith_krishnan

WORKDIR /

ADD webapps/*.zip /

RUN unzip /*.zip \
	&& cp /$(unzip -qql *.zip | head -1 | tr -s ' ' | cut -d' ' -f5- | awk -F '/' '{ print $1}')/*.cnf /etc/mysql/conf.d; \
	ls -l /etc/mysql/conf.d/*
	