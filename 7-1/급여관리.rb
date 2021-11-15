$employees = ["직원A", "직원B", "직원C"]
$basePays = [400, 300, 250]
def main(operation, args={})
    case(operation)
    when :pay then calculatePay(args[:name])
    when :basePays then sumOfBasePays()
    end
end

def calculatePay(name) # 하향식 프로그래밍의 단점을 수정하기 위한 함수 (기존의 메인 함수의 로직이 이곳으로 이전했다.)
    taxRate = getTaxRate() # 사용자로부터 소득 세율을 입력받는다.
    pay = calculatePayFor(name, taxRate) # 직원의 급여를 계산한다.
    puts(describeResult(name, pay)) # 양식에 맞게 결과를 출력한다.
end

def getTaxRate()
    print("세율을 입력하세요: ") # 세율 입력을 위한 문장을 화면에 출력한다.
    return gets().chomp().to_f() # 키보드를 통해 세율을 입력받는다.
end

def calculatePayFor(name, taxRate)
    index = $employees.index(name) # 전역 변수에 저장된 직원의 기본급 정보를 얻는다.
    basePay = $basePays[index] # 급여를 계산한다.
    return basePay - (basePay * taxRate)
end

def describeResult(name, pay)
    return "이름: #{name}, 급여: #{pay}" # 형식에 따라 출력 문자열을 생성한다.
end

=begin
하향식 프록그래밍의 문제점: 새로운 기능인 모든 직원의 급여 총합을 계산하는 니즈가 생겼을 경우
메인 함수에서 이 함수를 호출할 마땅한 공간을 찾기가 어렵다.
해결방법: 기존의 메인 함수의 로직 전체를 calculatePay라는 새로운 함수로 추출한 후 적절하게 객별 직원 급여 조회와
모든 직원 급여 조회를 호출하도록 수정.
=end
def sumOfBasePays() 
    result = 0
    for basePay in $basePays
        result += basePay
    end
    puts(result)
end

# 기본급의 총합 구하기
main(:basePays)

# 개별 직원의 급여 구하기
main(:pay, name:"직원A")