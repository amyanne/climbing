class Climbing::CLI

	  def run
	    Climbing::Scraper.scrape
	    prompt_user_input
	  end

	  private

	  def prompt_user_input
	    puts  "Welcome to Climbing Route!\n"\
	          "Type in 'routes' to get a list of all the routes.\n"\
	          "Type in 'grades' to get a list of all the grades.\n"\
	          "Type in 'locations' to get a list of all the locations.\n"\
	          "Type in'routes by grade' to get a list of all routes in that grade.\n"\
	          "Type in 'routes by location' to get a list of all routes in that location.\n"\
	          "Type in 'exit!' to quit."
	    while true
	      case gets.chomp
	        when "routes"
	          puts Climbing::Route.all.map(&:route_name).uniq
	        when "grades"
	          puts Climbing::Route.all.map(&:grade)
	        when "locations"
	          puts Climbing::Route.all.map(&:location)
	        when "routes by grade"
	          puts "Please enter a grade"
	          route_grade = gets.chomp
	          Climbing::Route.routes_by_grade(route_grade)
	        when "routes by location"
	          puts "Please enter a city"
	          route_location = gets.chomp
	          CLimbing::Route.routes_by_location(route_location)
	        when "exit!"
	          return
	        else
	          puts "Please put a valid command"
	      end
	      puts "anything else?  Type exit! to exit"
	    end
	  end
	end
