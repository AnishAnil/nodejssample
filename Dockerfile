# use a node base image
FROM node:8.5.0-wheezy

# set maintainer
LABEL maintainer "anisanil"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000


#OS From where it is being downloaded
#FROM node:alpine


#Current Working Directory
WORKDIR /Docker_App/

#Copy files to the Container
COPY . /Docker_App/

# Install app dependencies
RUN apt-get update
RUN npm install -y
RUN npm install express

# Binds to port 8081 as specified the the server.js file
EXPOSE 8000

# Start the Server
CMD ["npm", "start"]
#CMD [node, “/Docker_App/main.js”]