import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String
  
  // Splits input data into its component parts and convert from string.
  var entities: ([Int], [Int]) {
    var first: [Int] = [], second: [Int] = []
    data.components(separatedBy: .whitespacesAndNewlines).enumerated().forEach { index, value in
      if value.replacingOccurrences(of: " ", with: "") == "" {
        return
      }
        if index % 2 == 0 {
          first.append(Int(value)!)
        } else {
          second.append(Int(value)!)
        }
      }
    return (first, second)
  }
  
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    let firstList = entities.0.sorted()
    let secondList = entities.1.sorted()
    
    var res = 0
    for i in 0..<firstList.count {
        res += abs(firstList[i] - secondList[i])
    }
    
    return res
  }
  
  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    var result:Int = 0
    
    var thing: [Int: Int] = [:]
    
    entities.1.forEach { value in
      if thing[value] == nil {
        thing[value] = 1
      } else {
        thing[value]! += 1
      }
    }
    
    for num in entities.0 {
      result += num * (thing[num] ?? 0)
    }
    
    return result
  }
}
