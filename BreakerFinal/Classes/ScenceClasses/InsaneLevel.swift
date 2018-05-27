//
//  GameplaySceneClass.swift
//  BreakerFinal
//
//  Created by Victor Castaneda on 4/25/18.
//  Copyright © 2018 Victor Castaneda. All rights reserved.
//

import SpriteKit
import AVFoundation


class InsaneLevel: SKScene, SKPhysicsContactDelegate {
    var paddle: SKSpriteNode!
    var brick = SKSpriteNode()
    var ball = SKShapeNode()
    var scoreLabel = SKLabelNode()
    var score = 0
    var enemy1 = SKSpriteNode()
    var enemy2 = SKSpriteNode()
    var enemy3 = SKSpriteNode()
    var enemy4 = SKSpriteNode()
    var enemy5 = SKSpriteNode()


    
    override func didMove(to view: SKView) {paddle = self.childNode(withName: "Paddle") as!SKSpriteNode
        makeBall()
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.applyImpulse(CGVector(dx: 8, dy: 8))
        self.scoreLabel = self.childNode(withName: "ScoreLabel") as! SKLabelNode
        enemy1 = self.childNode(withName: "enemy1") as! SKSpriteNode
        enemy2 = self.childNode(withName: "enemy2") as! SKSpriteNode
        enemy3 = self.childNode(withName: "enemy3") as! SKSpriteNode
        enemy4 = self.childNode(withName: "enemy4") as! SKSpriteNode
        enemy5 = self.childNode(withName: "enemy5") as! SKSpriteNode
    }
    func makeBall() {
        ball = SKShapeNode(circleOfRadius:10)
        ball.position = CGPoint(x: frame.midX + 19, y: frame.midY + 23)
        ball.strokeColor = UIColor.black
        ball.fillColor = UIColor.cyan
        ball.name = "ball"
        // physics shape matches ball image
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        // ignores all forces and impulses
        ball.physicsBody?.isDynamic = false
        // use precise collision detection
        ball.physicsBody?.usesPreciseCollisionDetection = false
        //no loss of energy from friction
        ball.physicsBody?.friction = 0
        // gravity is not a factor
        ball.physicsBody?.affectedByGravity = false
        // bounces fully off other objects
        ball.physicsBody?.restitution = 1
        // does not slow down over time
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.contactTestBitMask = (ball.physicsBody?.collisionBitMask)!
        addChild(ball)     // add ball object to the view
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            paddle.position.x = touchLocation.x
            
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in: self)
            paddle.position.x = touchLocation.x
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyAname = contact.bodyA.node?.name
        let bodyBname = contact.bodyB.node?.name
        
        
        if bodyAname == "ball" && bodyBname == "Brick" || bodyAname == "Brick" && bodyBname == "ball" {
            if bodyAname == "Brick" {
                self.score += 1
                self.scoreLabel.text = "\(self.score)"
                contact.bodyA.node?.removeFromParent()
            } else if bodyBname == "Brick" {
                self.score += 1
                self.scoreLabel.text = "\(self.score)"
                contact.bodyB.node?.removeFromParent()
            }
        }
        if bodyAname == "ball" && bodyBname == "BrickTwo" || bodyAname == "BrickTwo" && bodyBname == "ball" {
            if bodyAname == "BrickTwo" {
                self.score += 1
                self.scoreLabel.text = "\(self.score)"
                contact.bodyA.node?.removeFromParent()
            } else if bodyBname == "BrickTwo" {
                self.score += 1
                self.scoreLabel.text = "\(self.score)"
                contact.bodyB.node?.removeFromParent()
            }
        }
        if bodyAname == "ball" && bodyBname == "BrickThree" || bodyAname == "BrickThree" && bodyBname == "ball"{
            if bodyAname == "BrickThree" {
                self.score += 1
                self.scoreLabel.text = "\(self.score)"
                contact.bodyA.node?.removeFromParent()
            } else if bodyBname == "BrickThree" {
                self.score += 1
                self.scoreLabel.text = "\(self.score)"
                contact.bodyB.node?.removeFromParent()
            }
        }
        if bodyAname == "ball" && bodyBname == "BrickFour" || bodyAname == "BrickFour" && bodyBname == "ball" {
            if bodyAname == "BrickFour" {
                self.score += 1
                self.scoreLabel.text = "\(self.score)"
                contact.bodyA.node?.removeFromParent()
            } else if bodyBname == "BrickFour" {
                self.score += 1
                self.scoreLabel.text = "\(self.score)"
                contact.bodyB.node?.removeFromParent()
            }
        }
        if bodyAname == "ball" && bodyBname == "loseZone" || bodyAname == "loseZone" && bodyBname == "ball"{
            if bodyAname == "loseZone"{
                contact.bodyB.node?.removeFromParent()
                if let view = self.view as! SKView? {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = YouLostFile(fileNamed: "YouLost") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFill
                        // Present the scene
                        view.presentScene(scene, transition: SKTransition.crossFade(withDuration: 2));
                    }
                }
            }
        }
        if score == 28 {
            ball.removeFromParent()
            if let view = self.view as! SKView? {
                // Load the SKScene from 'GameScene.sks'
                if let scene = YouWonGame(fileNamed: "YouWonGame") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    // Present the scene
                    view.presentScene(scene, transition: SKTransition.crossFade(withDuration: 2));
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        enemy1.run(SKAction.moveTo(x: ball.position.x, duration: 2.0))
        enemy2.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
        enemy3.run(SKAction.moveTo(x: ball.position.x, duration: 1.5))
        enemy4.run(SKAction.moveTo(x: ball.position.x, duration: 1.25))
        enemy5.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))
    }
}

