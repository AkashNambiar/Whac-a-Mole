//
//  GameScene.swift
//  Whac-a-Mole
//
//  Created by Akash Nambiar on 6/30/17.
//  Copyright © 2017 Akash Nambiar. All rights reserved.
//

import SpriteKit

enum playingState {
    case playing, notPlaying
}

enum moleState {
    case alive, dead
}

var currentState: playingState = .notPlaying
var allMoles: [moleState] = [.dead, .dead, .dead, .dead,
                             .dead, .dead, .dead, .dead,
                             .dead, .dead, .dead, .dead,
                             .dead, .dead, .dead, .dead]

var playButton: MSButtonNode!
var score: SKLabelNode!

var frequency = 120
var i = 0

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
        print("1")
        
        
        score = childNode(withName: "score") as! SKLabelNode
        playButton = childNode(withName: "playButton") as! MSButtonNode
        
        playButton.selectedHandler = {
            print("2")
            currentState = .playing
        }
        
        addMole()
        
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if i > frequency {
            print("addMole")
            addMole()
        }else{
            i += 1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        let locationTouch = touch.location(in: self)
        
        var row = 100
        var column = 100
        var location = 100
        
        if locationTouch.y >= 120 || locationTouch.y < 200 {
            row = 3
        }else if locationTouch.y >= 200 || locationTouch.y < 280 {
            row = 2
        }else if locationTouch.y >= 280 || locationTouch.y < 360 {
            row = 1
        }else if locationTouch.y >= 360 || locationTouch.y < 440 {
            row = 0
        }
        
        if locationTouch.x >= 0 || locationTouch.x < 80 {
            column = 0
        }else if locationTouch.x >= 80 || locationTouch.x < 160 {
            column = 1
        }else if locationTouch.x >= 160 || locationTouch.x < 240 {
            column = 2
        }else if locationTouch.x >= 240 || locationTouch.x < 320 {
            column = 3
        }
        
        //1
        if row == 0 && column == 0{
            location = 0
        }else if row == 0 && column == 1{
            location = 1
        }else if row == 0 && column == 2{
            location = 2
        }else if row == 0 && column == 3{
            location = 3
            //2
        }else if row == 1 && column == 0{
            location = 4
        }else if row == 1 && column == 1{
            location = 5
        }else if row == 1 && column == 2{
            location = 6
        }else if row == 1 && column == 3{
            location = 7
            //3
        }else if row == 2 && column == 0{
            location = 8
        }else if row == 2 && column == 1{
            location = 9
        }else if row == 2 && column == 2{
            location = 10
        }else if row == 2 && column == 3{
            location = 11
            //4
        }else if row == 3 && column == 0{
            location = 12
        }else if row == 3 && column == 1{
            location = 13
        }else if row == 3 && column == 2{
            location = 14
        }else if row == 3 && column == 3{
            location = 15
        }
        
        if location >= 0 && location <= 15 {
          
            var moleTouched = allMoles[location]
            
            if moleTouched == .alive{
                moleTouched = .dead
                
                let moleDeath = SKAction.run ({
                   
                })
                self.run(moleDeath)
            }
        }
    }
    
    func addMole() {
        var location = Int(arc4random_uniform(16))
        
        while allMoles[location] == .alive {
            location = Int(arc4random_uniform(16))
        }
        
        allMoles[location] = .alive
        
        let mole = Mole()
        
        mole.xScale = 1.25
        mole.yScale = 1.25
        mole.zPosition = 1
        mole.anchorPoint.x = 0
        mole.anchorPoint.y = 0
        
        var xPosition: CGFloat = 0
        var yPosition: CGFloat = 0
        
        // X
        if location == 0 || location == 4 || location == 8  || location == 12 {
            xPosition = 0
        }else if location == 1 || location == 5 || location == 9  || location == 13 {
            xPosition = 80
        }else if location == 2 || location == 6 || location == 10  || location == 14 {
            xPosition = 160
        }else if location == 3 || location == 7 || location == 911 || location == 15 {
            xPosition = 240
        }
        
        // Y
        if location == 0 || location == 1 || location == 2 || location == 3 {
            yPosition = 360
        }else if location == 4 || location == 5 || location == 6 || location == 7 {
            yPosition = 280
        }else if location == 8 || location == 9 || location == 10 || location == 11 {
            yPosition = 200
        }else if location == 12 || location == 13 || location == 14 || location == 15{
            yPosition = 120
        }
        
        mole.position.x = xPosition
        mole.position.y = yPosition
        
        addChild(mole)
        
    }
    
}
