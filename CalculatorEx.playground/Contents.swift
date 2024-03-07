import Foundation
// (Lv 3)
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
