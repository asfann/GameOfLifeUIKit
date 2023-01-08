import SpriteKit

class GameScene: SKScene {
  let gameOfLife: GameOfLife
  
  var cells: [[SKShapeNode]] = []
  
  let cellSize: CGFloat = 10
  
  init(size: CGSize, gameOfLife: GameOfLife) {
    self.gameOfLife = gameOfLife
    super.init(size: size)
    
    for i in 0..<gameOfLife.rows {
      var row: [SKShapeNode] = []
      for j in 0..<gameOfLife.cols {
        let cell = SKShapeNode(rectOf: CGSize(width: cellSize, height: cellSize))
        cell.fillColor = gameOfLife.currentState[i][j] ? UIColor.black : UIColor.white
        cell.strokeColor = UIColor.clear
        cell.position = CGPoint(x: CGFloat(j) * cellSize, y: CGFloat(i) * cellSize)
        addChild(cell)
        row.append(cell)
      }
      cells.append(row)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func updateCells() {
    for i in 0..<gameOfLife.rows {
      for j in 0..<gameOfLife.cols {
        let cell = cells[i][j]
        cell.fillColor = gameOfLife.currentState[i][j] ? UIColor.black : UIColor.white
      }
    }
  }
}
