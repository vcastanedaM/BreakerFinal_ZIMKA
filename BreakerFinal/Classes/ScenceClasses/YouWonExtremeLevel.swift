//
//  youWonFile.swift
//  BreakerFinal
//
//  Created by Victor Castaneda on 5/15/18.
//  Copyright © 2018 Victor Castaneda. All rights reserved.
//

import SpriteKit


class YouWonExtremeLevel: SKScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self);
            if atPoint(location).name == "Level"{
                if let view = self.view as! SKView? {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = ImpossibleLevel(fileNamed: "ImpossibleLevel") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFill
                        // Present the scene
                        view.presentScene(scene, transition: SKTransition.fade(with: .white, duration: 0.5));
                    }
                }
            }
        }
    }
}

