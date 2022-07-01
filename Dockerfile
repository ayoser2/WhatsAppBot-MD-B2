FROM node:lts-buster

WORKDIR /root/AlienAlfa/

COPY ./ /root/AlienAlfa/

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  ffmpeg \
  webp && \
  apt-get upgrade -y && \
rm -rf /var/lib/apt/lists/*

RUN npm install -g npm@8.11.0

RUN set NODE_OPTIONS=--max_old_space_size=2048

RUN npm install -g nodemon 

RUN npm install -g forever

RUN npm i cfonts

EXPOSE 5000

COPY . .

CMD ["npm", "start"]
