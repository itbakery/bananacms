class Post
  include Mongoid::Document
  field :title, type: String
  field :slug, type: String
  field :content, type: String
  field :published, type: Mongoid::Boolean
  field :visibility, type: Mongoid::Boolean
  field :published_on, type: Date
  field :unpublished_on, type: Date
end
