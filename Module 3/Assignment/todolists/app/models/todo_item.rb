class TodoItem < ActiveRecord::Base
	def self.get_count
		TodoItem.where(completed: true).count
	end
end
