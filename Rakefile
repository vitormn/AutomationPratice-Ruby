# gerenciador de tarefas

# para rodar a task use:
# rake specs["@tag"]

desc 'run in ci mode'
task :specs, [:tags] do |_task, args|
  sh "bundle exec cucumber -p ci -t #{args[:tags]}"
end

desc 'run in default mode'
task :specs_def, [:tags] do |_task, args|
  sh "bundle exec cucumber -p default -t #{args[:tags]}"
end
