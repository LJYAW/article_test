class Article < ApplicationRecord
  include Filterable
  validates :title, presence: true
  validates :short_title, presence: true
  validates :keywords, presence: true
  validates :description, presence: true
  validates :content, presence: true
end
