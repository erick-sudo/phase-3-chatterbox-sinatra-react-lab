class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    Message.all.order(created_at: :asc).to_json
  end

  get '/messages/:id' do
    Message.find(params[:id])
  end
  
  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(params)
    message.to_json
  end

  post '/messages' do
    message = Message.create(body: params[:body], username: params[:username])
    message.to_json
  end

  delete '/messages/:id' do
    Message.delete(params[:id])
    hash.new.to_json
  end
end
