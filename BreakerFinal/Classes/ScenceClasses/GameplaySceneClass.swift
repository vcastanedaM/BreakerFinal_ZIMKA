//
//  GameplaySceneClass.swift
//  BreakerFinal
//
//  Created by Victor Castaneda on 4/25/18.
//  Copyright © 2018 Victor Castaneda. All rights reserved.
//

import SpriteKit

class GameplaySceneClass: SKScene, SKPhysicsContactDelegate {
    var paddle: SKSpriteNode!
    var brick = SKSpriteNode()
    var ball = SKShapeNode()
   
    
    override func didMove(to view: SKView) {
        paddle = self.childNode(withName: "Paddle") as! SKSpriteNode
        makeBall()
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 5))
    }
    func makeBall() {
        ball = SKShapeNode(circleOfRadius:10)
        ball.position = CGPoint(x: frame.midX, y: frame.midY)
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
                contact.bodyA.node?.removeFromParent()
            } else if bodyBname == "Brick" {
                contact.bodyB.node?.removeFromParent()
            }
        }
        if bodyAname == "ball" && bodyBname == "BrickTwo" || bodyAname == "BrickTwo" && bodyBname == "ball" {
            if bodyAname == "BrickTwo" {
                contact.bodyA.node?.removeFromParent()
            }
            else if bodyBname == "BrickTwo" {
                contact.bodyB.node?.removeFromParent()
            }
        }
        if bodyAname == "ball" && bodyBname == "BrickThree" || bodyAname == "BrickThree" && bodyBname == "ball"{
            if bodyAname == "BrickThree" {
                contact.bodyA.node?.removeFromParent()
            }
            else if bodyBname == "BrickThree"{
                contact.bodyB.node?.removeFromParent()
            }
        }
        if bodyAname == "ball" && bodyBname == "BrickFour" || bodyAname == "BrickFour" && bodyBname == "ball" {
            if bodyAname == "BrickFour" {
                contact.bodyA.node?.removeFromParent()
            }
            else if bodyBname == "BrickFour"{
                contact.bodyB.node?.removeFromParent()
            }
        }
        if bodyAname == "ball" && bodyBname == "loseZone" || bodyAname == "loseZone" && bodyBname == "ball"{
            if bodyAname == "loseZone"{
                contact.bodyB.node?.removeFromParent()
                makeBall()
                self.physicsWorld.contactDelegate = self
                self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
                ball.physicsBody?.isDynamic = true
                ball.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 5))
            }
        }
    }
    
}

