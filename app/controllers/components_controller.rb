class ComponentsController < ApplicationController
  def index; end

  def prime_numbers
    result = PrimeNumbers::CalculateService.call(
      number_params
    )

    if result.success?
      render json: { data: result.prime_numbers }
    else
      error_response(result.errors, :unprocessable_entity)
    end
  end

  private

  def number_params
    params.require(:number)
  end
end