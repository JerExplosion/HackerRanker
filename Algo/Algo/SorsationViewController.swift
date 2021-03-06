//
//  SorsationViewController.swift
//  Algo
//
//  Created by Jerry Ren on 7/14/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class SorsationViewController: UIViewController {
    
    var arrayForExperiment = [7, 1, 5, 3, 2, 9, 6, 8]
    let appDelegateInstance = AppDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        insertionality(unsorted: &arrayForExperiment)
        selectionSort(intArray: arrayForExperiment)
        
//        self.dataRaceChecker()
    }
    
}

extension SorsationViewController {
    private  func dataRaceChecker() {
        DispatchQueue.global().async {
            self.appDelegateInstance.dataRaceStr += "raceData "
        }
        // below executed on main thread, but both threads try to access the same string simultaneously, resulting in a acess race.
        print(appDelegateInstance.dataRaceStr)
    }
}
                  


private func genericInsertionality<T: Comparable>(unsorted: [T], by comparison: (T, T) -> Bool) -> [T] {
    var unsorted = unsorted
    
    for q in 0..<unsorted.count {
       
    }
    return Array<T>.init()
}

//func insertionSort<T: Comparable>(_ input: [T], by comparison: (T, T) -> Bool) -> [T]
//{
//    var items = input
//
//    for index in 1..<items.count
//    {
//        let value = items[index]
//        var position = index
//
//        while position > 0 && comparison(items[position - 1], value) {
//            items[position] = items[position - 1]
//            position -= 1
//        }
//        items[position] = value
//    }
//    return items
//}


func insertionality(unsorted: inout[Int]) -> [Int] {
    
    guard unsorted.count > 1 else { return unsorted }
    
    for index1 in 1..<unsorted.count {
        for index2 in (1...index1).reversed() {
            if unsorted[index2] < unsorted[index2 - 1] {
                unsorted.swapAt(index2 - 1, index2)
            } else {
                break
            }
        }
    }
    
    let sorted = unsorted
    print(sorted)
  
    return sorted
}


fileprivate func selectionSort(intArray: [Int]) -> [Int] {
    
    var intArrayInOperation = intArray
    for indexCurrent in 0..<(intArrayInOperation.count - 1) {
        var indexMin = indexCurrent
        
        for x in (indexCurrent + 1)..<intArray.count {
            if intArrayInOperation[x] < intArrayInOperation[indexMin] {
                indexMin = x
            }
        }
        if indexMin != indexCurrent {
            let holder = intArrayInOperation[indexCurrent]
            intArrayInOperation.swapAt(indexCurrent, indexMin)
        }
    }
    print(intArrayInOperation)
    return intArrayInOperation
}
         




