class User < ApplicationRecord
  #validation
  validates :email, presence: true, uniqueness:true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
  
  #relation
  belongs_to :city
  has_many :comments
  has_many :gossips
  has_many :sent_messages, class_name: "PrivateMessage", foreign_key: :sender_id
  has_many :received_messages, through: :join_table_recipient_pms, source: :private_message
end
