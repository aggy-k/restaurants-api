json.restaurants do
  json.array! @restaurants do |r|
    json.extract! r, :id, :name, :address, :image, :description
  end
end
