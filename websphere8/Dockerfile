FROM websphere-liberty:webProfile7

RUN rm -rf /config/dropins/*

ADD /webapps/*.war /config/dropins/
ADD /webapps/*.properties /config/

RUN  sed -i -e 's/^/-D/' ./config/*.properties \
	&& cat /config/*.properties >> /config/jvm.options \
	&& sed -i -e 's/9080/8080/' /config/server.xml \
	&& rm -rf *.properties