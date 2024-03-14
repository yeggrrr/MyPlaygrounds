import Foundation
// 숫자 야구 게임 만들기 Lv2
// Lv2 정답을 맞추기 위해 3자리를 입력하고 힌트 받기

var randomNums: Set<Int> = [] // 중복없이 랜덤 숫자 3개 담을 곳
var answerNums: [Int] = []  // 정답 저장할 변수 생성

// 숫자 3개 랜덤으로 뽑기
while randomNums.count < 3 {
    let num = Int.random(in: 1...9)
    randomNums.insert(num)
}

// 랜덤으로 받은 숫자 -> 정답 변수에 담기
answerNums = Array(randomNums)
print("정답: \(answerNums)") // 정답

// 사용자에게 입력 받은 값으로 while문 안에서 함수 실행
var isRunning = true  // true로 설정해놓고 while문이 계속 돌도록 만들기
while isRunning {
    print("숫자를 입력하세요!")
    let userInputNums = readLine()!
    let result = chkStrikeAndBall(userInputNums: userInputNums)
    print(result)
}

func chkStrikeAndBall(userInputNums: String) -> String {
    // 숫자가 아닌 경우, 3자리가 아닌 경우, 0을 포함한 경우, 특정 숫자를 중복 사용한 경우
    if Int(userInputNums) == nil || userInputNums.count != 3 || userInputNums.contains("0") || userInputNums.count != Set(userInputNums).count {
        return "올바르지 않은 입력값입니다."
    } else {
        // 사용자에게 입력받은 값을 [Int]로 만듬.
        var inputNums: [Int] = []
        
        for char in userInputNums {
            let str = String(char)
            guard let num = Int(str) else {
                return "올바르지 않은 입력값입니다."
            }
            
            inputNums.append(num)
        }
        isRunning = answerNums != inputNums  // 입력값과 정답이 다르면 isRunning = false -> while문이 안 끝남.
        
        var strikeCount: Int = 0
        var ballCount: Int = 0
        var sameNumCount: Int = 0
        
        // inputNums와 answer을 비교 -> strike 갯수 세기
        for i in 0..<inputNums.count {
            let num = inputNums[i]
            let answer = answerNums[i]
            
            // 같은 자리, 숫자인 경우
            if num == answer {
                strikeCount += 1
            }
            
            // answerNums배열이 num을 가지고 있는지?
            if answerNums.contains(num) {
                sameNumCount += 1
            }
        }
        
        // inputNums와 answer을 비교 -> ball 갯수 세기
        ballCount = sameNumCount - strikeCount
        
        // Strike, Ball, Nothing 판단하기
        if strikeCount == 0, ballCount == 0 {
            return "Nothing"
        } else {
            if strikeCount == 0 {
                return "\(ballCount)볼"
            } else if ballCount == 0 && strikeCount != 3 {
                return "\(strikeCount)스트라이크"
            } else if strikeCount == 3 {
                return "정답입니다!!"
            } else {
                return "\(strikeCount)스트라이크 \(ballCount)볼"
            }
        }
    }
}


