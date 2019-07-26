class Climbing::Scraper
    def self.scrape
        doc = Nokogiri::HTML(open('https://www.climbing.com/places/americas-100-best-sport-climbing-routes/'))
        raw_routes = []
        counter = 4
        100.times do
            raw_routes << doc.xpath("//*[@id='lyra-wrapper']/div/div[3]/section/div[2]/section[2]/article/div/div[2]/section/div[1]/div[2]/p[#{counter}]")
            counter += 1
        end

        raw_routes.each_with_index do |arr, index|
            route_hash = {}
            route_hash[:location] = raw_routes[index].first.css('em').text
            formatted_string =  raw_routes[index].first.css('a').children.text
            formatted_string = formatted_string.split("(")
            route_hash[:name] = formatted_string[0]
            route_hash[:grade] = formatted_string[1]&.tr('()', '')
             Climbing::Route.new(route_hash)
        end
     end
end 