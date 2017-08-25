import Foundation
/*
 * 문제: 어떤 양의 정수 X의 자리수가 등차수열을 이룬다면, 그 수를 한수라고 한다. 
 * 등차수열은 연속된 두 개의 수의 차이가 일정한 수열을 말한다. 
 * N이 주어졌을 때, 1보다 크거나 같고, N보다 작거나 같은 한수의 개수를 출력하는 프로그램을 작성하시오. 
 * 
 * 문제 링크: https://www.acmicpc.net/problem/1065
 * 예제입력: 110
 * 예제출력: 99
 */
 
let n = Int(readLine()!)!

/*
 * 입력된 수의 각 자리수가 등차수열 관계를 갖는지(=한수) 여부 확인,
 * 99 이하의 수는 무조건 참
 * 
 * 입력된 수를 배열로 만들고, 엇갈리게 배치해서 각 원소간의 차를 계산
 * 123 -> [1, 2] - [2, 3] = [-1, -1] => 등차수열!
 */
func isHanSu(_ i :Int) -> Bool {
    if i/100 == 0 { return true } // 99 이하의 수는 무조건 한수
    
    let str = "\(i)" // 입력된 수를 문자열로 변환, "123"
    let val1 = str.substring(to: str.index(before: str.endIndex))
                  .characters.map { String($0) }
                  .map { Int($0)! } // 맨 뒷자리 수를 없애고 배열로 변환, [1, 2]
    let val2 = str.substring(from: str.index(after: str.startIndex))
                  .characters.map { String($0) }
                  .map { Int($0)! } // 맨 앞자리 수를 없애고 배열로 변환, [2, 3]
    let diff = val1[0] - val2[0] // 원소간 차이값, -1
    
    return zip(val1, val2).map { $0 - $1 }
                          .filter { $0 != diff }
                          .count == 0 // 차이값과 다른 원소가 존재하는지 확인, 한 개라도 존재하면 false
}

print(Array(1...n).filter { isHanSu($0) }.count) // 한수의 조건을 만족하는 원소 갯수 출력
