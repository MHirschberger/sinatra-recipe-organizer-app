class RecipesController < ApplicationController

  get '/recipes' do
    #if logged_in?
      @recipes = Recipe.all.sort
      erb :'recipes/index'
  #  else
      #redirect to '/login'
    #end
  end

  get '/recipes/new' do
    #if logged_in?
      erb :'recipes/new'
    #else
      #redirect to '/login'
    #end
  end

  post '/recipes' do
    #if logged_in?
      binding.pry
      if params[:recipe_name] == "" || params[:category] == ""
        redirect to "/recipes/new"
      else
        #current_user.recipes
        @recipe = Recipe.new(name: params[:recipe_name], ingredients: params[:ingredients], instructions: params[:instructions])
        @recipe.category = Category.find_or_create_by(name: params[:category])
        if @recipe.save
          redirect to "/recipes/#{@recipe.id}"
        else
          redirect to "/recipes/new"
        end
      end
    #else
      #redirect to '/login'
    #end
  end

  get '/recipes/:id' do
    #if logged_in?
      @recipe = Recipe.find(params[:id])
      erb :'recipes/show'
    #else
      #redirect to '/login'
    #end
  end

  get '/recipes/:id/edit' do
    #if logged_in?
      @recipe = Recipe.find(params[:id])
      if @recipe && @recipe.user == current_user
        erb :'recipes/edit'
      else
        redirect to '/recipes'
      end
    #else
      #redirect to '/login'
    #end
  end

  patch '/recipes/:id' do
    #if logged_in?
      if params[:content] == ""
        redirect to "/tweets/#{params[:id]}/edit"
      else
        @tweet = Tweet.find_by_id(params[:id])
        if @tweet && @tweet.user == current_user
          if @tweet.update(content: params[:content])
            redirect to "/tweets/#{@tweet.id}"
          else
            redirect to "/tweets/#{@tweet.id}/edit"
          end
        else
          redirect to '/tweets'
        end
      end
    #else
      #redirect to '/login'
    #end
  end

  delete '/tweets/:id/delete' do
    #if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      if @tweet && @tweet.user == current_user
        @tweet.delete
      end
      redirect to '/tweets'
    #else
      #redirect to '/login'
    #end
  end

end
