class FuelCalculator
  def self.calculate(mod)
    (mod / 3.0).floor - 2
  end
end

require 'csv'
puts CSV.read('data.txt').flatten.map(&:to_f).map { |m| FuelCalculator.calculate(m) }.sum
