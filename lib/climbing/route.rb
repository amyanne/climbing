class Climbing::Route
    attr_accessor :route_name, :grade, :location
	  @@all = []

	  def initialize(route_hash)
	    @route_name = route_hash[:name]
	    @grade = route_hash[:grade]
	    @location = route_hash[:location]
	    @@all << self
	  end

	  def self.all
	    @@all
	  end

	  def self.routes_by_grade(grade)
	    routes = self.all.select { |route| route.grade == grade }
	    if routes.any?
	      puts routes.map(&:route_name)
	    else
	      puts "No routes with grade: #{grade}"
	    end
	  end

	  def self.routes_by_location(location)
	    routes = self.all.select { |route| route.location.split(',').first&.include? location }
	    if routes.any?
	      puts routes.map(&:route_name)
	    else
	      puts "No routes in: #{location}"
	    end
	  end

end
