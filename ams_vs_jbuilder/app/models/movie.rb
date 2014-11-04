class Movie < ActiveRecord::Base
  serialize :images, Hash
  serialize :ratings, Hash
  serialize :genres, Array
end
