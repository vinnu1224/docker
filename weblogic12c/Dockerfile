FROM appz/weblogic12c:base

USER oracle
ADD /webapps/*.war ${ORACLE_HOME}/
ADD /webapps/*.properties ${ORACLE_HOME}/

USER root
ADD scripts/appz.sh /u01/oracle/
RUN chmod +xr /u01/oracle/appz.sh
WORKDIR ${ORACLE_HOME}
CMD ["/u01/oracle/appz.sh"]
