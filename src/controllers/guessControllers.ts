import { Request, Response } from 'express';
import { deleteMyGuess, findCountries, findMyGuess, findTheGuess, makeMyGuess, updateMyGuess } from '../repositories/guessRepository.js';

async function makeGuess(req:Request, res:Response){
    const  { gameId } = req.params;
    const id:number  = res.locals.user;
    const  winnerId:number  = req.body;

    try {
      const exist = await findCountries(gameId);
      if (exist.rows.length === 0) {
        return res.status(409).send('Este jogo não exite!');
    }
    const times = exist.rows[0];
        if(winnerId !== times.homeid && winnerId !== times.awayid){
            return res.status(409).send('O time escolhido não pertence a esse jogo!');
        }  

        await makeMyGuess(id, gameId, winnerId);
        res.sendStatus(201)
        
    } catch (error) {
        return res.status(500).send(error.message) 
    }

}

async function listMyGuesses(req:Request, res:Response){
    const { id } = res.locals.user;
    try {
       const guess = await findMyGuess(id);
       if (guess.rows.length === 0) {
        return res.status(409).send('Este jogo não exite!');
    }

    return res.send(guess.rows[0].count)
    } catch (error) {
            return res.status(500).send(error.message)
    }

}

async function updateGuess(req:Request, res:Response){
    const { id } = res.locals.user;
    const { guessId } = req.params;
    const { winnerId } = req.body;
    try {
        const user = await findTheGuess(Number(guessId));
        if(user.rows.length === 0){return res.sendStatus(404)}
        if(user.rows[0].userid !== id) {return res.sendStatus(401)}
        const exist = await findCountries(user.rows[0].gameid);
      if (exist.rows.length === 0) {
        return res.status(409).send('Este jogo não exite!');
    }

    const times = exist.rows[0];
        if(winnerId !== times.homeid && winnerId !== times.awayid){
            return res.status(409).send('O time escolhido não pertence a esse jogo!');
        }  
        updateMyGuess(Number(guessId),winnerId)
        return res.sendStatus(200);
    } catch (error) {
        return res.status(500).send(error.message)
    }

 
    
}

async function deleteGuess(req:Request, res:Response){
    const { id } = res.locals.user;
    const { guessId } = req.params;
    try {
      const user = await findTheGuess(Number(guessId));
        if(user.rows.length === 0){return res.sendStatus(404)}
        if(user.rows[0].userid !== id) {return res.sendStatus(401)}
        deleteMyGuess(guessId)
        return res.sendStatus(200)
    } catch (error) {
        return res.status(500).send(error.message)
    }
}


export {
    makeGuess,
    listMyGuesses,
    deleteGuess,
    updateGuess
}