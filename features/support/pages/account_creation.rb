# page objetcs account creation
class AccountCreation
  include Capybara::DSL

  def title(title)
    case title
    when 'Mr.'
      find('#id_gender1').click
    when 'Mrs.'
      find('#id_gender2').click
    else
      raise 'Opção Não Disponível!'.colorize(:red)
    end
  end

  def first_name(name)
    fill_in('customer_firstname', with: name)
  end

  def last_name(last)
    fill_in('customer_lastname', with: last)
  end

  def password(pass)
    fill_in('passwd', with: pass)
  end

  def day_of_birth(day)
    Capybara.ignore_hidden_elements = false
    select(day, from: 'days')
    Capybara.ignore_hidden_elements = true
  end

  def month_of_birth(month)
    Capybara.ignore_hidden_elements = false
    select(month, from: 'months')
    Capybara.ignore_hidden_elements = true
  end
    
  def year_of_birth(year)
    Capybara.ignore_hidden_elements = false
    select(year, from: 'years')
    Capybara.ignore_hidden_elements = true
  end

  def first_name_address(name)
    fill_in('firstname', with: name)
  end

  def last_name_address(add)
    find('#lastname').set add
  end

  def address(add)
    fill_in('address1', with: add)
  end

  def city(city)
    fill_in('city', with: city)
  end

  def state(state)
    Capybara.ignore_hidden_elements = false
    select(state, from: 'id_state')
    Capybara.ignore_hidden_elements = true
  end

  def zip(zip)
    fill_in('postcode', with: zip)
  end

  def country(country)
    Capybara.ignore_hidden_elements = false
    select(country, from: 'id_country')
    Capybara.ignore_hidden_elements = true
  end

  def phone_mobile(phone)
    fill_in('phone_mobile', with: phone)
  end

  def name_address(add)
    fill_in('alias', with: add)
  end
end
