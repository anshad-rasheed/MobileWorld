//
//  ViewController.swift
//  HackerRank
//
//  Created by Anshad R on 28/12/19.
//  Copyright © 2019 Anshad R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
// MARK:- Solutions
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
    
    func aVeryBigSum(ar: [Int]) -> Int {
        return ar.reduce(0,+)
        
    }

    func pangrams(s: String) -> String {
        let alphabets = "abcdefghijklmnopqrstuvwzyz"
        guard s.count >= alphabets.count  else {
            return "not pangram"
        }
        for character in alphabets {
            if !s.uppercased().contains(character.uppercased()){
                return "not pangram"
            }
        }
        return "pangram"
    }

    func diagonalDifference(arr: [[Int]]) -> Int {
        var diagonalSum = 0
        var antiDiagonalSum = 0
        let arrayOrder = arr.count
        for index in 0..<arr.count {
            diagonalSum += arr[index][index]
            antiDiagonalSum += arr[index][arrayOrder - index - 1]
        }
        return  abs(diagonalSum - antiDiagonalSum)
        
    }
    
       func appendAndDelete(s: String, t: String, k: Int) -> String {

            var similatiry = 0

            for index in min(s, t).indices {
                if s[index] == t[index]{
                    similatiry += 1
                } else { break }
            }

            // true is difference is simply too big to convert in given number of operations
            let differenceTooBig = s.count + t.count - 2 * similatiry > k
            // true is you can convert string to another in given number of operations or if (operations - difference) is even
            let differenceIsOk = (s.count + t.count - 2 * similatiry - k) % 2 == 0
            // true if there is so many operations that you can delete from empty string to get proper number of operations
            let fewOperationsLeft = s.count + t.count - k < 0

            if !differenceTooBig && differenceIsOk || fewOperationsLeft ? true : false {
                return "YES"
            } else {
                 return "NO"
            }
        }

        func miniMaxSum(arr: [Int]) -> Void {

            let sortedArray = arr.sorted()
            var minSum = 0
            var maxSum = 0
            for i in 0..<sortedArray.count - 1 {
                minSum += sortedArray[i]
            }

            maxSum = (minSum + sortedArray.last!) - sortedArray.first!
            print("\(minSum)  \(maxSum)")
        }
        
        func birthdayCakeCandles(ar: [Int]) -> Int {
            return ar.filter {$0 == ar.max()}.count
        }

        func timeConversion(s: String) -> String {
            let format = s.dropFirst(8)
            var hr = Int(s.dropLast(8))!
            var hourString: String
            if format == "PM" {
                hr = hr == 12 ? hr : hr + 12
                hourString = String(hr)
                
            } else {
                hr = hr == 12 ? 00 : hr
                hourString = "0\(hr)"
            
            }
            let convetedTime = "\(hourString)\(s.dropFirst(2))".dropLast(2)
            print(String(convetedTime))
            return String(convetedTime)

        }

        func getTotalX(a: [Int], b: [Int]) -> Int {

            var allElementsMultiple = false
            var numberIsMultiple  = false

            let minB = b.reduce(b[0], min)

            var total = 0

            for i in 1...minB {
            
                allElementsMultiple = a.map { return i % $0 == 0 }.reduce(true, {$0 && $1})
                numberIsMultiple  = b.map { return $0 % i == 0 }.reduce(true, {$0 && $1})
                
                if (allElementsMultiple && numberIsMultiple)
                {
                    total += 1
                }
            }

            return total
            
        }
        
        func breakingRecords(scores: [Int]) -> [Int] {
            var maxRecordeBreakingCount = 0
            var minRecordeBreakingCount = 0

            var max = scores[0]
            var min = scores[0]

            for i in 0..<scores.count-1 {
                if max < scores[i+1] {
                    maxRecordeBreakingCount += 1
                    max = scores[i+1]
                } else if  min > scores[i+1] {
                    minRecordeBreakingCount += 1
                    min = scores[i+1]
                }
            }
            return [maxRecordeBreakingCount,minRecordeBreakingCount]
        }

        func birthday(s: [Int], d: Int, m: Int) -> Int {

           var result: Int = 0
            for index in s.indices {
                var summary: Int = s[index]
                for value in 1..<d{
                    if (index + value) < s.indices.endIndex {
                        summary += s[index + value]
                    } else {
                        summary = 0
                    }
                }
                if summary == m { result += 1 }
            }
            return result
        }
        
        func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
            var count: Int = 0
            for index in ar.indices {
                var sum = ar[index]
                let j = index + 1
                for next in j..<ar.count {
                    sum = sum + ar[next]
                    if sum % k == 0 {
                        count += 1
                    }
                    
                }
            }
            return count
        }
       
        
        
        func migratoryBirds(arr: [Int]) -> Int {

            var tempArray = [Int](repeating: 0, count:arr.count)

            for i in arr {
              tempArray[i] += 1
            }

            var maxCount = 0
            var result = 0
            for i in 0..<arr.count {
              if tempArray[i] > maxCount {
                maxCount = tempArray[i]
                result = i
              }
            }

            return result
        }
        
        func bonAppetit(bill: [Int], k: Int, b: Int) -> Void {
            
            let actualShare = (bill.reduce(0,+) - bill[k])/2
            let difference =  b - actualShare
            if difference == 0 {
                print("Bon Appetit")
            } else {
                print(difference)
            }

        }
        
        // Complete the viralAdvertising function below.
        func viralAdvertising(n: Int) -> Int {
            var cumulative: Int = 0
            var totalShared  = 5.0
            for _ in 1...n {
                let liked = floor(totalShared/2)
                totalShared = liked * 3
                cumulative = cumulative + Int(liked)
            }
            return cumulative
        }
    




    func countingValleys(n: Int, s: String) -> Int {
        var result = 0
        var position = 0
        var belowSeaLevel: Bool { get { return position < 0 ? true : false } }
        var inValley: Bool = false { willSet { if newValue == true && inValley == false { result += 1 } } }
        
        for step in s {
            position += step == "U" ? 1 : -1
            inValley = belowSeaLevel ? true : false
        }
        return result
        
    }
    func getMoneySpent(keyboards: [Int], drives: [Int], b: Int) -> Int {
            var result = -1
            for keyboard in keyboards {
                for drive in drives {
                    if keyboard + drive <= b, keyboard + drive > result {
                        result = max(result,keyboard + drive)
                    }
                }
            }
            return result
    }

    func designerPdfViewer(h: [Int], word: String) -> Int {
        let scalarValuesOfWord = word.unicodeScalars.map { Int($0.value) - Int(UnicodeScalar("a").value) }
        let maxHeight =  scalarValuesOfWord.map{h[$0]}.max()!
        return maxHeight * scalarValuesOfWord.count
    }

    func utopianTree(n: Int) -> Int {
        var height = 0
        for n in 0...n {
            if n % 2 == 0 {
                height = height + 1
            } else {
                height = height * 2
            }
        }
        
        return height
    }


    // Complete the angryProfessor function below.
    func angryProfessor(k: Int, a: [Int]) -> String {
        //-1 -3 4 2 -> 3
        var result = "YES"
        let ontime = a.filter{$0<=0}
        if ontime.count >= k {
            result = "NO"
        }
        return result
    }

    func beautifulDays(i: Int, j: Int, k: Int) -> Int {
        var result = 0
        for item in i...j {
            
            var reverse = 0
            var y = item
            while (y != 0){
                reverse = 10*reverse + y%10
                y = y / 10
            }
            if abs(item - reverse)  % k == 0 {
                result = result + 1
            }
        }
        
        return result
        
    }

    func findDigits(n: Int) -> Int {
        let digits = String(describing: n).compactMap { Int(String($0)) }
        return digits.filter{ $0 > 0}.filter{n % $0 == 0}.count
    }

    func cutTheSticks(arr: [Int]) -> [Int] {
        var resultArray = [Int]()
        var deducedArray =  arr
        while deducedArray.count > 0 {
            resultArray.append(deducedArray.count)
            if let min = deducedArray.min() {
                deducedArray = deducedArray.map{$0 - min}.filter{$0 > 0}
            }
        }
        return resultArray
    }
    func findMedian(arr: [Int]) -> Int {
        let middle = arr.count / 2 + 1
        let sorted = arr.sorted()
        return sorted[middle-1]

    }

    func hurdleRace(k: Int, height: [Int]) -> Int {
        if let max = height.max(), max - k >= 0 {
            return max - k
        } else {
            return 0
        }
    }

    func stones(n: Int, a: Int, b: Int) -> [Int] {
        var result = [Int]()
        for i in 0...n {
            result.append(a * i + b * (n-i-1))
        }
        
        return result.sorted()

    }

    func equalizeArray(arr: [Int]) -> Int {

        var result = 0
        let mappedItems = arr.map { ($0, 1) }
        let counts = Dictionary(mappedItems, uniquingKeysWith: +)
        let maxDuplicates = counts.values.filter{$0 == counts.values.max()}
        for item in counts {
            if item.value != counts.values.max() {
                result = result + item.value
            } else {
                
            }
        }
        return result +  (maxDuplicates.first! * (maxDuplicates.count - 1))

    }

    func reverseArray(a: [Int]) -> [Int] {
        return a.reversed()

    }

    func kaprekarNumbers(p: Int, q: Int) -> Void {
        if p < q, q < 100000 {
            var results = [Int]()
            for i in p ... q {
                let squareString = String(i * i)
                let half = squareString.index(squareString.startIndex, offsetBy: squareString.count/2)
                let leftrange = squareString.startIndex..<half
                let rightRange = half..<squareString.endIndex
                let left = Int(squareString[leftrange]) ?? 0
                let right = Int(squareString[rightRange]) ?? 0
                if left + right == i {
                    results.append(i)
                }
                
            }
            if results.count > 0 {
                print(results.map { String($0)}.joined(separator: " "))

            } else {
                print("INVALID RANGE")
            }
            
        } else {
            print("INVALID RANGE")
        }
    }
    func beautifulTriplets(d: Int, arr: [Int]) -> Int {
        var count = 0
        for number in arr {
            if arr.contains(number-d) && arr.contains(number - 2 * d) {
                count += 1
            }
        }
        
        return count
    }

    func minimumDistances(a: [Int]) -> Int {

       var occurances: [Int:Int] = [:]
        var minimum: Int?
        for (index, number) in a.enumerated() {
            if let position = occurances[number] {
                let distance = index - position
                if let min = minimum {
                    minimum = min > distance ? distance : min
                } else {
                    minimum = distance
                }
            } else {
                occurances[number] = index
            }
        }
        return minimum ?? -1
        
    }

    func stonesd(n: Int, a: Int, b: Int) -> [Int] {
        var stones = [Int]()
        for _ in 1...n {
            
            let low = min(a,b)
            let high = max(a,b)
            
            var increment = high - low
            if a == b {
                increment = a
            }
            
            let start = low * (n-1)
            let end = high * (n-1) + increment
            
            stones = Array(stride(from: start, to: end, by: increment)).sorted()
            
        }
        
        return stones.sorted()
    }

    func runningTime(arr: [Int]) -> Int {
       
        var count = 0
        var array = arr
         for i in 1..<array.count {
            var l = i
            while array[l-1] > array[l] {
                array.swapAt(l, l-1)
                l -= 1
                count += 1
                if l<1 { break }
            }
        }
        return count
    }

    func icecreamParlor(m: Int, arr: [Int]) -> [Int] {
        
        var result = [Int]()
        for _ in 1...m{
            for i in 0..<arr.count - 1 {
                for j in i+1..<arr.count {
                    if arr[i] + arr[j] == m {
                        result.append(i+1)
                        result.append(j+1)
                        return result
                    }
                }
            }
        }
        return result
    }



    //func serviceLane(n: Int, cases: [[Int]]) -> [Int] {
    //    let fwyLength = cases[0]
    //    let testCases = cases[1]
    //
    ////    let width = readLine()!.components(separatedBy:" ").map { Int($0)! }
    //
    //    for testcase in testCases {
    //        let testCase = readLine()!.components(separatedBy:" ").map { Int($0)! }
    //        print(cases[testCase[0]...testCase[1]].sorted()[0])
    //    }
    //
    //}

    func permutationEquation(p: [Int]) -> [Int] {
        var result = [Int]()
        var pInverse = Array(repeating: 0, count: p.count + 1)
           
           for (x, px) in p.enumerated() {
               pInverse[px] = x + 1
           }
           
        for x in 1...p.count {
            result.append(pInverse[pInverse[x]])
           }

        return result
    }



    func strangeCounter(t: Int) -> Int {
        var n = t
        var loopsAt = 3

        while n > loopsAt {
            n = n - loopsAt
            loopsAt *= 2
        }

        return loopsAt - n + 1

    }

    func pickingNumbers(a: [Int]) -> Int {
    //    let num = Int(readLine()!)!
    //    let a = readLine()!.components(separatedBy: " ").map{ Int($0)! }

        
        let set = NSCountedSet(array: a)
        var maxNum = 0

        for item in set {
            var total = 0
            let plusOne = item as! Int + 1
            if set.contains(plusOne) {
                total = set.count(for: item) + set.count(for: plusOne)
            } else {
                total = set.count(for: item)
            }
            maxNum = total > maxNum ? total : maxNum
        }

        return maxNum

    }

    func larrysArray(A: [Int]) -> String {
     var result = ""
        for _ in 1...A.count {
            let n = Int(readLine()!)!
            var inv = 0;
            for i in 0..<n-1 { for j in i+1..<n { if A[i] > A[j] { inv += 1 } } }
            if inv%2 == 0 { print("YES") } else { print("NO") }
        }
        return result
    }

    func repeatedString(s: String, n: Int) -> Int {


        var result = 0

        let divisible = n / s.count
        let remainder = n % s.count

        var i = 0
        for char in s where i < n {
            if char == "a" {
                result += 1
            }
            i = i + 1
        }
        i = 0
        result = result * divisible
        for char in s where i < remainder {
           
            if char == "a" {
                result += 1
            }
            i = i + 1
        }
        return result
    }

    func extraLongFactorials(n: Int) -> Void {
        var result = "1"
           for i in 1...n{
               result = multiply(result, by: i)
           }
           print(result)
    }

    private func multiply(_ a: String, by b: Int) -> String{

        let temp: [Int] = a.map { Int(String($0))! * b}
        var result = ""
        var remainer = 0

        for number in temp.reversed(){
            let total = number + remainer
            remainer = total / 10
            result.insert(Character(String(total % 10)), at: result.startIndex)
        }
        while remainer > 0 {
            result.insert(Character(String(remainer % 10)), at: result.startIndex)
            remainer /= 10
        }

        return result
    }

    func jumpingOnClouds(c: [Int], k: Int) -> Int {

        var jumps = 0
           var position = 0 { didSet{ jumps += 1 } }
           while position < c.count - 2 {
               position += c[position + 2] == 1 ? 1 : 2
           }
           if position < c.count - 1 { position += 1 }
           return jumps
    }

    func introTutorial(V: Int, arr: [Int]) -> Int {
        var position = 0
        for index in arr.indices {
            if arr[index] == V {
                position = index
                break
            }
        }
        return position
    }

    func saveThePrisoner(n: Int, m: Int, s: Int) -> Int {
        let warnedPrisoner =  (m+s-1) % n
        if warnedPrisoner == 0 {
            return n
        } else {
            return warnedPrisoner
        }
       
    }


}


