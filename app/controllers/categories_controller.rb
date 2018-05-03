class CategoriesController < ApplicationController

  get '/categories' do
    redirect_if_not_logged_in
    @categories = current_user.categories.sort_by {|category| category.name}
    erb :'categories/index'
  end

  get '/categories/:id' do
    redirect_if_not_logged_in
    @category = Category.find(params[:id])
    if @category && @category.user == current_user
      erb :'categories/show'
    else
      flash[:notice] = "Invalid Request"
      redirect to '/categories'
    end
  end

end
