import Foundation
// 숫자 야구 게임 만들기 Lv3 ~ 6

func makeRandomNums() -> [Int] {
    var randomNums: Set<Int> = []
    
    // 랜덤 숫자 3개 뽑기
    while randomNums.count < 3 {
        if randomNums.count == 0 {
            let num = Int.random(in: 1...9)
            randomNums.insert(num)
        } else {
            let num = Int.random(in: 0...9)
            randomNums.insert(num)
        }
    }
    return Array(randomNums)
}

// 1. 게임 시작
func startGame() {
    // 랜덤 숫자 뽑기
    answerNums =  makeRandomNums()
//    print("[TEST] 정답: \(answerNums)")
    
    // 게임 도전 횟수
    var count: Int = 0
    print("< 게임을 시작하겠습니다 >")
    print("숫자를 입력하세요!")
    
    var isRunning = true
    
    while isRunning {
        count += 1
        let userInputNums = readLine()!
        let result = chkStrikeAndBall(userInputNums: userInputNums)
        print(result)
    }
    
    // 방금전 시도한 게임의 도전 횟수 저장
    myGameResults.append(count)
    
    func chkStrikeAndBall(userInputNums: String) -> String {
        // 숫자가 아닌 경우, 3자리가 아닌 경우, 0을 포함한 경우, 특정 숫자를 중복 사용한 경우
        if Int(userInputNums) == nil || userInputNums.count != 3 || userInputNums.count != Set(userInputNums).count {
            return "올바르지 않은 입력값입니다."
        } else {
            // 사용자에게 입력받은 입력값을 [Int]로
            var inputNums: [Int] = []
            
            for char in userInputNums {
                let str = String(char)
                guard let num = Int(str) else {
                    return "올바르지 않은 입력값입니다."
                }
                inputNums.append(num)
            }
            isRunning = answerNums != inputNums
            
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
}

// 2. 게임 기록 보기
func seeResult() {
    // 1번째 게임: n번 시도
    for i in 0..<myGameResults.count {
        let tryCount = myGameResults[i]
        print("\(i + 1)번째 게임: \(tryCount)번 시도")
    }
}

// 3. 게임종료
func exitGame() {
    print("기록을 초기화하고 게임을 종료합니다.")
    myGameResults = []
    gameOver = true
}

// 이상한거 입력
func wrongInput() {
    print("올바르지 않은 입력값입니다.")
}


// 게임 실행 코드

// 랜덤으로 뽑은 정답
var answerNums: [Int] = []
// 도전 횟수를 담는 숫자 배열
var myGameResults: [Int] = []
// 게임 종료 여부
var gameOver = false

print("환영합니다!! 원하시는 번호를 입력해주세요^0^ ")

// gameOver가 false인 동안에 반복.
while gameOver == false {
    // 메뉴
    print("1. 게임 시작 2. 게임 기록 보기 3. 게임종료")
    let userInputNums = readLine()!
    let clickedNum = Int(userInputNums)

    if clickedNum == 1 {
        startGame()
    } else if clickedNum == 2 {
        seeResult()
    } else if clickedNum == 3 {
        exitGame()
    } else {
        wrongInput()
    }
}
