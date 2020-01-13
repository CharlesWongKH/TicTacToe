//
//  GameStateViewController.swift
//  Tic-Tac-Toe
//
//  Created by Kwan Ho Wong on 14/1/2020.
//  Copyright © 2020 Kwan Ho Wong. All rights reserved.
//

import UIKit
import CoreData

class GameStateViewController: UIViewController {
    
    var records : GameRecord?
//    var managedObjectContex : NSManagedObjectContext? {
//        if let delegate = UIApplication.shared.delegate as? AppDelegate {
//            return delegate.persistentContainer.viewContext;
//        }
//        return nil;
//    }
    
    // Player 1 = X
    var activePlayer = 1
    var isCpuActive = Bool()
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningSituations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive: Bool = true

    @IBAction func playerTab(_ sender: UIButton) {
        if (gameIsActive == true && gameState[sender.tag] == 0) {
            // Record the player num
            gameState[sender.tag] = activePlayer
            
            if (activePlayer == 1) {
                
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
                // Switch to player 2
                activePlayer = 2
                
                // If game is going on
                if (resultLabel.isHidden) {
                    playerNameLabel.text = "Player 2"
                    // If CPU is active
                    if (isCpuActive == true) {
                        cpuRound()
                    }
                }
            } else {
                sender.setImage(UIImage(named: "circle.png"), for: UIControl.State())
                // Switch to player 1
                activePlayer = 1
                // If game is going on
                if (resultLabel.isHidden) {
                    playerNameLabel.text = "Player 1"
                }
            }
        }
        
        for combination in winningSituations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                gameIsActive = false
                
                if (gameState[combination[0]] == 1) {
                    playerNameLabel.text = "Player 1"
                } else {
                    playerNameLabel.text = "Player 2"
                }
                
                resultLabel.isHidden = false
                doneButton.isHidden = false
            }
        }
        
        gameIsActive = false
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        
        if (gameIsActive == false) {
            resultLabel.text = "Draw"
            resultLabel.isHidden = false
            doneButton.isHidden = false
        }
    }
    
    @IBAction func backToRootAction(_ sender: Any) {
//        if let context = self.managedObjectContex {
//            if let record = records {
//                if (resultLabel.text == "Won") {
//                    if (playerNameLabel.text == "Player 1"){
//                        record.winningX += 1
//                    } else {
//                        record.winningO += 1
//                    }
//                } else if (resultLabel.text == "Draw") {
//                    record.draw += 1
//                }
//            } else if let newRecord = NSEntityDescription.insertNewObject(forEntityName: "GameRecord", into: context) as? GameRecord {
//                
//            }
//            do {
//                try context.save();
//            } catch {
//                print("can't save");
//            }
//        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = "Won"
        playerNameLabel.text = "Player 1"
        resultLabel.isHidden = true
        doneButton.isHidden = true
    }

    func cpuRound() {
        var activePosition: [Int] = []
        // Looping and add the remaining button to the array
        for i in 0...8 {
            if gameState[i] == 0 {
                activePosition.append(i)
            }
        }
        print(activePosition)
        if (!(activePosition.isEmpty)) {
            let randomTag = activePosition.randomElement()
            var tappedButton = self.view.viewWithTag(randomTag!) as? UIButton
            tappedButton?.sendActions(for: .touchUpInside)
        }
        activePlayer = 1
    }
}
