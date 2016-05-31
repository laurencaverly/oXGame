//
//  OXGame.swift
//  NoughtsAndCrosses
//
//  Created by Lauren Caverly on 5/31/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import Foundation

enum CellType: String {
    
    case X = "X"
    
    case O = "O"
    
    case EMPTY = ""
}

enum OXGameState: String {
    
    case inProgress
    
    case complete_no_one_won
    
    case complete_someone_won
}

class OXGame {
    
    private var board = [CellType] (count: 9, repeatedValue: CellType.EMPTY)
    
    private var startType: CellType = CellType.X
    
    func turn() -> Int {
        
        var count = 0
        
        for cell in board {
            if cell != CellType.EMPTY {
                count += 1
            }
        }
        return count
    }
    
    
    
    
    
    func whosTurn() -> CellType {
        
        if turn() % 2 != 0 {
            return CellType.X
        } else {
            return CellType.O
        }
    }
    
    
    
    func typeAtIndex(index: Int) -> CellType {
        return board[index]
    }
    
    
    
    func playMove(button: Int) -> CellType {
        
        if turn() % 2 == 0 {
            board[button] = CellType.X
        } else {
            board[button] = CellType.O
        }
        
        return board[button]
    }
    
    
    
    func winDetection() -> Bool {
        
        //check for winner in rows
        for i in 0...2 {
            if (board[3*i] == board[3*i+1]) && board[3*i+1] == board[3*i+2] && board[3*i] != CellType.EMPTY {
                return true
            }
        }
        
        //check for winner in columns
        for i in 0...2 {
            if board[i] == board[i+3] && board[i+3]==board[i+6] && board[i] != CellType.EMPTY {
                return true
            }
        }
            
        //check for winner in right diagonal
        if board[0] == board[4] && board[4] == board[8] && board[0] != CellType.EMPTY {
            return true
        }
        
        //check for winner in left diagonal
        if board[2] == board[4] && board[4] == board[6] && board[3] != CellType.EMPTY {
            return true
        }
        
        return false
    }

    
    
    
    func state() -> OXGameState {
        
        let isWinner: Bool = winDetection()
        
        if isWinner == true {
            return OXGameState.complete_someone_won
        } else if (isWinner == false) && (turn() == 9) {
            return OXGameState.complete_no_one_won
        } else {
            return OXGameState.inProgress
        }
    }
    
    
    
    func reset() {
        board = [CellType] (count: 9, repeatedValue: CellType.EMPTY)
    }
    
}
