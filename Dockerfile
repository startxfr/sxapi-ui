FROM startx/sxapi:0.1.4
MAINTAINER STARTX "dev@startx.fr"

USER root
RUN  rm -rf $APP_PATH/test $APP_PATH/node_modules $APP_PATH/package.json
COPY ./*.j* $APP_PATH/
COPY ./static $APP_PATH/static
COPY ./sxapi.json $CONF_PATH/sxapi.json

RUN  cd $APP_PATH \
 &&  npm install -production \
 &&  npm dedupe \
 &&  npm cache verify \
 &&  npm cache clean --force \
 &&  chown -R node:node $APP_PATH $CONF_PATH $DATA_PATH

USER node:node
EXPOSE 8081
WORKDIR $APP_PATH
ENTRYPOINT [ "/bin/sxapi" ]
CMD [ "start" ]