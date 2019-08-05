require 'nokogiri'
require 'open-uri'

class Scraper
  def initialize(base_url)
    @base_url = base_url
  end

  def fetch_search_page(player_name)
    url = @base_url + player_name.gsub(" ", "%20")
    raw_html = open(url).read
    document = Nokogiri::HTML(raw_html)
  end

  def fetch_player_details(search_page)
    search_page.search()
  end
end
