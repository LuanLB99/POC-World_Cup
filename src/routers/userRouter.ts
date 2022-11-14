import { Router } from "express";
import { returnCountries, signIn, signUp } from "../controllers/userController.js";
import { signUpMiddlewere, singInMiddleWere } from "../middleweres/authMiddlewere.js";

const userRouter = Router();

userRouter.post('/signup',signUpMiddlewere ,signUp);
userRouter.post('/signin',singInMiddleWere ,signIn);
userRouter.get('/countries', returnCountries);



export default userRouter;