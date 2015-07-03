require 'sinatra'
require 'sinatra/reloader'
require 'streamio-ffmpeg'

get '/' do
  erb :index
end

post '/upload' do
  @filename = params[:media][:filename]
  file = params[:media][:tempfile]

  media = FFMPEG::Movie.new(file.path)

  if media.valid? then
    return "Movie duration: #{media.duration}"
  else
    return "Invalid File"
  end
end


