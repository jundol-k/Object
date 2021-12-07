Employee = Struct.new(:name, :basePay, :hourly, :timeCard) do
    def monthlyBasePay()
        if (hourly) then return 0 end
            return basePay
    end

    def calculatePay(taxRate)
        if (hourly) then 
            return calculateHourlyPay(taxRate)
        end
        return calculateSalariedPay(taxRate) # 직원의 급여를 계산한다.
    end
private
    # 알바 급여 계산
    def calculateHourlyPay(taxRate)
        return (basePay * timeCard) - (basePay * timeCard) * taxRate
    end

    def calculateSalariedPay(taxRate)
        return basePay - (basePay * taxRate)
    end
end