class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :release_date
      t.integer :genre_id
      t.string :poster_path
      t.string :backdrop_path
      t.string :overview

      t.timestamps
    end
  end
end
