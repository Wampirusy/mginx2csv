class NginxParser
  @patterns = {
    :ip => '(?<ip>\d+\.\d+\.\d+\.\d+)',
    :date => '\[(?<date>[^\[]+)\]',
    :url => '(?<url>[/\w]+)',
    
  }
  
#10.12.0.31 - - [15/Nov/2017:06:07:34 +0200] "GET /statistics/details/ HTTP/1.1" 200 12750 "https://portal.hyber.im/statistics/reports" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36"
#10.12.0.31 - - [15/Nov/2017:06:07:34 +0200] "GET /favicon.ico?2.1.1-patch HTTP/1.1" 200 1659 "https://portal.hyber.im/statistics/details/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36"
#10.12.0.31 - - [15/Nov/2017:06:07:34 +0200] "POST /statistics/details/ HTTP/1.1" 200 17474 "https://portal.hyber.im/statistics/details/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36"
  
  def parse text
    parts = [
  '^','(?<ip>\d+\.\d+\.\d+\.\d+)','[-\s]+','\[(?<date>[^\[]+)\]',
  '["\s]+','(?<method>\w+)','\s+','(?<page>[/\w]+)','\s+','(?<protocol>[/\.\w]+)',
  
  
  '.*'
]
  p reg = Regexp.new(parts.join)
  
  p text =~ reg, Regexp.last_match#, Regexp.last_match[:cc]

    if  text =~ reg
      {      
      :date => Regexp.last_match[:date],
      :ip => Regexp.last_match[:ip],
      :url => :url
      }
    end
  end
end