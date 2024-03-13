import Foundation
// 숫자 야구 게임 만들기 Lv1

// 숫자 3개 랜덤 숫자 담을 곳
var randomNumbers:Set<Int> = []

// 숫자 3개 랜덤으로 뽑는 코드 (while 문)
while randomNumbers.count < 3 {
    let num = Int.random(in: 1...9)
    randomNumbers.insert(num)
}
print(randomNumbers) // 랜덤으로 나오는지 확인




