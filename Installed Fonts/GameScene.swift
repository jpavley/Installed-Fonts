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
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "handleTap:")
        view.addGestureRecognizer(tapRecognizer)

    }
    
    
    func handleLeftSwipe(recognizer:UIGestureRecognizer) {
        incrementIndex()
        showFontFamilyByIndex(fontFamilyIndex)
    }
    
    func handleRightSwipe(recognizer:UIGestureRecognizer) {
        decrementIndex()
        showFontFamilyByIndex(fontFamilyIndex)
    }
    
    func handleTap(recognizer:UIGestureRecognizer) {
        incrementIndex()
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
            
            // Clever way to arrange the font names on nicely on the screen
            // from Raywenderlich.com
            
            // - Center the labels horizontally
            // - Divide the vertical space into a stack of evenly size zones
            // - Postion each label at the bottom of a zone
            // - Use the number of labels + 1 as the number of zones
            // - Use a fraction to do this interatively
            
            let x = size.width / 2
            let yNumerator = size.height * (CGFloat(i+1))
            let yDemoninator = CGFloat(fontNames.count)+1
            let y = yNumerator / yDemoninator
            
            // uncomment this line to see how it works
            //print("\(y) = \(yNumerator) ÷ \(yDemoninator)")
            
            label.position = CGPoint(x: x, y: y)
            
            label.fontSize = 50
            label.verticalAlignmentMode = .Center
            addChild(label)
        }
        
        let totalFamilyCount = UIFont.familyNames().count
        
        let titleLabel = SKLabelNode(text: "Installed Font Families \(totalFamilyCount)")
        titleLabel.fontName = "Helvetica"
        titleLabel.position = CGPoint(x: size.width / 2, y: size.height - 40)
        titleLabel.fontColor = UIColor.yellowColor()
        addChild(titleLabel)
        
        
        let indexLabel = SKLabelNode(text: "\(fontFamilyName) Index: \(fontFamilyIndex), Fonts: \(fontNames.count)")
        indexLabel.fontName = "Helvetica"
        indexLabel.position = CGPoint(x: size.width / 2, y: 20)
        indexLabel.fontColor = UIColor.yellowColor()
        addChild(indexLabel)
        
    }
}
