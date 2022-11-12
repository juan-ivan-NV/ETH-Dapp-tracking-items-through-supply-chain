FROM node:10

WORKDIR /app

COPY . .

RUN npm uninstall -g truffle

RUN npm install -g truffle@5.0.2

RUN cd app
# install packages
RUN npm install --save  openzeppelin-solidity@2.3
RUN npm install --save  truffle-hdwallet-provider@1.0.17
#RUN npm install truffle-hdwallet-provider@1.0.10
RUN npm install webpack-dev-server -g
RUN npm install web3


# Remove the node_modules  
# remove packages
RUN cd app && rm -rf node_modules

# clean cache
#RUN npm cache clean
RUN npm install --cache /tmp/empty-cache
RUN rm package-lock.json
# initialize npm (you can accept defaults)
RUN npm init -y
# install all modules listed as dependencies in package.json
RUN npm install

# installing nano
# RUN apt-get update
# RUN apt-get install vim nano

# To deploy via Infura you'll need a wallet provider (like truffle-hdwallet-provider)
RUN npm install truffle-hdwallet-provider@web3-one
RUN npm install any-promise --save-dev
RUN npm install bindings

# For truffle
EXPOSE 9545
# For webpack app
EXPOSE 8080
#CMD ["node", "index.js"]