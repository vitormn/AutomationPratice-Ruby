# language: pt

@all
@login
Funcionalidade: Login
    Com um usuário na web
    Que deseja ver sua conta na AutomationPratice
    Para validar se seus dados estão atualizados

    Cenário: Login com sucesso
        Dado que o usuário esteja cadastrado
        Quando acessar a área de login
        E inserir os dados
        Então o usuário será logado no sistema