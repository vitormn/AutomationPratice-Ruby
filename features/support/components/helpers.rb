# module helpers
module Helpers
  include Capybara::DSL

  # acessar pagina
  def comp_acess_page(page)
    visit(page)
  end

  # tecla enter
  def comp_press_enter
    page.driver.browser.switch_to.active_element.send_keys :enter
  end

  # tecla tab
  def comp_press_tab
    page.driver.browser.switch_to.active_element.send_keys :tab
  end
end
