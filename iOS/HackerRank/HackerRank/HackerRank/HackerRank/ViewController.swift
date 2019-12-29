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
        // Do any additional setup after loading the view.
//        print(compareTriplets(a: [5,6,10], b: [2,6,11]))
        
//       print(pangrams(s: "We promptly judged antique ivory buckles for the prize"))
       print(diagonalDifference(arr: [[1,2,3],[1,2,3],[1,2,3]]))

    }

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
}


