require 'sinatra'
require 'cgi'
require 'json'

OPTMAP = {
  'i' => Regexp::IGNORECASE,
  'x' => Regexp::EXTENDED,
  'm' => Regexp::MULTILINE
}

get '/' do
  redirect to('/index.html')
end

post '/match' do
  params.each{ |k,v| params[k] = CGI::unescape(v)}
  begin
    opts = params['opts'].split(//).map{ |c| OPTMAP[c] }.reduce{ |x, n| x | n }
    match = Regexp.new("#{params['regex']}", opts).match(params['test'])
    if match
      { :result => true, :match => match.to_s, :captures => match.captures }.to_json
    else
      { :result => false}.to_json
    end
  rescue RegexpError => ex
    { :result => false, :error => ex.message}.to_json
  end
end
