//
//  GameScene.swift
//  STRAIT
//
//  Created by waheeb on 2020-01-15.
//  Copyright © 2020 Waheeb Hashmi . All rights reserved.
//

import SpriteKit


//color definition of ball
enum PlayColors {
    static let colors = [
      UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0),
        UIColor(red: 241/255, green: 196/255, blue: 15/255, alpha: 1.0),
        UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0),
        UIColor(red: 52/255, green: 152/255, blue: 229/255, alpha: 1.0)
        

    ]
}

//different cases of colors the ball can spawn in
enum SwitchState: Int {
    case red, yellow, green, blue
    
}

class GameScene: SKScene {
    var barObject: SKSpriteNode!
    var ball = SKSpriteNode(imageNamed: "ball")
    var switchState = SwitchState.red
        var switchState2 = SwitchState.blue
        var switchState3 = SwitchState.green
    var switchState4 = SwitchState.yellow
    
    var currentColorIndex: Int?
    
    
    let scoreLabel = SKLabelNode(text: "0")
    var score = 0
    
    override func didMove(to view: SKView) {
        self.view?.isMultipleTouchEnabled = true
        setupPhysics()
        layoutScene()
    }
    
    //the speed at which the ball is falling at
    func setupPhysics() {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.5)
        physicsWorld.contactDelegate = self
    }
    
    //lays out  objects (, bar, and score) and spawns ball
    func layoutScene() {
        backgroundColor = UIColor(hue: 0.1333, saturation: 1, brightness: 0.99, alpha: 1.0) /* #fcc900 */
        backgroundColor =  UIColor(hue: 48/360, saturation: 100/100, brightness: 99/100, alpha: 1.0) /* #fcc900 */

        backgroundColor = UIColor(red: 0.9882, green: 0.7882, blue: 0, alpha: 1.0) /* #fcc900 */
        backgroundColor = UIColor(red: 252/255, green: 201/255, blue: 0/255, alpha: 1.0) /* #fcc900 */
        
       barObject = SKSpriteNode(imageNamed: "bar")
        barObject.color = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0)
              barObject.colorBlendFactor = 2.0
        barObject.size = CGSize(width: frame.size.width/3, height: frame.size.width/3)
        barObject.position = CGPoint(x: frame.midX, y:frame.minY + barObject.size.height)
        barObject.zPosition = ZPositions.bar
     
        barObject.physicsBody = SKPhysicsBody(circleOfRadius: barObject.size.width/2)

        barObject.physicsBody?.isDynamic = false
        addChild(barObject)
        
        scoreLabel.fontName = "PressStart2P"
        scoreLabel.fontSize = 60.0
        scoreLabel.fontColor = UIColor.white
        scoreLabel.position = CGPoint(x:frame.midX, y:frame.midY)
        scoreLabel.zPosition = ZPositions.label
        addChild(scoreLabel)
        
        spawnBall()
    }
    
    //score label
    func updateScoreLabel1() {
        scoreLabel.text = "\(score)"
    }
    
    //ball properties
    func spawnBall() {
        
    
        currentColorIndex = Int(arc4random_uniform(UInt32(4)))
        
        let ball = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: PlayColors.colors[currentColorIndex!], size: CGSize(width:30.0, height: 30.0))
        ball.size = CGSize(width: 30.0, height: 30.0)
        ball.colorBlendFactor = 2.0

        ball.position = CGPoint(x: frame.midX, y: frame.maxY)
        ball.zPosition = ZPositions.ball
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.categoryBitMask = PhysicsCategories.ballCategory
    
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.switchCategory
        ball.physicsBody?.collisionBitMask = PhysicsCategories.none
        ball.name = "Ball"
            
        addChild(ball)
    }
    
    func gameOver() {
        UserDefaults.standard.set(score, forKey: "recentscore")
        if score > UserDefaults.standard.integer(forKey: "highscore"){
            UserDefaults.standard.set(score, forKey: "highscore")
        }
        let menuScene = MenuScene(size: view!.bounds.size)
        view!.presentScene(menuScene)
    }
    
    //red
   
        
    func action1() {
           repeat {
        barObject.color = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0)
            
        barObject.colorBlendFactor = 2.0
                      barObject.physicsBody?.categoryBitMask = PhysicsCategories.switchCategory
            }while (barObject.color == ball.color )
                         
    }
    //blue
    func action2() {
          repeat {
        barObject.color = UIColor(red: 52/255, green: 152/255, blue: 229/255, alpha: 1.0)
        barObject.colorBlendFactor = 2.0
                barObject.physicsBody?.categoryBitMask = PhysicsCategories.switchCategory2
        }while (barObject.color == ball.color )
                        
    }
    //green
    func action3() {
        repeat {
            
        
          barObject.color = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
          barObject.colorBlendFactor = 2.0
           
                barObject.physicsBody?.categoryBitMask = PhysicsCategories.switchCategory3
        }while (barObject.color == ball.color )
                  
      }
//different color
    func action4() {
                
   repeat {
        barObject.color = UIColor(red: 241/255, green: 196/255, blue: 15/255, alpha: 1.0)
        barObject.colorBlendFactor = 2.0
                barObject.physicsBody?.categoryBitMask = PhysicsCategories.switchCategory4
           }while (barObject.color == ball.color )
                      

    }
       var cumulativeNumberOfTouches = 0
    func changeColor() {
    
        cumulativeNumberOfTouches += 1
        
        switch cumulativeNumberOfTouches  {

            case 1:
                action1()
            case 2:
                action2()
            case 3:
                action3()
            case 4:
                action4()
        
            
            default:
                break
            
    
                 
            
        }
     
       
     
        
    
    }
    //*******NOTES UPDATE
    //if right color ball goes through right color bar it gives a point
    //otherwise, nothing happens
    //add loop of balls coming down
    //add loop of bars changing color on touch constantly
    
    
    
    
   
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
 
          changeColor()

    

}
}

//when the ball hits the bar, score goes up
extension GameScene: SKPhysicsContactDelegate{
    func didBegin(_ contact: SKPhysicsContact) {
  
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if contactMask==PhysicsCategories.ballCategory | PhysicsCategories.switchCategory {
            if let ball = contact.bodyA.node?.name == "Ball" ? contact.bodyA.node as?
                SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                  
                if  barObject.color == ball.color {
                    print("correct")
              
                    
                
                score+=1
                updateScoreLabel1()
                ball.run(SKAction.fadeOut(withDuration: 0.25), completion: {
                     
                    ball.removeFromParent()
                    self.spawnBall()
                    })
                }
             
                
            
            }else{
                gameOver()
            
        }
            
    }

}
    
}

