class RecipesController < ApplicationController

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
    if params[:recipe_name] == ""
      redirect to "/recipes/new"
    else
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
  end

  get '/recipes/:id' do
    redirect_if_not_logged_in
    @recipe = Recipe.find(params[:id])
    erb :'recipes/show'
  end

  get '/recipes/:id/edit' do
    redirect_if_not_logged_in
    @recipe = Recipe.find(params[:id])
    if @recipe && @recipe.category.user == current_user
      erb :'recipes/edit'
    else
      redirect to '/recipes'
    end
  end

  patch '/recipes/:id' do
    redirect_if_not_logged_in
    if params[:recipe_name] == ""
      redirect to "/recipes/#{@recipe.id}/edit"
    else
      @recipe = current_user.recipes.find(params[:id])
      if @recipe && @recipe.category.user == current_user
        if @recipe.update(name: params[:recipe_name], ingredients: params[:ingredients], instructions: params[:instructions])
          if params[:new_category] == ""
            @recipe.category_id = params[:category]
          else
            @recipe.category = Category.find_or_create_by(name: params[:new_category], user_id: current_user.id)
          end
          @recipe.save
          current_user.categories.each do |category|
            if category.recipes.empty?
              current_user.categories.delete(category)
            end
          end
          redirect to "/recipes/#{@recipe.id}"
        else
          redirect to "/recipes/#{@recipe.id}/edit"
        end
      else
        redirect to '/recipes'
      end
    end
  end

  delete '/recipes/:id/delete' do
    redirect_if_not_logged_in
    @recipe = Recipe.find(params[:id])
    if @recipe && @recipe.category.user == current_user
      @recipe.delete
      current_user.categories.each do |category|
        if category.recipes.empty?
          current_user.categories.delete(category)
        end
      end
    end
    redirect to '/recipes'
  end

end
