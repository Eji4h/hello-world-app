import express from "express";
const app = express();
const host = process.env.HOST;
const port = process.env.PORT;

import uuidv4 from 'uuid/v4';

const uuid = uuidv4()

// define a route handler for the default home page
app.get("/", (_, res) => {
    res.send(`Hello world from ${uuid}`);
});

// start the Express server
app.listen(port, () => {
    console.log(`server started at http://${host}:${port}`);
});
