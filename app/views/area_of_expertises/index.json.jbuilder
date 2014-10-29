json.array!(@area_of_expertises) do |area_of_expertise|
  json.extract! area_of_expertise, :id, :Title, :Filed, :Domain
  json.url area_of_expertise_url(area_of_expertise, format: :json)
end
