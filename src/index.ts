import express from "express";
const app = express();
const host = process.env.HOST;
const port = process.env.PORT;

// define a route handler for the default home page
app.get("/", (_, res) => {
    res.send("Hello world!");
});

// start the Express server
app.listen(port, () => {
    console.log(`server started at http://${host}:${port}`);
});
