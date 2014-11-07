class MovieSerializer < ActiveModel::Serializer
  attributes :title, :year, :released, :url, :trailer,
             :runtime, :tagline, :overview, :certification,
             :imdb_id, :tmdb_id, :poster, :watchers
end
