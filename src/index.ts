import express from "express";
const app = express();
const host = process.env.HOST;
const port = parseInt(process.env.PORT || '3000');
const readyTime = parseInt(process.env.READY_TIME || '10000');
const shutdownTime = parseInt(process.env.SHUTDOWN_TIME || '10000');

import uuidv4 from 'uuid/v4';
import { createLightship } from 'lightship';

const uuid = uuidv4()
const lightship = createLightship();

function delay(ms: number) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

// define a route handler for the default home page
app.get("/", (_, res) => {
  res.send(`Hello world from ${uuid}`);
});

app.get("/heavy", (_, res) => {

  for (let i = 0; i < 1000000; i++) {
    console.log(`Round: ${i}`);
  }

  res.send(`Heavy from ${uuid}`);
});

app.get("/shutdown", (_, res) => {
  lightship.shutdown();
  res.send(`Starting shutdown from ${uuid}`);
});

lightship.registerShutdownHandler(async () => {
  await delay(shutdownTime);
  server.close();
});

// start the Express server
const server = app.listen(port, async () => {
  console.log(`server started at http://${host}:${port}`);
  await delay(readyTime);
  lightship.signalReady();
  console.log('Ready!');
});


