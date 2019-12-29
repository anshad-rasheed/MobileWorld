import UIKit

var str = "Hello, playground"

func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var alicePoints = 0
    var bobPoints = 0
    var position = 0
    while position < a.count {
        if a[position] > b[position] {
            alicePoints += 1
        } else if a[position] < b[position] {
            bobPoints += 1
        }
        position += 1
    }
    return [alicePoints,bobPoints]
}

print(compareTriplets(a: [1,2,3], b: [2,1,5]))
