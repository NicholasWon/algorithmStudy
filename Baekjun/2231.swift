/* Brute Force
 * 문제: 어떤 자연수 N이 있을 때, 그 자연수 N의 분해합은 N과 N을 이루는 각 자리수의 합을 의미한다. 
 * 어떤 자연수 M의 분해합이 N인 경우, M을 N의 생성자라 한다. 
 * 예를 들어, 245의 분해합은 256(=245+2+4+5)이 된다. 따라서 245는 256의 생성자가 된다. 
 * 물론, 어떤 자연수의 경우에는 생성자가 없을 수도 있다. 반대로, 생성자가 여러 개인 자연수도 있을 수 있다.
 * 자연수 N이 주어졌을 때, N의 가장 작은 생성자를 구해내는 프로그램을 작성하시오.
 * 첫째 줄에 답을 출력한다. 생성자가 없는 경우에는 0을 출력한다.
 * 
 * 전략: (입력된 숫자 자릿수 - 1)*9 만큼이 검색하한이 되며, 그 이하의 숫자는 검색할 필요가 없다.
 * 예를들어, 1000000 -> 999999 -> 9*6 = 54이므로 (1000000-54) 이하의 숫자로는 1000000 을 못만든다는 뜻이 된다.
 * 
 * 문제 링크: https://www.acmicpc.net/problem/2231
 * 예제 입력: 216
 * 예제 출력: 198
 */
let input = readLine()!
let N = Int(input)! // 1000000
let lowerN = N - (input.characters.map { String($0) }.count - 1)*9 // 999999 -> 9+9+9+9+9+9 -> 54가 검색하한이 된다.

/*
 * 입력된 숫자의 분해합(Partial Summation) 계산
 * 분해합 = 입력된 숫자(i) + 각 자리수 합
 */
func getPS(from i: Int) -> Int {
    return "\(i)".characters.map { String($0) }.map { Int($0)! }.reduce(i) { $0 + $1 }
}

print(Array(lowerN...N).filter { getPS(from: $0) == N }.min() ?? 0) // 최소값이 없을 때는 0을 출력
