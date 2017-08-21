require 'fileutils'
require 'tempfile'

t_file = Tempfile.new('filename_temp.txt')
File.open("db/url_test", 'r') do |f|
	f.each_line{|line| t_file.puts line.gsub!(/[()\,]/,'') }
end
t_file.close
FileUtils.mv(t_file.path, "db/url_test")