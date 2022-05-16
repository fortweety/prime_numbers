class BasicService
  def self.call(*params)
    new(*params).call
  end

  attr_reader :errors

  def initialize(*params)
    @errors = []
  end

  def call
    self
  end

  def success?
    !failure?
  end

  def failure?
    @errors.any?
  end

  private

  def fail!(messages)
    @errors += Array(messages)
    self
  end
end
