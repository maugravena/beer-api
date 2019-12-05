module Api
  module V1
    class ApiController < ApplicationController
      include Response
      include ExceptionHandler
    end
  end
end
