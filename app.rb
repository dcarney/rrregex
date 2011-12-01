require 'sinatra'
require 'cgi'
require 'json'

post '/match' do      
  opts = params.inject({}){ |h,(k,v)| h.merge(k => CGI::unescape(v)) }
  begin
    match = Regexp.new(opts['regex']).match(opts['test']) 
    (match ? [true, match.to_s, match.captures] : [false]).to_json
  rescue RegexpError => ex                                      
    [false, ex.message].to_json
  end  
end
