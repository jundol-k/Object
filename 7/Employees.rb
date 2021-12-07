module Employees
    # 전역변수 였던 것들을 모듈 내부로 숨겼다.
    $employees = ["직원A", "직원B", "직원C", "아르바이트D", "아르바이트E", "아르바이트F"] 
    $basePays = [400, 300, 250, 1, 1, 1.5]
    $hourlys = [false, false, false, true, true, true] # 정직원과 알바를 구분하는 전역변수
    $timeCards = [0, 0, 0, 120, 120, 120] # 알바의 급여를 계산하기 위한 한달 간의 업무 누적 시간

=begin
하향식 프록그래밍의 문제점: 새로운 기능인 모든 직원의 급여 총합을 계산하는 니즈가 생겼을 경우
메인 함수에서 이 함수를 호출할 마땅한 공간을 찾기가 어렵다.
해결방법: 기존의 메인 함수의 로직 전체를 calculatePay라는 새로운 함수로 추출한 후 적절하게 개별 직원 급여 조회와
모든 직원 급여 조회를 호출하도록 수정.
=end
    def Employees.calculatePay(name, taxRate) # 하향식 프로그래밍의 단점을 수정하기 위한 함수 (기존의 메인 함수의 로직이 이곳으로 이전했다.)
        if (Employees.hourly?(name)) then 
            pay = Employees.calculateHourlyPayFor(name, taxRate)
        else
            pay = Employees.calculatePayFor(name, taxRate) # 직원의 급여를 계산한다.
        end
        return pay
    end

    # 정직원과 알바 직원 판단 함수. 알바이면 true 반환.
    def Employees.hourly?(name)
        return $hourlys[$employees.index(name)]
    end

    # 알바 급여 계산
    def Employees.calculateHourlyPayFor(name, taxRate)
        index = $employees.index(name)
        basePay = $basePays[index] * $timeCards[index]
        return basePay - (basePay * taxRate)
    end

    def Employees.calculatePayFor(name, taxRate)
        index = $employees.index(name) # 전역 변수에 저장된 직원의 기본급 정보를 얻는다.
        basePay = $basePays[index] # 급여를 계산한다.
        return basePay - (basePay * taxRate)
    end

    def Employees.sumOfBasePays() 
        result = 0
        for name in $employees
            if (not hourly?(name)) then
                result += $basePays[$employees.index(name)]
            end
        end
        return result
    end
end