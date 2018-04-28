class CategoriesController < ApplicationController

  get '/categories' do
    @categories = Category.all.sort_by {|category| category.name}
    erb :'categories/index'
  end

  get '/categories/:id' do
    #if logged_in?
      @category = Category.find(params[:id])
      erb :'categories/show'
    #else
      #redirect to '/login'
    #end
  end
end
