import { Response, Request, NextFunction } from "express";
import { signInSchema, signUpSchema } from "../schemas/userSchema.js";
import { unauthorizedRequestResponse } from "../controllers/controllersHelper.js";
import connection from "../database/postgres.js";


function signUpMiddlewere(req:Request, res:Response, next:NextFunction){
    const { name, email, password } = req.body;
     const validation = signUpSchema.validate({name, email, password})
     if (validation.error) {
		const errors = validation.error.details
			.map((error) => error.message)
		return res.status(422).send(errors);
	}

    res.locals.user = { name, email, password };
	next();
}

function singInMiddleWere(req:Request, res:Response, next:NextFunction){
    const { email, password } =req.body;
    const validation = signInSchema.validate({email, password});
    if (validation.error) {
		const errors = validation.error.details
			.map((error) => error.message)
		return res.status(422).send(errors);
	}

    res.locals.user = { email, password };
	next();

}


async function authMiddlewere(req:Request, res:Response, next:NextFunction) {
  const token = req.headers.authorization?.replace("Bearer ", "");
  if (!token) {
    return unauthorizedRequestResponse(res);
  }
  try {
    const session = await connection.query(
      "SELECT * FROM sessions WHERE token=$1;",
      [token]
    );
    if (!session.rows[0]) {
      return unauthorizedRequestResponse(res);
    }
    const user = await connection.query("SELECT * FROM users WHERE id=$1", [
      session.rows[0].userid,
    ]);
    res.locals.user = user.rows[0];
    next();
  } catch (error) {
    console.error(error);
  }
}


export {
    signUpMiddlewere,
    singInMiddleWere,
    authMiddlewere 
}