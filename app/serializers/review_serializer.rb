class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :score, :city_id
end
