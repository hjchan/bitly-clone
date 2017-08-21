require 'uri'

class ValidUrl < ActiveModel::Validator
	def validate(record)
		uri = URI.parse(record.ori_url)
		uri = URI.parse(record.ori_url) && !uri.host.nil?
	rescue URI::InvalidURIError
		false
	end
end

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :ori_url, 
		presence: true,
		format: { with: /\Ahttp:\/\//,
				 	message: "Wrong format"}
	validates_with ValidUrl
	before_create	:shorten

	def shorten
		new_url = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
		self[:short_url] = new_url
	end
end

url = Url.new(ori_url: "abc")