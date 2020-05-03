class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        # will include the bird and location object 
        # will have a bird/location key pointing to a hash
        render json: SightingSerializer.new(sightings).to_serialized_json
    end

    def show
        sighting = Sighting.find_by(id: params[:id])

        if sighting 
            render json: SightingSerializer.new(sighting).to_serialized_json
        else
            render json: {message: 'No sighting found at that id'}
        end
    end
end
