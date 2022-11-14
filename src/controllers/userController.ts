import { Request, Response } from 'express';
import { v4 as uuid } from 'uuid';
import { findUser, getCountries, insertUser, insertUserSession } from '../repositories/userRepositoriy.js';
import bcrypt from 'bcrypt';
import { user } from '../protocols/user.js';

async function signUp(req:Request, res:Response){
    const { name, email, password} = res.locals.user;

    const hashpassword = bcrypt.hashSync(password, 10);

    try {
        const exist = await findUser(email, name)
        if (exist.length !== 0) {
			return res.status(409).send('email e/ou nome já cadastrado');
		}

        await insertUser(email, name, hashpassword)
       return res.sendStatus(201)
    } catch (error) {
        return res.status(500).send(error.message)
    }
}

async function signIn(req:Request, res:Response){
    const {email, password} = res.locals.user;

    try {
		const exist = await findUser(email);
		if (
			exist.length === 0 ||
			bcrypt.compareSync(password, exist[0].password) === false
		) {
			return res.status(401).send('Email ou senha inválidos');
		}
		const token = uuid();
        const user: user = exist[0];
		await insertUserSession(user, token);
		res.status(200).send({ token });
	} catch (error) {
		return res.status(500).send(error.message)
	}


}



async function returnCountries(req:Request, res:Response){
    try {
        const countries = await getCountries();
        res.send(countries.rows)
    } catch (error) {
        return res.status(500).send(error.message)
    }
}

export {
    signUp,
    returnCountries,
    signIn
}