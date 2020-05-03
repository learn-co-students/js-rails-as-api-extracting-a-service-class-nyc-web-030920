class SightingSerializer

  def initialize(sighitng_object)
    @sighting = sighitng_object
  end

  def to_serialized_json
    options = {
      # will have sighting properties first, except updated_at
      include: {
        bird: {only: [:name, :species]}, 
        location: {only: [:latitude, :longitude]}
        }, 
        except: [:updated_at]
    }

    @sighting.to_json(options)
  end
end
