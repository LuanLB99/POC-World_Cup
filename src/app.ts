import 'dotenv/config';
import express from 'express';
import guessRouter from './routers/guessRouter.js';
import userRouter from './routers/userRouter.js';

const server = express();
server.use(express.json());


server.get('/health', (req, res) => res.send("ok"));
server.use(userRouter);
server.use(guessRouter);


server.listen(process.env.PORT, () => {
    console.log("the types is listening on port " + process.env.PORT)
})