import Foundation

let n = Int(readLine()!)!

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let max = input.max()!

func getGcd(_ a: Int, _ b: Int) -> Int { // Greast Common Dividsor
    return (a % b == 0) ? b : getGcd(b, a % b) 
}

func primeNumbers(lessThan i: Int) -> [Int] {
//    return zip(Array(1...i),Array(1...i)).map { getGcd($0, $1) }
    let inputs = Array(1...i)
    let result = Array(1...i).map { (k: Int) in inputs.map { getGcd($0, k) } }
    print(result)
    return []
}

print(primeNumbers(lessThan: max))
