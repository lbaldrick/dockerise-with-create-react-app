FROM node:7.8.0

ENV NPM_CONFIG_LOGLEVEL warn

# Install `serve` to run the application.
RUN npm install -g serve

# Set the command to start the node server.
CMD serve -s build

# Tell Docker about the port we'll run on.
EXPOSE 5000

COPY package.json package.json
COPY npm-shrinkwrap.json npm-shrinkwrap.json
RUN npm install

# Copy all local files into the image.
COPY . .

RUN npm run build --production