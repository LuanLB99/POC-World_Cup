Aplicação de palpites da copa do mundo

Nessa aplicação, você poderá criar sua conta, fazer e alterar seus palplites baseado nos jogos cadastrados.


POST: /signup

Body: {"name":"Jorel", "email": "jorel@gmail.com", "password":"abacate123" }

POST: /signin

Body: {
    "email": "jorel@gmail.com", "password":"abacate123"
}

POST: /guess/:gameId

Body: {
    "winnerid":2
}

OBS: O WinnerID é definido pelo id do país na tabela países

GET:/guess

Lista todos os palpites daquele usuário. Necessário ter uma sessão ativa para validar o usuário.

DELETE: /guess/:guessid

Deleta o palpite escolhido pelo usuário: Necessário ter uma sessão ativa para validar o usuário e ver se aquele palpite é deste usuário.

PUT: /guess/guessid

Body: {
    winnerid:2
}

Atualiza o palpite escolhido pelo usuário. Necessário ter uma sessão ativa para validar o usuário e ver se aquele palpite é deste usuário.

