class SightingSerializer
# whenever we instantiate a new instance of this class,
# store that instance as @sighting
  def initialize(sighting_object)
    @sighting = sighting_object
  end

# moving repetitive logic from controller actions into a single method
  def to_serialized_json
    @sighting.to_json(:include => {
      :bird => {:only => [:name, :species]},
      :location => {:only => [:latitude, :longitude]}}, :except => [:updated_at])
  end

end
