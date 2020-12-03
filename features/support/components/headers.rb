# modulo Headers
module Headers
  include Capybara::DSL

  # informacao do nome do usuario
  def comp_username_header
    find('.header_user_info span').text.strip
  end
end
