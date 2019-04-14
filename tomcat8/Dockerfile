FROM appz/tomcat8:base

RUN rm -rf $CATALINA_HOME/webapps/*

ADD webapps/*.war $CATALINA_HOME/webapps/
ADD webapps/*.properties $CATALINA_HOME/conf/webapps/

RUN echo "# ------------------------------------------------------------------------" >> $CATALINA_HOME/conf/catalina.properties \
	&& echo "# ----------------------- application properties -------------------------" >> $CATALINA_HOME/conf/catalina.properties \ 
	&& cat $CATALINA_HOME/conf/webapps/*.properties >> $CATALINA_HOME/conf/catalina.properties \
	&& echo "# ------------------------------------------------------------------------" >> $CATALINA_HOME/conf/catalina.properties
