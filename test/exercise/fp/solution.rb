module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_array = array.select do |film|
          !film['country'].nil? &&
            film['country'].split(',').size >= 2 &&
            !film['rating_kinopoisk'].nil? &&
            !film['rating_kinopoisk'].to_f.zero?
        end

        total_rating = filtered_array.reduce(0) do |sum, film|
          sum + film['rating_kinopoisk'].to_f
        end

        total_rating / filtered_array.size
      end

      def chars_count(films, threshold)
        filtered_films = films.select do |film|
          !film['rating_kinopoisk'].nil? &&
            film['rating_kinopoisk'].to_f >= threshold
        end
        filtered_films.reduce(0) do |sum, film|
          sum + film['name'].count('и')
        end
      end
    end
  end
end
