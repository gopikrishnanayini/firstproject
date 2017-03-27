class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :resume

      t.timestamps null: false
    end
  end
end
