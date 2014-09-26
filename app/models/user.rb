class User < ActiveRecord::Base
  has_many :galleries
   validates :name, presence: true
end
