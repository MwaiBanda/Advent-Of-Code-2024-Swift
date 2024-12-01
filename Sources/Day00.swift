import Algorithms

struct Day00: AdventDay {  

  init(data: String) {
    self.data = data
  }
  

  var data: String

  var entities: [String] {
    data.split(separator: "\n\n").map {
      String($0)
    }
  }
  
  var firstList: [Int] {
    entities.flatMap({
      $0
        .split(separator: "\n")
        .map({ String($0) })
        .compactMap({
          let num = Int($0.split(separator: " ")
          .first ?? "")
          return num
        })
    }).sorted()
  }
  
  var secondList: [Int] {
    entities.flatMap({
      $0
        .split(separator: "\n")
        .map({ String($0) })
        .compactMap({ Int($0.split(separator: " ")
          .last ?? "") })
    }).sorted()
  }

  func part1() -> Any {
    return firstList.indices.map({ abs(firstList[$0] - secondList[$0])}).reduce(0, { x,y in x + y })
  }

  

  func part2() -> Any {
    var counts: [Int?: Int] = [:]
    firstList.forEach { key in
      secondList.forEach { lookUpKey in
        if key == lookUpKey {
          counts[key] = (counts[key] ?? 0) + 1
        }
      }
    }
    return counts.map({ (key: Int?, value: Int) in
      (key ?? 0) * value
    }).reduce(0, { x,y in x + y })
  }
}
