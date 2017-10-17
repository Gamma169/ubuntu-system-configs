#!/usr/bin/env node

var http        = require('http');
var argv        = require('yargs').argv;
var port        = argv.p || argv.port;

if (!port) {
  console.log([
    "Echoserver",
    "",
    "Usage:",
    "  echoserver -p PORT",
    "",
    "Options:",
    "  -p, --port=PORT    - Port to listen on",
    "",
    "Example:",
    "  echoserver -p 8080"
  ].join("\n"));
} else {
  console.log("Starting echoserver on port " + port + " -- Ready to recieve connections");
  http.createServer((request, response) => {
  const { headers, method, url } = request;
  serverURLRecieved = url;
  let body = [];
  request.on('error', (err) => {
    console.error(err);   // eslint-disable-line
  }).on('data', (chunk) => {
    body.push(chunk);
  }).on('end', () => {
    body = Buffer.concat(body).toString();

    response.on('error', (err) => {
      console.error(err);  // eslint-disable-line
    });

    response.writeHead(200, {'Content-Type': 'application/json'})

    const responseBody = { headers, method, url, body };
    console.log(responseBody);

    response.end(JSON.stringify(responseBody));

  });
  }).listen(port);
}
