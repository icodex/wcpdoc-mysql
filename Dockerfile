#docker image of wcpdoc mysql
# Author: iCodex

FROM mysql:5.7
MAINTAINER Shing.L <icodex@msn.com>

ENV WORK_PATH /tmp/work
ENV AUTO_RUN_DIR /docker-entrypoint-initdb.d
ENV DB_FILE wcp.free.v4.3.0.all.sql
ENV INSTALL_DATA_SHELL init_data.sh

RUN mkdir -p $WORK_PATH
COPY ./$DB_FILE $WORK_PATH/
COPY ./$INSTALL_DATA_SHELL $AUTO_RUN_DIR/

RUN chmod a+x $AUTO_RUN_DIR/$INSTALL_DATA_SHELL

#CMD ["sh", "/docker-entrypoint-initdb.d/docker-entrypoint.sh"]
