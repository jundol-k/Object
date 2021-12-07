require './SalariedEmployee'
require './HourlyEmployee'

$employees = [
    SalariedEmployee.new("직원A", 400),
    SalariedEmployee.new("직원B", 300),
    SalariedEmployee.new("직원D", 250),
    HourlyEmployee.new("알바D", 1, 120),
    HourlyEmployee.new("알바E", 1, 120),
    HourlyEmployee.new("알바F", 1, 120)
]

def main(operation, args={})
    case(operation)
    when :pay then calculatePay(args[:name])
    when :basePays then sumOfBasePays()
    end
end

def calculatePay(name)
    taxRate = getTaxRate() # 사용자로부터 소득 세율을 입력받는다.
    for each in $employees
        if (each.name == name) then employee = each; break end
    end
    pay = employee.calculatePay(taxRate)
    puts(describeResult(name, pay)) # 양식에 맞게 결과를 출력한다.
end

def getTaxRate()
    print("세율을 입력하세요: ") # 세율 입력을 위한 문장을 화면에 출력한다.
    return gets().chomp().to_f() # 키보드를 통해 세율을 입력받는다.
end

def describeResult(name, pay)
    return "이름: #{name}, 급여: #{pay}" # 형식에 따라 출력 문자열을 생성한다.
end

def sumOfBasePays()
    result = 0
    for each in $employees
        result += each.monthlyBasePay()
    end
    puts(result)
end

# 기본급의 총합 구하기
main(:basePays)

# 개별 직원의 급여 구하기
main(:pay, name:"알바E")
