json.array!(@books) do |book|
  json.extract! book, :id, :name, :release_date
  json.url book_url(book, format: :json)
end
