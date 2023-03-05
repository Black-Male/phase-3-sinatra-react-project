class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
  get "/tasks" do
    Thetask.all.to_json
  end
  
  get "/tasks/bydate" do
    [Thetask.order(:due_date)].to_json
  end

  get "/tasks/bydate/reverse" do
    [Thetask.order(due_date: :desc)].to_json
  end

  get "/tasks/done" do
    [Thetask.where(done: true)].to_json
  end

  get "/tasks/notdone" do
    [Thetask.where(done: false)].to_json
  end
  
  post "/tasks" do
  end

  delete "/tasks" do
    Thetask.destroy()
  end
end
