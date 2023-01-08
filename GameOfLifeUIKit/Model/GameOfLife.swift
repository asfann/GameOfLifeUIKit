
import UIKit

class GameOfLife {
  var currentState: [[Bool]]
  
  let rows: Int
  let cols: Int
  
  init(rows: Int, cols: Int) {
    self.rows = rows
    self.cols = cols
    currentState = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
  }
  
  func update() {
    var nextState = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
    
    for i in 0..<rows {
      for j in 0..<cols {
        let neighbors = countNeighbors(i, j)
        if currentState[i][j] {
          nextState[i][j] = neighbors == 2 || neighbors == 3
        } else {
          nextState[i][j] = neighbors == 3
        }
      }
    }
    
    currentState = nextState
  }
  
  func countNeighbors(_ i: Int, _ j: Int) -> Int {
    var count = 0
    for row in (i-1)...(i+1) {
      for col in (j-1)...(j+1) {
        if row == i && col == j {
          continue
        }
        if row >= 0 && row < rows && col >= 0 && col < cols {
          if currentState[row][col] {
            count += 1
          }
        }
      }
    }
    return count
  }
}
