import Algorithms
import RegexBuilder

struct Day03: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [Regex<(Substring, Substring, Substring)>.Match] {
    let pattern = Regex {
        "mul("
        Capture{
          OneOrMore(.digit)
        }
        ","
        Capture{
          OneOrMore(.digit)
        }
        ")"
    }
    return data.matches(of: pattern)
  }
  
  // Splits input data into its component parts and convert from string.
  var data1: String {
    let pattern = Regex {
      "don't()"
      ZeroOrMore(.reluctant){
        .any
      }
      "do()"
    }
    
    let newData = data.replacing(.newlineSequence, with: "")
    let newData1 = newData.replacing(pattern, with: "")
    return newData1
  }
  
  var entities1: [Regex<(Substring, Substring, Substring)>.Match] {
    let pattern = Regex {
        "mul("
        Capture{
          OneOrMore(.digit)
        }
        ","
        Capture{
          OneOrMore(.digit)
        }
        ")"
    }
    return data1.matches(of: pattern)
  }
  
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    return entities.reduce(into: 0) { partialResult, match in
      partialResult += Int(match.output.1)! * Int(match.output.2)!
    }
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    return entities1.reduce(into: 0) { partialResult, match in
      partialResult += Int(match.output.1)! * Int(match.output.2)!
    }
  }
}
