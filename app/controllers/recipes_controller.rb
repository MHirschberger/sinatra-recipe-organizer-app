require 'rack-flash'

class RecipesController < ApplicationController

  use Rack::Flash

  get '/recipes' do
    redirect_if_not_logged_in
    @recipes = current_user.recipes.sort_by {|recipe| recipe.name}
    erb :'recipes/index'
  end

  get '/recipes/new' do
    redirect_if_not_logged_in
    erb :'recipes/new'
  end

  post '/recipes' do
    redirect_if_not_logged_in
    binding.pry
    if invalid_params
      redirect to "/recipes/new"
    end
    @recipe = current_user.recipes.build(name: params[:recipe_name], ingredients: params[:ingredients], instructions: params[:instructions])
    if params[:new_category] == ""
      @recipe.category_id = params[:category]
    else
      @recipe.category = Category.find_or_create_by(name: params[:new_category], user_id: current_user.id)
    end
    if @recipe.save
      redirect to "/recipes/#{@recipe.id}"
    else
      redirect to "/recipes/new"
    end
  end

  get '/recipes/:id' do
    redirect_if_not_logged_in
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe && @recipe.category.user == current_user
      erb :'recipes/show'
    else
      flash[:message] = "Invalid Request"
      redirect to '/recipes'
    end
  end

  get '/recipes/:id/edit' do
    redirect_if_not_logged_in
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe && @recipe.category.user == current_user
      erb :'recipes/edit'
    else
      flash[:message] = "Invalid Request"
      redirect to '/recipes'
    end
  end

  patch '/recipes/:id' do
    redirect_if_not_logged_in
    @recipe = Recipe.find_by_id(params[:id])
    if invalid_params
      redirect to "/recipes/#{@recipe.id}/edit"
    end
    if @recipe && @recipe.category.user == current_user
      @recipe.update(name: params[:recipe_name], ingredients: params[:ingredients], instructions: params[:instructions])
      if params[:new_category] == ""
        @recipe.category_id = params[:category]
      else
        @recipe.category = Category.find_or_create_by(name: params[:new_category], user_id: current_user.id)
      end
      @recipe.save
      delete_empty_categories
      redirect to "/recipes/#{@recipe.id}"
    else
      flash[:message] = "Invalid Request"
      redirect to '/recipes'
    end
  end

  delete '/recipes/:id/delete' do
    redirect_if_not_logged_in
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe && @recipe.category.user == current_user
      @recipe.delete
      delete_empty_categories
    else
      flash[:message] = "Invalid Request"
    end
    redirect to '/recipes'
  end

end
