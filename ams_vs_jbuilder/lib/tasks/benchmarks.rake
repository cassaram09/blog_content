require 'render_anywhere'
require Rails.root.join('app', 'serializers', 'movie_serializer.rb')

include RenderAnywhere

namespace :benchmarks do
  desc "Benchamark single object (with render)"
  task single_object_with_render: :environment do
    movie = Movie.new(
        title: "Dawn of the Planet of the Apes",
        year: 2014,
        released: 1405062000,
        url: "http://trakt.tv/movie/dawn-of-the-planet-of-the-apes-2014",
        trailer: "http://youtube.com/watch?v=3wMnftb_RI4",
        runtime: 130,
        tagline: "One last chance for peace.",
        overview: "A group of scientists in San Francisco struggle to stay alive in the aftermath of a plague that is wiping out humanity, while Caesar tries to maintain dominance over his community of intelligent apes.",
        certification: "PG-13",
        imdb_id: "tt2103281",
        tmdb_id: "119450",
        poster: "http://slurm.trakt.us/images/posters_movies/211624.4.jpg",
        images: {
          poster: "http://slurm.trakt.us/images/posters_movies/211624.4.jpg",
          fanart: "http://slurm.trakt.us/images/fanart_movies/211624.4.jpg"
        },
        watchers: 33,
        ratings: {
          percentage: 80,
          votes: 1528,
          loved: 1456,
          hated: 72
        },
        genres: ["Action", "Drama", "Science Fiction", "Thriller"]
      )

      movies = Array.new(15, movie)

    Benchmark.ips do |x|
      x.report 'jbuilder' do

        render '/movies/movie.jbuilder', layout: false, locals: { movie: movie }
      end

      x.report 'active_model_serializers' do
        render text: MovieSerializer.new(movie).to_json
      end

      x.compare!
    end
  end

  desc "Benchamark single object (without render)"
  task single_object_without_render: :environment do

     movie = Movie.new(
        title: "Dawn of the Planet of the Apes",
        year: 2014,
        released: 1405062000,
        url: "http://trakt.tv/movie/dawn-of-the-planet-of-the-apes-2014",
        trailer: "http://youtube.com/watch?v=3wMnftb_RI4",
        runtime: 130,
        tagline: "One last chance for peace.",
        overview: "A group of scientists in San Francisco struggle to stay alive in the aftermath of a plague that is wiping out humanity, while Caesar tries to maintain dominance over his community of intelligent apes.",
        certification: "PG-13",
        imdb_id: "tt2103281",
        tmdb_id: "119450",
        poster: "http://slurm.trakt.us/images/posters_movies/211624.4.jpg",
        images: {
          poster: "http://slurm.trakt.us/images/posters_movies/211624.4.jpg",
          fanart: "http://slurm.trakt.us/images/fanart_movies/211624.4.jpg"
        },
        watchers: 33,
        ratings: {
          percentage: 80,
          votes: 1528,
          loved: 1456,
          hated: 72
        },
        genres: ["Action", "Drama", "Science Fiction", "Thriller"]
      )

      movies = Array.new(15, movie)

    Benchmark.ips do |x|
      x.report 'jbuilder' do
        Jbuilder.encode { |json|
          json.extract! movie, :title, :year, :released, :url, :trailer,
                               :runtime, :tagline, :overview, :certification,
                               :imdb_id, :tmdb_id, :poster, :images, :watchers,
                               :ratings, :genres
        }
      end

      x.report 'active_model_serializers' do
        MovieSerializer.new(movie).to_json
      end

      x.compare!
    end
  end

  desc "Benchamark array of objects (with render)"
  task array_of_objects_with_render: :environment do
     movie = Movie.new(
        title: "Dawn of the Planet of the Apes",
        year: 2014,
        released: 1405062000,
        url: "http://trakt.tv/movie/dawn-of-the-planet-of-the-apes-2014",
        trailer: "http://youtube.com/watch?v=3wMnftb_RI4",
        runtime: 130,
        tagline: "One last chance for peace.",
        overview: "A group of scientists in San Francisco struggle to stay alive in the aftermath of a plague that is wiping out humanity, while Caesar tries to maintain dominance over his community of intelligent apes.",
        certification: "PG-13",
        imdb_id: "tt2103281",
        tmdb_id: "119450",
        poster: "http://slurm.trakt.us/images/posters_movies/211624.4.jpg",
        images: {
          poster: "http://slurm.trakt.us/images/posters_movies/211624.4.jpg",
          fanart: "http://slurm.trakt.us/images/fanart_movies/211624.4.jpg"
        },
        watchers: 33,
        ratings: {
          percentage: 80,
          votes: 1528,
          loved: 1456,
          hated: 72
        },
        genres: ["Action", "Drama", "Science Fiction", "Thriller"]
      )

      movies = Array.new(15, movie)

    Benchmark.ips do |x|
      x.report 'jbuilder' do
        render '/movies/movies.jbuilder', layout: false, locals: { movies: movies }
      end

      x.report 'active_model_serializers' do
        render text: ActiveModel::ArraySerializer.new(movies, each_serializer: MovieSerializer).to_json
      end

      x.compare!
    end
  end

  desc "Benchamark array of objects (without render)"
  task array_of_objects_without_render: :environment do
     movie = Movie.new(
        title: "Dawn of the Planet of the Apes",
        year: 2014,
        released: 1405062000,
        url: "http://trakt.tv/movie/dawn-of-the-planet-of-the-apes-2014",
        trailer: "http://youtube.com/watch?v=3wMnftb_RI4",
        runtime: 130,
        tagline: "One last chance for peace.",
        overview: "A group of scientists in San Francisco struggle to stay alive in the aftermath of a plague that is wiping out humanity, while Caesar tries to maintain dominance over his community of intelligent apes.",
        certification: "PG-13",
        imdb_id: "tt2103281",
        tmdb_id: "119450",
        poster: "http://slurm.trakt.us/images/posters_movies/211624.4.jpg",
        images: {
          poster: "http://slurm.trakt.us/images/posters_movies/211624.4.jpg",
          fanart: "http://slurm.trakt.us/images/fanart_movies/211624.4.jpg"
        },
        watchers: 33,
        ratings: {
          percentage: 80,
          votes: 1528,
          loved: 1456,
          hated: 72
        },
        genres: ["Action", "Drama", "Science Fiction", "Thriller"]
      )

      movies = Array.new(15, movie)
      
    Benchmark.ips do |x|
      x.report 'jbuilder' do
        Jbuilder.encode { |json|
          json.array! movies do |movie|
            json.extract! movie, :title, :year, :released, :url, :trailer,
                                 :runtime, :tagline, :overview, :certification,
                                 :imdb_id, :tmdb_id, :poster, :images, :watchers,
                                 :ratings, :genres
          end
        }
      end

      x.report 'active_model_serializers' do
        ActiveModel::ArraySerializer.new(movies, each_serializer: MovieSerializer).to_json
      end

      x.compare!
    end
  end

end
