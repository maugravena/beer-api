module Api
  module V1
    class BeersController < ApiController
      def index
        @beers = Beer.all
        json_response(@beers)
      end

      def show
        @beer = Beer.find(params[:id])
        json_response(@beer)
      end

      def create
        @beer = Beer.create!(beer_params)
        json_response(@beer, :created)
      end

      private
        def beer_params
          params.permit(:style, :min_temperature, :max_temperature)
        end
    end
  end
end
