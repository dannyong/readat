class Comment < ApplicationRecord
	belongs_to :write
	belongs_to :user 
end
