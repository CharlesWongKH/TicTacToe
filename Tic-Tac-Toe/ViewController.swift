//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Kwan Ho Wong on 14/1/2020.
//  Copyright © 2020 Kwan Ho Wong. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
//    var managedObjectContext : NSManagedObjectContext? {
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
//            return appDelegate.persistentContainer.viewContext
//        }
//        return nil
//    }
    
    var gameRecords : [GameRecord]?

    @IBAction func vsAIPressed(_ sender: Any) {
        performSegue(withIdentifier: "VersusAISegue", sender: sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.loadGameRecord(query: "")
    }

//    func loadGameRecord(query: String) {
//        if let managedObjectContext = self.managedObjectContext {
//            let fetchRequest = NSFetchRequest<GameRecord>(entityName: "GameRecord")
//            if query.count > 0 {
//                let predicate = NSPredicate(format: "winningX contains[cd] %@", query)
//                fetchRequest.predicate = predicate
//            }
//            do {
//                let records = try managedObjectContext.fetch(fetchRequest)
//                self.gameRecords = records
//            } catch {
//                
//            }
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VersusAISegue" {
            if let gameStateViewController = segue.destination as? GameStateViewController {
                gameStateViewController.isCpuActive = true
                print("ok")
            }
        }
    }

}

