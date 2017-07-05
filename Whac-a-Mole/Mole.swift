//
//  Mole.swift
//  Whac-a-Mole
//
//  Created by Akash Nambiar on 6/30/17.
//  Copyright © 2017 Akash Nambiar. All rights reserved.
//

import SpriteKit

class Mole: SKSpriteNode {
  
     init() {
        let texture = SKTexture(imageNamed: "mole")
        let color = UIColor.brown
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}
