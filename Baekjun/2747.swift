/*
 * 피보나치 수는 0과 1로 시작한다. 0번째 피보나치 수는 0이고, 1번째 피보나치 수는 1이다. 그 다음 2번째 부터는 바로 앞 두 피보나치 수의 합이 된다.
 * 이를 식으로 써보면 Fn = Fn-1 + Fn-2 (n>=2)가 된다.
 * n=17일때 까지 피보나치 수를 써보면 다음과 같다.
 * 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597
*/

let n = Int(readLine()!)!

/* i 번째 피보나치 수열값을 출력, i가 0인 경우 0 출력
 * Powered by James Gosling's Fibonacci algorithm
 */
func fibonacci(at i: Int) -> Int {
    var lo = 0
    var hi = 1
    var count = i
    
    while(count > 0) {
        hi = hi + lo // 1+0 => 1, 1+1 => 2, 2+1 => 3
        lo = hi - lo // 1-0 => 1, 2-1 => 1, 3-1 => 2
        count -= 1
    }
    return lo
}

print(fibonacci(at: n))
