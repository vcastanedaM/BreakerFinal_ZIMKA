//
//  youWonFile.swift
//  BreakerFinal
//
//  Created by Victor Castaneda on 5/15/18.
//  Copyright © 2018 Victor Castaneda. All rights reserved.
//

import SpriteKit


class YouWonLevel2: SKScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self);
            if atPoint(location).name == "NextLevel"{
                if let view = self.view as! SKView? {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = LevelThreeFile(fileNamed: "LevelThree") {
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

