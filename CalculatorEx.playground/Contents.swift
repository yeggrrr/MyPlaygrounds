class Calculator {
    enum Operator {
        case add
        case substract
        case multiply
        case divide
        case remainder
    }
    
    func calculate(op: Operator, firstNum: Double, secondNum: Double) -> Double {
        switch op {
        case .add:
            return firstNum + secondNum
        case .substract:
            return firstNum - secondNum
        case .multiply:
            return firstNum * secondNum
        case .divide:
            if secondNum == 0 {
                return 0
            }
            
            return firstNum / secondNum
        case.remainder:
            return firstNum.truncatingRemainder(dividingBy: secondNum)
            
        }
    }
}

let calculator = Calculator()
let addResult = calculator.calculate(op: .add, firstNum: 10, secondNum: 5)
let subtractResult = calculator.calculate(op: .substract, firstNum: 10, secondNum: 5)
let multiplyResult = calculator.calculate(op: .multiply, firstNum: 10, secondNum: 5)
let divideResult = calculator.calculate(op: .divide, firstNum: 10, secondNum: 5)
let remainderResult = calculator.calculate(op: .remainder, firstNum: 10, secondNum: 3)


