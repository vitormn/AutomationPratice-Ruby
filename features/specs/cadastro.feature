# language: pt

@all
@cadastro
Funcionalidade: Cadastro de Usuário
    Com um usuário na web
    Que acessou o site AutomationPratice
    Para fazer seu cadastro

    Cenário: Cadastro com Sucesso
        Dado que acessou a área de login
        Quando tentar fazer o cadastro
        E preencher os dados obrigatórios
        Então será cadastrado corretamente