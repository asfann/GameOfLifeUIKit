
import UIKit
import SpriteKit

class ViewController: UIViewController {
    var startStopButton: UIButton!
    var randomizeButton: UIButton!
    
    let game = GameOfLife(rows: 50, cols: 50)
    
    var timer: Timer?
    
    var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startStopButton = UIButton(type: .system)
        startStopButton.setTitle("Start/Stop", for: .normal)
        startStopButton.sizeToFit()
        startStopButton.center = CGPoint(x: view.center.x, y: view.center.y - 200)
        
        
        randomizeButton = UIButton(type: .system)
        randomizeButton.setTitle("Randomize", for: .normal)
        randomizeButton.sizeToFit()
        randomizeButton.center = CGPoint(x: view.center.x, y: view.center.y - 150)
        
        
        startStopButton.addTarget(self, action: #selector(startStopTapped), for: .touchUpInside)
        
        randomizeButton.addTarget(self, action: #selector(randomizeTapped), for: .touchUpInside)
        
        skView = SKView(frame: view.bounds)
        
        view.addSubview(skView)
        
        view.addSubview(startStopButton)
        view.addSubview(randomizeButton)
    }
    
    @objc func startStopTapped() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true, block: { _ in
                self.game.update()
                self.updateCells()
            })
            startStopButton.setTitle("Stop", for: .normal)
        } else {
            timer?.invalidate()
            timer = nil
            startStopButton.setTitle("Start", for: .normal)
        }
    }
    @objc func randomizeTapped() {
        game.currentState = [[Bool]](repeating: [Bool](repeating: false, count: game.cols), count: game.rows)
        for i in 0..<game.rows {
            for j in 0..<game.cols {
                game.currentState[i][j] = (Int.random(in: 0...1) == 0)
            }
        }
        
        updateCells()
    }
    func updateCells() {
      let scene = GameScene(size: skView.bounds.size, gameOfLife: game)
      
      skView.presentScene(scene)
    }

    
}
