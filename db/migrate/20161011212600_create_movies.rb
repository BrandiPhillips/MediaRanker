class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :author
      t.text :description
      t.integer :ranked

      t.timestamps null: false
    end
  end
end
