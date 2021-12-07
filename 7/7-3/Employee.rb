class Employee
    attr_reader :name, :basePay

    def initialize(name, basePay)
        @name = name
        @basePay = basePay
    end

    def calculatePay(taxRate)
        raise NotImplementedError
    end

    def monthlyBasePay()
        raise NotImplementedError
    end
end