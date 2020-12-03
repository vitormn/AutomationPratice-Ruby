# page objects Controller
class Controller
  include Capybara::DSL

  # instanciando classe que realiza o cadastro do usuario
  def account_creation
    AccountCreation.new
  end

  # preencher o email para cadastro
  def email_create(email)
    fill_in('email_create', with: email)
  end

  # preencher o email para login
  def email(email)
    find('#email').set email
  end

  # preencher a senha para login
  def password(pass)
    fill_in('passwd', with: pass)
  end
end
