class CategoriesController < ApplicationController

  get '/categories' do
    @categories = Category.all.sort_by {|category| category.name}
    erb :'categories/index'
  end
end
