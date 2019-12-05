module Response
  def json_response(item, status = :ok)
    render json: item, status: status
  end
end
