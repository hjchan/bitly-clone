get '/' do
  @url_all = Url.all
  erb :"static/index"
end

post '/urls' do
	url = Url.new(ori_url: params[:long_url])
	if url.save
		# redirect "/"
		url.to_json
	else
  		@url = url
  		@url_all = Url.all
  		erb :"static/index"
	end
end

# get '/new_url/:id' do
# 	@url = Url.find(params[:id])
# 	erb :"static/new_url"
# end

get '/:short_url' do
	short_url = params[:short_url]
	url = Url.find_by short_url: short_url
	url.click_count += 1
	url.save
	redirect url.ori_url
end