# modulo links
module Links
  include Capybara::DSL

  # clicar no link 'Sing in'
  def comp_signin_link
    click_link 'Sign in'
  end

  # clicar no link 'Sign out'
  # para deslogar o usuario
  def comp_signout_link
    # click_link 'Sign out'
    find('a[href*="mylogout="]').click
  end
end
