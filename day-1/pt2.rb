class FuelCalculator
	def self.calculate(mod)
    fuel_needed = (mod / 3.0).floor - 2

    return 0 if(fuel_needed <= 0)
    fuel_needed + FuelCalculator.calculate(fuel_needed)
  end
end

require 'csv'
puts CSV.read('data.txt').flatten.map(&:to_f).map { |m| FuelCalculator.calculate(m) }.sum
