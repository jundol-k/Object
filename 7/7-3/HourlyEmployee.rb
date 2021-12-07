require './Employee'

class HourlyEmployee < Employee
    attr_reader :timeCard
    def initialize(name, basePay, timeCard)
        super(name, basePay)
        @timeCard = timeCard
    end

    def calculatePay(taxRate)
        return (basePay * timeCard) - (basePay * timeCard) * taxRate
    end

    def monthlyBasePay()
        return 0
    end
end
