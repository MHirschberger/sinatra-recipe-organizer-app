class RecipesController < ApplicationController

  get '/recipes' do
    #if logged_in?
      @recipes = Recipe.all.sort_by {|recipe| recipe.name}
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
      if params[:recipe_name] == ""
        redirect to "/recipes/new"
      else
        #current_user.recipes
        @recipe = Recipe.new(name: params[:recipe_name], ingredients: params[:ingredients], instructions: params[:instructions])
        if params[:new_category] == ""
          @recipe.category_id = params[:category]
        else
          @recipe.category = Category.find_or_create_by(name: params[:new_category])
        end
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
      if @recipe #&& @recipe.user == current_user
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
      if params[:recipe_name] == ""
        redirect to "/recipes/#{@recipe.id}/edit"
      else
        @recipe = Recipe.find(params[:id])
        if @recipe #&& @tweet.user == current_user
          if @recipe.update(name: params[:recipe_name], ingredients: params[:ingredients], instructions: params[:instructions])
            if params[:new_category] == ""
              @recipe.category_id = params[:category]
            else
              @recipe.category = Category.find_or_create_by(name: params[:new_category])
            end
            @recipe.save
            redirect to "/recipes/#{@recipe.id}"
          else
            redirect to "/recipes/#{@recipe.id}/edit"
          end
        else
          redirect to '/recipes'
        end
      end
    #else
      #redirect to '/login'
    #end
  end

  delete '/recipes/:id/delete' do
    #if logged_in?
      @recipe = Recipe.find(params[:id])
      if @recipe #&& @recipe.user == current_user
        @recipe.delete
      end
      redirect to '/recipes'
    #else
      #redirect to '/login'
    #end
  end

end
