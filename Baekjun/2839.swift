/* Greedy Algorithm
 * 문제: 상근이는 요즘 설탕공장에서 설탕을 배달하고 있다. 상근이는 지금 사탕가게에 설탕을 정확하게 N킬로그램을 배달해야 한다. 
 * 설탕공장에서 만드는 설탕은 봉지에 담겨져 있다. 봉지는 3킬로그램 봉지와 5킬로그램 봉지가 있다.
 * 상근이는 귀찮기 때문에, 최대한 적은 봉지를 들고 가려고 한다. 
 * 예를 들어, 18킬로그램 설탕을 배달해야 할 때, 3킬로그램 봉지 6개를 가져가도 되지만, 
 * 5킬로그램 3개와 3킬로그램 1개를 배달하면, 더 적은 개수의 봉지를 배달할 수 있다.
 * 상근이가 설탕을 정확하게 N킬로그램 배달해야 할 때, 봉지 몇 개를 가져가면 되는지 그 수를 구하는 프로그램을 작성하시오.
 * 상근이가 배달하는 봉지의 최소 개수를 출력한다. 만약, 정확하게 N킬로그램을 만들 수 없다면 -1을 출력한다.
 * 
 * 문제 링크: https://www.acmicpc.net/problem/2839
 * 예제 입력: 18
 * 예제 출력: 4
 */

let N = Int(readLine()!)! // 입력된 설탕 킬로 수

/*
 * 입력된 설탕무게로 만들 수 있는 최소한의 봉지 수를 계산
 * 
 * 먼저 5킬로로 나누어 떨어지는지 확인, 
 * 그렇지 않은 경우, 3킬로씩 빼가며 5킬로로 나누어 떨어지는지 확인
 * 최종적으로는 포대에 담은 횟수인 count를 반환
 * 나누어떨어지지 않는 경우(포대에 정확히 담을 수 없는 경우) -1 반환
 */
func minTrial(with N: Int) -> Int {
    var i = N
    var count = 0
    
    while(i > 0) {
        if i % 5 == 0 {
            count += i/5
            i %= 5
            break
        }
        i -= 3
        count += 1
    }
    return (i == 0) ? count : -1
}

print(minTrial(with: N))
