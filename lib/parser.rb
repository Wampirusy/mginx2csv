class NginxParser

  def headers
    patterns.keys
  end

  def parse text
    reg = Regexp.new(
      "^#{patterns[:ip]}[-\s]+#{patterns[:auth]}\s\\[#{patterns[:date]}\\]\s"+
      "\"#{patterns[:method]}\s#{patterns[:url]}\s#{patterns[:protocol]}\""+
      "\s#{patterns[:code]}\s#{patterns[:size]}\s\"#{patterns[:referer]}\"\s"+
      "\"#{patterns[:agent]}\s?(?=(\\()#{patterns[:os]}\\)\s*#{patterns[:other]}|(?<os>)#{patterns[:other]})"
    )

    if text =~ reg
      headers.map {|pattern| Regexp.last_match[pattern]}
    end
  end

  private
  def patterns
    {
      :ip => '(?<ip>\d+\.\d+\.\d+\.\d+)',
      :auth => '(?<auth>[^\s]+)',
      :date => '(?<date>[^\]]+)',
      :method => '(?<method>\w+)',
      :url => '(?<url>[^\s]+)',
      :protocol => '(?<protocol>[/\.\w]+)',
      :code => '(?<code>\d+)',
      :size => '(?<size>\d+)',
      :referer => '(?<referer>[^\s]+)',
      :agent => '(?<agent>[^\s("]+)',
      :os => '(?<os>[^()"]*)',
      :other => '(?<other>[^"]*)',
    }
  end
end