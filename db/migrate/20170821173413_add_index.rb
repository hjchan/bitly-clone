class AddIndex < ActiveRecord::Migration[5.0]
	def change
		add_index :urls, :short_url
	end
end
