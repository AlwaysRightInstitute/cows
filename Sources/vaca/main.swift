#!/usr/bin/swift sh
import cows // @AlwaysRightInstitute
import Foundation

let args = CommandLine.arguments

if args.count > 1 {
  let lowerCows = cows.allCows.map { $0.lowercased() }
  for arg in args.dropFirst() {
    guard !arg.isEmpty else { continue }
    let lowerArg = arg.lowercased()
    
    guard let idx = lowerCows.firstIndex(where: { $0.contains(lowerArg)}) else {
      print("Did not find a cow matching: `\(arg)`")
      continue
    }
    print(cows.allCows[idx])
  }
}
else {
  print(cows.vaca())
}
