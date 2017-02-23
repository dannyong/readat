class Comment < ApplicationRecord
	belongs_to :writer
	belongs_to :user 
end
