module Api
  module V1
    class BeersController < ApiController
      before_action :set_beer, only: [:show, :update]

      def index
        @beers = Beer.all
        json_response(@beers)
      end

      def show
        json_response(@beer)
      end

      def create
        @beer = Beer.create!(beer_params)
        json_response(@beer, :created)
      end

      def update
        @beer = Beer.update(beer_params)
        head :no_content
      end

      private
        def set_beer
          @beer = Beer.find(params[:id])
        end

        def beer_params
          params.permit(:style, :min_temperature, :max_temperature)
        end
    end
  end
end
