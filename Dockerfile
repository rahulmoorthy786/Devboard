FROM node:24-alpine

# All app files live under /app.
WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# The preview server listens on this port
EXPOSE 5173

# Bind to 0.0.0.0 so the server is reachable from outside the container
# (the default 127.0.0.1 would only accept connections from inside it).
CMD ["npm","run","dev","--","--host","0.0.0.0","--port","5173"]
