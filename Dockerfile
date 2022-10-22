FROM alpine


WORKDIR /usr/app 

EXPOSE 8080 


RUN apk add --update nodejs npm #instalacja paczek

RUN apk add --update npm

RUN apk add openssh

RUN apk add git

RUN mkdir -p /root/.ssh


RUN touch /root/.ssh/id_rsa 


RUN touch /root/.ssh/id_rsa.pub

RUN touch /root/.ssh/known_hosts

RUN ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts

RUN chmod 600 /root/.ssh/id_rsa


RUN chmod 600 /root/.ssh/id_rsa.pub

COPY ./id_rsa.pub /root/.ssh/id_rsa.pub 


COPY ./id_rsa /root/.ssh/id_rsa

RUN chmod 400 /root/.ssh/id_rsa 


RUN chmod 400 /root/.ssh/id_rsa.pub

RUN touch /root/.ssh/config 


RUN chmod 700 /root/.ssh/config

RUN echo $'Host git \n HostName github.com \n AddKeysToAgent yes \n PreferredAuthentications publikey \n IdentityFile /root/.ssh/id_rsa' > /root/.ssh/config

RUN git clone git@github.com:radzio2209/Doker1.git .


RUN npm -g outdated

RUN npm -g update

RUN npm install

CMD npm start
