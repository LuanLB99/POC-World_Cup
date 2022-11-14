import { Router } from "express";
import { deleteGuess, listMyGuesses, makeGuess, updateGuess } from "../controllers/guessControllers.js";
import { authMiddlewere } from "../middleweres/authMiddlewere.js";



const guessRouter = Router();

guessRouter.post('/guess/:gameId', authMiddlewere, makeGuess);
guessRouter.get('/guess',authMiddlewere, listMyGuesses);
guessRouter.delete('/guess/:guessId', authMiddlewere, deleteGuess);
guessRouter.put('/guess/:guessId', authMiddlewere, updateGuess);


export default guessRouter;