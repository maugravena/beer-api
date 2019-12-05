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
    end
  end
end
