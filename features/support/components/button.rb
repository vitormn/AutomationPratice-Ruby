# modulos botoes
module Button
  include Capybara::DSL

  # clicar no botao 'Create an account'
  # para criar uma conta
  def comp_create_account_button
    click_button 'Create an account'
  end

  # clicar no botao 'Register'
  # para incluir um registro
  def comp_register_button
    click_button 'Register'
  end

  # clicar no botao 'Sign In'
  # para fazer o login
  def comp_signin_button
    click_button 'Sign in'
  end
end
