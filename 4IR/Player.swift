//
//  Player.swift
//  4IR
//
//  Created by Bharat Mediratta on 10/3/15.
//  Copyright © 2015 Bharat Mediratta. All rights reserved.
//

import UIKit
import GameplayKit


class Player: NSObject, GKGameModelPlayer {
    
    static var allPlayers = [Player(chip: .Red), Player(chip: .Black)]

    var chip: ChipColor
    var color: UIColor
    var name: String
    var playerId: Int
    
    var opponent: Player {
        if chip == .Red {
            return Player.allPlayers[1]
        } else {
            return Player.allPlayers[0]
        }
    }
    
    init(chip: ChipColor) {
        self.chip = chip
        self.playerId = chip.rawValue
        
        if chip == .Red {
            color = .redColor()
            name = "Red"
        } else {
            color = .blackColor()
            name = "Black"
        }
        
        super.init()
    }

}
