require 'prime'

module PrimeNumbers
  class CalculateService < BasicService
    def initialize(number)
      super
      @number = Integer(number) rescue false
      @prime_numbers ||= []
    end

    attr_reader :prime_numbers

    def call
      fill_prime_numbers
      super
    end

    private

    def fill_prime_numbers
      return fail!("Expect integer argument") unless @number
      Prime.each(@number) do |prime_num|
        @prime_numbers << prime_num
      end
    end
  end
end