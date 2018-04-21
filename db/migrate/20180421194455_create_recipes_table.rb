class CreateRecipesTable < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :instructions
      t.integer :user_id
      t.integer :category_id
    end
  end
end
