//
//  GameViewController.swift
//  Installed Fonts
//
//  Created by Pavley, John on 1/27/16.
//  Copyright (c) 2016 Epic Loot. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = GameScene(size:CGSize(width: 2048, height: 1536))
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
