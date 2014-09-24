class Picture < ActiveRecord::Base
#  include Rails.application.routes.url_helpers
  
  # Carrierwave config
  
  belongs_to :gallery
  
  validates :gallery, presence: true 
  mount_uploader :image, PictureUploader
  
#   PAPERCLIP config
#  has_attached_file :image,
#  :path => "rails_root/public/images/:id/:filename",
#  :url => "/images/:id/:filename"
#  :styles => { :large = "1200>", :thumb => "100x100#" }

  #  :presence => true,
#  :content_type => { :content_type => /\Aimage\/.*\Z/ }
  
#  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
  
#  def to_jq_upload
#    {
#      "name" => read_attribute(:image_file_name),
#      "size" => read_attribute(:image_file_size),
#      "url" => image.url(:original),
#      "delete_url" => picture_path(self),
#      "delete_type" => "DELETE"
#      }
#  end

end
