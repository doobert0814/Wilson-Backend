class MovieSerializer < ActiveModel::Serializer
  attributes :id, :genre_ids, :overview, :poster_path, :backdrop_path, :title
end
