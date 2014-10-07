class Gallery < ActiveRecord::Base
 
  has_many :pictures, :inverse_of => :gallery, :dependent => :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true;  
end
