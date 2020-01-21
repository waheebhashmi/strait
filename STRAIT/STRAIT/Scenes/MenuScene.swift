//
//  MenuScene.swift
//  STRAIT
//
//  Created by waheeb on 2020-01-15.
//  Copyright © 2020 Waheeb Hashmi . All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(hue: 0.1333, saturation: 1, brightness: 0.99, alpha: 1.0) /* #fcc900 */
        backgroundColor =  UIColor(hue: 48/360, saturation: 100/100, brightness: 99/100, alpha: 1.0) /* #fcc900 */

        backgroundColor = UIColor(red: 0.9882, green: 0.7882, blue: 0, alpha: 1.0) /* #fcc900 */
        backgroundColor = UIColor(red: 252/255, green: 201/255, blue: 0/255, alpha: 1.0) /* #fcc900 */
        addLogo()
        addLabels()
    }
    
    func addLogo(){
        let logo = SKSpriteNode(imageNamed: "lol")
        logo.size = CGSize(width: frame.width/4, height: frame.size.width/4)
        logo.position = CGPoint(x: frame.midX, y: frame.midY + frame.size.height/4)
        addChild(logo)
    }
    
    func addLabels() {
        let playLabel = SKLabelNode(text: "tap to play")
        playLabel.fontName = "PressStart2P"
        playLabel.fontSize = 25.0
        playLabel.fontColor = UIColor.white
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(playLabel)
        animate(label: playLabel)
        
        let highscoreLabel = SKLabelNode(text: "highscore: " + "\(UserDefaults.standard.integer(forKey: "highscore"))")
            
        highscoreLabel.fontName = "PressStart2P"
               highscoreLabel.fontSize = 25.0
               highscoreLabel.fontColor = UIColor.white
        highscoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - highscoreLabel.frame.size.height*4)
               addChild(highscoreLabel)
        let recentScoreLabel = SKLabelNode(text: "recent score: " + "\(UserDefaults.standard.integer(forKey: "recentscore"))")
        recentScoreLabel.fontName = "PressStart2P"
               recentScoreLabel.fontSize = 25.0
               recentScoreLabel.fontColor = UIColor.white
        recentScoreLabel.position = CGPoint(x: frame.midX, y: highscoreLabel.position.y - recentScoreLabel.frame.size.height*2)
               addChild(recentScoreLabel)
    }
    func animate(label: SKLabelNode) {
        let fadeOut = SKAction.fadeOut(withDuration: 0.75)
        let fadeIn = SKAction.fadeIn(withDuration: 0.75)
        let sequence = SKAction.sequence([fadeOut, fadeIn])
        label.run(SKAction.repeatForever(sequence))
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: view!.bounds.size)
        view!.presentScene(gameScene)
    }
    
    
}

