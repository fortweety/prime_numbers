require 'prime'

module PrimeNumbers
  class CalculateService < BasicService
    def initialize(number)
      super
      @number = Integer(number) rescue false
      @prime_numbers ||= []
      @circle_prime_numbers ||= []
    end

    attr_reader :circle_prime_numbers

    def call
      find_circle_prime_numbers
      super
    end

    private

    def fill_prime_numbers
      return fail!("Expect integer argument") unless @number
      Prime.each(@number) do |prime_num|
        @prime_numbers << prime_num
      end
    end

    def find_circle_prime_numbers
      fill_prime_numbers
      @prime_numbers.each do |number|
        str_number = number.to_s
        if str_number.length == 1
          @circle_prime_numbers << number
        else
          loop_time = str_number.length - 1
          index = 1
          circle = true
          loop_time.times do
            next_prime_number = "#{str_number[index..loop_time]}#{str_number[0...index]}".to_i
            if next_prime_number < @number
              circle = false && break unless @prime_numbers.include?(next_prime_number)
            else
              circle = false && break unless Prime.prime?(next_prime_number)
            end
            index += 1
          end
          @circle_prime_numbers << number if circle
        end
      end
    end
  end
end