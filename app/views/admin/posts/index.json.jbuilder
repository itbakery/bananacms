json.array!(@posts) do |post|
  json.extract! post, :title, :slug, :content, :published, :visibility, :published_on, :unpublished_on
  json.url post_url(post, format: :json)
end