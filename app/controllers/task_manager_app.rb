require 'models/task_manager'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = TaskManager.all
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    # "<p>Params: #{params}</p> <p> Task params: #{params[:task]}</p>"
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do |id|
    @task = TaskManager.find(id.to_i)
    erb :show
  end
end
