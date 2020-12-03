Dado('que acessou a área de login') do
  file = YAML.load_file(File.join(Dir.pwd, 'features/specs/fixtures/cadastro_fixture.yaml'))
  @cadastro_fixture = file['CadastroSucesso']

  comp_acess_page('/')
  comp_signin_link
  expect(page).to have_text @cadastro_fixture['cabecalhoPagina'].upcase
end

Quando('tentar fazer o cadastro') do
  $email = Faker::Internet.email
  log("Email do usuário: #{$email}")

  @controller.email_create($email)
  comp_press_tab
  expect(page).to have_css('.form-ok')
  comp_create_account_button
end

Quando('preencher os dados obrigatórios') do
  @controller.account_creation.title(@cadastro_fixture['genero'])
  @controller.account_creation.first_name(@cadastro_fixture['nome'])
  @controller.account_creation.last_name(@cadastro_fixture['sobrenome'])
  @controller.account_creation.password(@cadastro_fixture['senha'])
  @controller.account_creation.day_of_birth(@cadastro_fixture['dataNascimento']['dia'] )
  @controller.account_creation.month_of_birth(@cadastro_fixture['dataNascimento']['mes'] )
  @controller.account_creation.year_of_birth(@cadastro_fixture['dataNascimento']['ano'])
  @controller.account_creation.first_name_address(@cadastro_fixture['nome'])
  @controller.account_creation.last_name_address(@cadastro_fixture['sobrenome'])
  @controller.account_creation.address(@cadastro_fixture['endereco']['logadouro'])
  @controller.account_creation.city(@cadastro_fixture['endereco']['cidade'])      
  @controller.account_creation.state(@cadastro_fixture['endereco']['estado'])
  @controller.account_creation.zip(@cadastro_fixture['endereco']['cep'])
  @controller.account_creation.country(@cadastro_fixture['endereco']['pais'])
  @controller.account_creation.phone_mobile(@cadastro_fixture['telefone'])
  @controller.account_creation.name_address(@cadastro_fixture['nomeEndereco'])
  comp_register_button
end

Então('será cadastrado corretamente') do
  expect(comp_username_header).to have_text "#{@cadastro_fixture['nome']} #{@cadastro_fixture['sobrenome']}"
  expect(current_url).to have_text @cadastro_fixture['paginaUsuarioCadastrado']
end
