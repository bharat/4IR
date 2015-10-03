//
//  Board.swift
//  4IR
//
//  Created by Bharat Mediratta on 10/3/15.
//  Copyright © 2015 Bharat Mediratta. All rights reserved.
//

import UIKit

enum ChipColor: Int {
    case None = 0
    case Red
    case Black
}

class Board: NSObject {
    static var width = 7
    static var height = 6
    var currentPlayer: Player
    
    var slots = [ChipColor]()

    override init() {
        currentPlayer = Player.allPlayers[0]

        for _ in 0 ..< Board.width * Board.height {
            slots.append(.None)
        }
        
        super.init()
    }

    func chipInColumn(column: Int, row: Int) -> ChipColor {
        return slots[row + column * Board.height]
    }
    
    func setChip(chip: ChipColor, inColumn column: NSInteger, row: NSInteger) {
        slots[row + column * Board.height] = chip;
    }

    func nextEmptySlotInColumn(column: Int) -> Int? {
        for var row = 0; row < Board.height; row++ {
            if chipInColumn(column, row:row) == .None {
                return row
            }
        }
        
        return nil;
    }
    
    func canMoveInColumn(column: Int) -> Bool {
        return nextEmptySlotInColumn(column) != nil
    }
    
    func addChip(chip: ChipColor, inColumn column: Int) {
        if let row = nextEmptySlotInColumn(column) {
            setChip(chip, inColumn:column, row:row)
        }
    }
    
    func isFull() -> Bool {
        return false
    }
    
    func isWinForPlayer(player: Player) -> Bool {
        return false
    }

}
