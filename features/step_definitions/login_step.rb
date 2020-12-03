Dado('que o usuário esteja cadastrado') do
  steps %(
    Dado que acessou a área de login
    Quando tentar fazer o cadastro
    E preencher os dados obrigatórios
    Então será cadastrado corretamente
  )
end

Quando('acessar a área de login') do
  @file = YAML.load_file(File.join(Dir.pwd, 'features/specs/fixtures/login_fixture.yaml'))
  @login_fixture = @file['LoginSucesso']
  
  comp_signout_link
  expect(page).to have_text @login_fixture['cabecalhoPagina'].upcase
end

Quando('inserir os dados') do
  @controller.email($email)
  @controller.password(@login_fixture['senha'])
  comp_signin_button
end

Então('o usuário será logado no sistema') do
  expect(comp_username_header).to have_text @login_fixture['nomeUsuario']
  expect(current_url).to have_text @login_fixture['paginaUsuarioLogado']
end