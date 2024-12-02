import Algorithms

struct Day02: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }
  
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    var count = 0
    for entity in entities {
      var isRev: Bool = false
      var isFor: Bool = false
      var isValid: Bool = true
      
      for (first, second) in entity.adjacentPairs() {
        if first < second && !isFor {
          isRev = true
          if !(second - first <= 3 && second - first >= 1) {
            isValid = false
            break
          }
        } else if first > second && !isRev {
          isFor = true
          if !(first - second <= 3 && first - second >= 1) {
            isValid = false
            break
          }
        } else {
          isValid = false
          break
        }
      }
      
      if isValid {
        count += 1
      }
      
    }
    // Calculate the sum of the first set of input data
    return count
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    
    var res = 0
    
    func checkRow(_ row: [Int]) -> (Bool) {
      var isRev: Bool = false
      var isFor: Bool = false
      var isValid: Bool = true
      
      for (first, second) in row.adjacentPairs() {
        if first < second && !isFor {
          isRev = true
          if !(second - first <= 3 && second - first >= 1) {
            isValid = false
            break
          }
        } else if first > second && !isRev {
          isFor = true
          if !(first - second <= 3 && first - second >= 1) {
            isValid = false
            break
          }
        } else {
          isValid = false
          break
        }
      }
      
      return isValid
    }
    
    for row in entities {
      if checkRow(row) {
        res += 1
      } else {
        for i in row.indices {
          var rowCopy = row
          rowCopy.remove(at: i)
          if checkRow(rowCopy) {
            res += 1
            break
          }
        }
      }
      
    }
    
    return res
  }
}
