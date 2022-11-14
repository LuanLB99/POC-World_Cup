import connection from "../database/postgres.js";
import { user } from "../protocols/user.js";

const TABLE = 'users';

async function getCountries(){
    return await connection.query('SELECT * FROM countries;')
}

async function findUser(email: string, name?: string){
    const exist = await connection.query(`SELECT * FROM ${TABLE} WHERE email=$1 OR name=$2;`,[email,name])
    return exist.rows;
}

async function insertUser(email:string, name:string, hashpassword:string){
    await connection.query(`INSERT INTO ${TABLE} (email,name,password) VALUES ($1, $2, $3);`,[email, name, hashpassword])
}

async function insertUserSession(user:user, token:string) {
    const { id } = user;
     await connection.query(
       'INSERT INTO sessions ("userid", token) VALUES ($1, $2);',
         [id, token]
    );
  }

export {
    getCountries,
    findUser,
    insertUser,
    insertUserSession
}