require 'rack-flash'

class UsersController < ApplicationController

  use Rack::Flash

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect to '/index'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "Username, Email, And Password Required To Create Account"
      redirect to '/signup'
    elsif User.find_by(username: params[:username])
      flash[:message] = "Username Already Taken. Signup Using Another Username Or Login."
      redirect to '/signup'
    elsif User.find_by(email: params[:email])
      flash[:message] = "Email Address Already Taken. Signup Using Another Email Address Or Login."
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/index'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/index'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/index"
    else
      flash[:message] = "Username or Password Incorrect"
      redirect to '/login'
    end
  end

  get '/index' do
    if logged_in?
      @user = User.find_by_id(current_user.id)
      erb :'users/index'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
