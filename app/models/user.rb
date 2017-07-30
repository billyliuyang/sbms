class User < ApplicationRecord
  has_one :emotion, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  has_secure_password
  before_create :build_default_emotion

  private

  	def build_default_emotion
  		build_emotion
  		true
  	end

end
