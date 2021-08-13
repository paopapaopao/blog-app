class Article < ApplicationRecord
  attr_accessor :tags_attributes

  validates :name, presence: true, uniqueness: true
  validates :body, presence: true, length: {minimum: 5}

  has_many :comments, :dependent => :destroy
  has_many :tags

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end