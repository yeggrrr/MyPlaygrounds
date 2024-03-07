import Foundation
// (Lv 1-2) + (Lv 3)
class Calculator {
    var addOperation: AddOperation
    var substractOperation: SubstractOperation
    var multiplyOperation: MultiplyOperation
    var divideOperation: DivideOperation
    
    init(addOperation: AddOperation, substractOperation: SubstractOperation, multiplyOperation: MultiplyOperation, divideOperation: DivideOperation) {
        self.addOperation = addOperation
        self.substractOperation = substractOperation
        self.multiplyOperation = multiplyOperation
        self.divideOperation = divideOperation
    }
    
//    enum Operator {
//        case add
//        case substract
//        case multiply
//        case divide
//        case remainder
//    }
    
//    func calculate(op: Operator, firstNum: Double, secondNum: Double) -> Double {
//        switch op {
//        case .add:
//            return firstNum + secondNum
//        case .substract:
//            return firstNum - secondNum
//        case .multiply:
//            return firstNum * secondNum
//        case .divide:
//            if secondNum == 0 {
//                return 0
//            }
//            
//            return firstNum / secondNum
//        case.remainder:
//            return firstNum.truncatingRemainder(dividingBy: secondNum)
//            
//        }
//    }
}

class AddOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum + secondNum
    }
}

class SubstractOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum - secondNum
    }
}

class MultiplyOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum * secondNum
    }
}

class DivideOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum / secondNum
    }
}


let addOperation = AddOperation()
let substractOperation = SubstractOperation()
let multiplyOperation = MultiplyOperation()
let divideOperation = DivideOperation()

let calculator = Calculator(addOperation: addOperation, substractOperation: substractOperation, multiplyOperation: multiplyOperation, divideOperation: divideOperation)

calculator.addOperation.operate(firstNum: 10, secondNum: 5)
calculator.substractOperation.operate(firstNum: 10, secondNum: 5)
calculator.multiplyOperation.operate(firstNum: 10, secondNum: 5)
calculator.divideOperation.operate(firstNum: 10, secondNum: 5)

//let addResult = calculator.calculate(op: .add, firstNum: 10, secondNum: 5)
//let subtractResult = calculator.calculate(op: .substract, firstNum: 10, secondNum: 5)
//let multiplyResult = calculator.calculate(op: .multiply, firstNum: 10, secondNum: 5)
//let divideResult = calculator.calculate(op: .divide, firstNum: 10, secondNum: 5)
//let remainderResult = calculator.calculate(op: .remainder, firstNum: 10, secondNum: 3)
