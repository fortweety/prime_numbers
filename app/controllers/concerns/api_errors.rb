module ApiErrors
  def error_response(error_messages, status)
    errors = ErrorSerializer.from_messages(error_messages)

    render json: errors, status: status
  end
end
