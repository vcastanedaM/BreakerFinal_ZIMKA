 //
//  SoundPlayer.swift
//  BreakerFinal
//
//  Created by Student on 5/4/18.
//  Copyright © 2018 Victor Castaneda. All rights reserved.
//

import Foundation
import SpriteKit
 
 let Ksound = "ksound"
 
 class SoundPlayer {
    private init() {}
    static let shared = SoundPlayer()
    
    func setSounds(state: Bool) {
        UserDefaults.standard.set(state , forKey: Ksound )
         UserDefaults.standard.synchronize()
    }
    
    func getSound() ->  Bool {
        return UserDefaults.standard.bool(forKey: Ksound)
    }
 }
 
 
 
 
 
 
 
 
 
 
