require 'open-uri'
require 'uri'
require 'nokogiri'

require 'multi_translate/language_pairs.rb'
require 'multi_translate/languages.rb'
require 'multi_translate/engines.rb'

module MultiTranslate
  # Performs a translation between "from" and "to" languages, using "text" as the input, and using "engine"
  # as translation engine.
  # You must check that the input and output languages are supported by the selected translation engine. Otherwise
  # this method will raise an exception.
  def self.translate(engine, from, to, text)
    if from == Languages::AUTODETECT && engine !=  Engines::GOOGLE
      raise "The autodetect feature is only available for the Google engine"
    end

    raise "You can't use autodetect for the destination laguage" if to ==  Languages::AUTODETECT
    raise "There is no engine called #{engine}" unless LANGUAGE_PAIRS[engine]
    unless LANGUAGE_PAIRS[engine].include?([from, to])
      raise "There is no such language pairs (#{from}, #{to}) for the engine #{engine}"
    end

    begin
      case engine
      when Engines::APERTIUM
        url = "http://xixona.dlsi.ua.es/webservice/ws.php?mode=#{from}-#{to}&format=txt&text=#{text}"
        result = open(URI.escape(url), {'User-Agent' => 'apertium2perl'}).read.strip
        return result
      when Engines::GOOGLE
        url =  "http://translate.google.com/?langpair=#{from}|#{to}&text=#{text}"
        doc = Nokogiri::HTML(open(URI.escape(url)))
        result = doc.search('//span[@id="result_box"]').text
        return result
      end
     rescue OpenURI::HTTPError
      return ''
    end
  end
end
