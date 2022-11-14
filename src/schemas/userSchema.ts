import Joi from 'joi';

const signUpSchema = Joi.object({
	name: Joi.string().required(),
	email: Joi.string().email().required(),
	password: Joi.string().min(6).max(12),
});

const signInSchema = Joi.object({
	email: Joi.string().email().required(),
	password: Joi.string().min(6).max(12),
});



export {
    signUpSchema,
	signInSchema
}