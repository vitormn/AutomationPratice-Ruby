# ------------------------- Antes de Iniciar o Teste ------------------------- #

Before do
  page.current_window.resize_to(1900, 1080)
end

# ------------------------- Evidencias e Mensagem de Erro ------------------------- #

# captura da tela
def add_screenshot(scenario)
  nome = scenario.name.tr(' ', '_').downcase!
  captura = page.save_screenshot("log/screenshots/#{nome}.png")
  attach(captura, 'image/png')
end

# mensagem de retorno se o cenario falhar
def exception_message(scenario)
  step = scenario.failed?
  return unless step == true

  log("\n\n--------------------------")
  log("Motivo:\n")
  log(scenario.exception.message.to_s)
  log("--------------------------\n\n")
end

# ------------------------- Depois de Finalizar o Teste ------------------------- #

# mensagem de resultado do cenario
AfterConfiguration do |config|
  config.on_event :test_case_finished do |event|
    puts "\n\nResultado"
    puts '-------------'
    puts "Cenário: #{event.test_case.name}"
    puts "O resultado é: #{event.result}\n\n"
  end
end

# depois de rodar os cenarios tirar print e mensagem de erro
After do |scenario|
  add_screenshot(scenario)
  exception_message(scenario)
end
