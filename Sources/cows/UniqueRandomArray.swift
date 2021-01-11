//
//  UniqueRandomArray.swift
//  cows
//
//  Created by Helge Heß on 27/06/2016.
//  Copyright © 2016-2020 ZeeZide GmbH. All rights reserved.
//

#if swift(>=4.2)
  func uniqueRandomArray<T>(_ array: [ T ]) -> () -> T {
    let ura = UniqueRandomArray(array)
    return { return ura.next() }
  }

  final class UniqueRandomArray<T> {

    let originalArray  : [ T ]
    var remainingItems : [ T ]

    init(_ original: [ T ]) {
      self.originalArray  = original
      self.remainingItems = self.originalArray
    }

    func next() -> T {
      if remainingItems.isEmpty {
        remainingItems = originalArray // all consumed, reset
      }
  
      let idx = Int.random(in: 0..<remainingItems.count)
      return remainingItems.remove(at: idx)
    }
  }
#else // Swift <4.2
  #if os(Linux)
    import func Glibc.rand
    // Looks like todays Linux Swift doesn't have arc4random either.
    // Emulate it (badly).
    fileprivate func arc4random_uniform(_ v : UInt32) -> UInt32 { // sigh
      return UInt32(rand() % Int32(v))
    }
  #else
    import func Darwin.arc4random_uniform
  #endif

  func uniqueRandomArray<T>(_ array: [ T ]) -> () -> T {
    let ura = UniqueRandomArray(array)
    return { return ura.next() }
  }
  
  class UniqueRandomArray<T> {
  
    let originalArray  : [ T ]
    var remainingItems : [ T ]
  
    init(_ original: [ T ]) {
      self.originalArray  = original
      self.remainingItems = self.originalArray
    }

    func next() -> T {
      if remainingItems.isEmpty {
        remainingItems = originalArray // all consumed, reset
      }
    
      let idx = Int(arc4random_uniform(UInt32(remainingItems.count)))
      return remainingItems.remove(at: idx)
    }
  }
#endif // Swift <4.2
