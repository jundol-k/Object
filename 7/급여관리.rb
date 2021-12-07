require './Employees'

def main(operation, args={})
    case(operation)
    when :pay then calculatePay(args[:name])
    when :basePays then sumOfBasePays()
    end
end

def calculatePay(name)
    taxRate = getTaxRate() # 사용자로부터 소득 세율을 입력받는다.
    pay = Employees.calculatePay(name, taxRate)
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
    puts(Employees.sumOfBasePays())
end

# 기본급의 총합 구하기
main(:basePays)

# 개별 직원의 급여 구하기
main(:pay, name:"직원A")
