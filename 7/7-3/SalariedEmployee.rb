require './Employee'

class SalariedEmployee < Employee
    def initialize(name, basePay)
        super(name, basePay)
    end

    def calculatePay(taxRate)
        return basePay - (basePay * taxRate)
    end

    def monthlyBasePay()
        return basePay
    end
end