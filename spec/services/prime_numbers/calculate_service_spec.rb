RSpec.describe PrimeNumbers::CalculateService do
  subject { described_class }

  context 'valid params' do
    it 'should return arr or prime numbers from string that could be converted to int' do
      result = subject.call('12')

      expect(result.success?).to be_truthy
      expect(result.prime_numbers).to be_kind_of(Array)
      expect(result.prime_numbers).to eql([2,3,5,7,11])
    end

    it 'should return arr or prime numbers from int' do
      result = subject.call(12)

      expect(result.success?).to be_truthy
      expect(result.prime_numbers).to be_kind_of(Array)
      expect(result.prime_numbers).to eql([2,3,5,7,11])
    end

    it 'should return empty arr from 1' do
      result = subject.call(1)

      expect(result.success?).to be_truthy
      expect(result.prime_numbers).to be_kind_of(Array)
      expect(result.prime_numbers).to eql([])
    end

    it 'should return empty arr from minus integer' do
      result = subject.call('-44')

      expect(result.success?).to be_truthy
      expect(result.prime_numbers).to be_kind_of(Array)
      expect(result.prime_numbers).to eql([])
    end
  end

  context 'invalid params' do
    it 'should return error on argument wrong type (not convertable string)' do
      result = subject.call('hello')

      expect(result.failure?).to be_truthy
      expect(result.prime_numbers).to be_kind_of(Array)
      expect(result.errors.first).to eql("Expect integer argument")
    end

    it 'should return error on argument wrong type (nil)' do
      result = subject.call(nil)

      expect(result.failure?).to be_truthy
      expect(result.prime_numbers).to be_kind_of(Array)
      expect(result.errors.first).to eql("Expect integer argument")
    end
  end
end
