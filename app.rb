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
  return { :result => false}.to_json if empty_fields? ['regex','test']

  params.each{ |k,v| params[k] = CGI::unescape(v)}
  begin
    opts = params['opts'].split(//).map{ |c| OPTMAP[c] }.reduce{ |x, n| x | n }
    regexp = Regexp.new "#{params['regex']}"
    match = regexp.match(params['test'])

    if match
      { :result => true, :match => match.to_s, :captures => params['test'].scan(regexp) }.to_json
    else
      { :result => false}.to_json
    end
  rescue RegexpError => ex
    { :result => false, :error => ex.message}.to_json
  end
end

helpers do
  def empty_fields? fields
    fields.each do |field|
      return true if params[field].to_s.empty?
    end

    false
  end
end
