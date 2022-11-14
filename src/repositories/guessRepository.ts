import connection from "../database/postgres.js";

const TABLE = 'games';

async function findCountries(gameId:string){
    return connection.query(`SELECT * FROM ${TABLE} WHERE id=$1;`,[gameId]);
}


async function makeMyGuess(userId:number, gameId:string, winnerId:number){
    await connection.query(`INSERT INTO guess (userid, gameid, winnerid) VALUES ($1,$2,$3);`,[userId, gameId, winnerId]);
}

async function findMyGuess(id:number){
    return connection.query(`SELECT COUNT (userid) FROM guess WHERE userid=$1;`,[id])
}

async function findTheGuess(guessId:number){
    return connection.query(`SELECT * FROM guess WHERE id=$1;`,[guessId])
}

async function updateMyGuess(guessId:number, winnerId:number){
    await connection.query(`UPDATE guess SET winnerid=$1 WHERE id=$2`,[winnerId, guessId])
}

async function deleteMyGuess(guessId:string){
    await connection.query(`DELETE FROM guess WHERE id=$1`, [guessId])
}

export {
    makeMyGuess,
    findCountries,
    findMyGuess,
    deleteMyGuess,
    findTheGuess,
    updateMyGuess
}