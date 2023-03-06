class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
  get "/users" do
    User.all.to_json
  end
  get '/users/:id' do
    [User.find(params[:id])].to_json
  end
  get '/users/:id/tasks' do
    [User.find(params[:id]).tasks.all].to_json
  end
  get '/users/:id/tasks/done' do
    [User.find(params[:id]).tasks.where(done: true)].to_json
  end
  get '/users/:id/tasks/notdone' do
    [User.find(params[:id]).tasks.where(done: false)].to_json
  end
  get '/users/:id/tasks/date-ascending' do
    [User.find(params[:id]).tasks.order(:due_date)].to_json
  end
  get '/users/:id/tasks/date-descending' do
    [User.find(params[:id]).tasks.order(due_date: :desc)].to_json
  end
  get '/tasks' do
    Task.all.to_json
  end
  patch 'tasks/:id' do
    task = Task.find(params[:id])
    task.update(
      done: params[:done]
    )
    task.to_json
  end
  post '/Adduser' do
    user = User.create(
      name => params[:name]
    )
    user.to_json
  end
  post '/newtask' do
    task = Task.create(
      task_details: params[:task_details],
      due_date: params[:due_date],
      done: params[:done],
      user_id: params[:user_id]
    )
    task.to_json
  end
  delete '/tasks/:id' do
    task = Task.find(params[:id])
    task.destroy
  end
end
