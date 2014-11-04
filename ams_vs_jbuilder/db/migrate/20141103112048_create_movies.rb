class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :released
      t.string :url
      t.string :trailer
      t.integer :runtime
      t.string :tagline
      t.text :overview
      t.string :certification
      t.string :imdb_id
      t.string :tmdb_id
      t.string :poster
      t.text :images
      t.integer :watchers
      t.text :ratings
      t.text :genres

      t.timestamps
    end
  end
end
