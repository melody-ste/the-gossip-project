class Gossip < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :gossip_tags, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tags, through: :gossip_tags
end
