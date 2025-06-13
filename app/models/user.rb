class User < ApplicationRecord

    
  def remember(token)
    self.remember_digest = User.digest(token)
    save(validate: false)
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  
  def authenticated?(token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(token)
  end


  
  def authenticated?(token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(token)
  end
 

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
  has_many :likes, dependent: :destroy
end
