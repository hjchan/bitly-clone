# require "activerecord-import/base"

# f = File.open("db/url_test")
# data = []
# Url.transaction do
# 	f.each do |x| 
# 		new_url = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
# 		data << [x, new_url]
# 	end
# 	columns = [:ori_url, :short_url]
# 	Url.import columns, data, validate: false
# end
p Time.now
start_time = Time.now
f = File.open("db/url_test")
data_string = "INSERT INTO urls (ori_url,short_url,created_at,updated_at) VALUES "

f.each do |x|
	new_url = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
	data_string << "('" + x + "','" + new_url + "','" + Time.now.to_s + "','" + Time.now.to_s + "'),"
end
data_string[-1] = ';'
ActiveRecord::Base.connection.execute(data_string)
puts Time.now - start_time