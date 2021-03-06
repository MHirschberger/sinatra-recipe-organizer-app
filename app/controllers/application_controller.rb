require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:message] = "Not Authorized. Please login."
        redirect "/login"
      end
    end

    def invalid_params
      if params[:recipe_name].empty? || (params[:category].empty? && params[:new_category].empty?)
        flash[:message] = "Name And Category Required For Recipe"
      end
    end

    def delete_empty_categories
      current_user.categories.each do |category|
        if category.recipes.empty?
          current_user.categories.delete(category)
        end
      end
    end

  end

end
