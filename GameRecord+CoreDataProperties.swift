//
//  GameRecord+CoreDataProperties.swift
//  Tic-Tac-Toe
//
//  Created by Kwan Ho Wong on 14/1/2020.
//  Copyright © 2020 Kwan Ho Wong. All rights reserved.
//
//

import Foundation
import CoreData


extension GameRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameRecord> {
        return NSFetchRequest<GameRecord>(entityName: "GameRecord")
    }

    @NSManaged public var winningX: Int16
    @NSManaged public var winningO: Int16
    @NSManaged public var draw: Int16

}
