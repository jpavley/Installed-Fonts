//
//  GameScene.swift
//  Installed Fonts
//
//  Created by Pavley, John on 1/27/16.
//  Copyright (c) 2016 Epic Loot. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var fontFamilyIndex = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        showFontFamilyByIndex(fontFamilyIndex)
    }
    
    func incrementIndex() {
        fontFamilyIndex++
        if fontFamilyIndex >= UIFont.familyNames().count {
            fontFamilyIndex = 0
        }
    }
    
    func decrementIndex() {
        fontFamilyIndex--
        if fontFamilyIndex <= 0 {
            fontFamilyIndex = UIFont.familyNames().count - 1
        }
    }
    
    override func didMoveToView(view: SKView) {
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: "handleLeftSwipe:")
        swipeLeftRecognizer.direction = .Left
        view.addGestureRecognizer(swipeLeftRecognizer)
        
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: "handleRightSwipe:")
        swipeRightRecognizer.direction = .Right
        view.addGestureRecognizer(swipeRightRecognizer)

    }
    
    
    func handleLeftSwipe(recognizer:UIGestureRecognizer) {
        incrementIndex()
        showFontFamilyByIndex(fontFamilyIndex)
    }
    
    func handleRightSwipe(recognizer:UIGestureRecognizer) {
        decrementIndex()
        showFontFamilyByIndex(fontFamilyIndex)
    }
    
    func showFontFamilyByIndex(index: Int) {
        removeAllChildren()
        let fontFamilyName = UIFont.familyNames()[fontFamilyIndex]
        print("fontFamilyName: \(fontFamilyName)")
        
        let fontNames = UIFont.fontNamesForFamilyName(fontFamilyName)
        
        for (i, fontName) in fontNames.enumerate() {
            let label = SKLabelNode(fontNamed: fontName)
            label.text = fontName
            
            let x = size.width / 2
            let y = (size.height * (CGFloat(i+1))) / (CGFloat(fontNames.count)+1)
            label.position = CGPoint(x: x, y: y)
            
            label.fontSize = 50
            label.verticalAlignmentMode = .Center
            addChild(label)
        }
        
        let totalFamilyCount = UIFont.familyNames().count
        
        let titleLabel = SKLabelNode(text: "Installed Families \(totalFamilyCount)")
        titleLabel.fontName = "Helvetica"
        titleLabel.position = CGPoint(x: size.width / 2, y: size.height - 40)
        titleLabel.fontColor = UIColor.yellowColor()
        addChild(titleLabel)
        
        
        let indexLabel = SKLabelNode(text: "Family Index: \(fontFamilyIndex), Fonts: \(fontNames.count)")
        indexLabel.fontName = "Helvetica"
        indexLabel.position = CGPoint(x: size.width / 2, y: 20)
        indexLabel.fontColor = UIColor.yellowColor()
        addChild(indexLabel)
        
    }
}
