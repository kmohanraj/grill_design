class Window < ApplicationRecord

	 attr_accessor :window

	has_many :windows

	mount_uploader :image, ImageUploader


	def update_attributes(attributes)
       self.window = window
       save
    end

end
