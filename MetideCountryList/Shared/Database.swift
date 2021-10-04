//
//  Database.swift
//  MetideCountryList
//
//  Created by Norhan Boghdadi on 10/4/21.
//

import Foundation


class Database {
    static let shared = Database()
    fileprivate var allItems: [CountiresList]
    
     func itemsDataURL() -> URL {
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).last!
        return documentDirectoryURL.appendingPathComponent("itemsData.json")
    }
    
     func itemsReadFromDisk() -> [CountiresList]? {
        let fileItemsURL = itemsDataURL()
        guard FileManager.default.fileExists(atPath: fileItemsURL.path) else {
            return nil
        }
        do {
            let fileContents = try Data(contentsOf: fileItemsURL)
            let list = try JSONDecoder().decode([CountiresList].self, from: fileContents)
            return list
        } catch let error as NSError {
            NSLog("Error reading file: \(error.localizedDescription)")
        }
        return nil
    }
    
    
    func itemsWriteToDisk() {
        do {
            let data = try JSONEncoder().encode(allItems)
            try data.write(to: itemsDataURL())
        } catch let error as NSError {
            NSLog("Error reading file: \(error.localizedDescription)")
        }
    }
    
   
    
    func changeMode(for forItem: [CountiresList]) {
        allItems.append(contentsOf: forItem)
        itemsWriteToDisk()
    }
    func clearMode() {
        allItems.removeAll()
        itemsWriteToDisk()
    }
    func checkEmptiness() -> Bool {
        if allItems.isEmpty {
            return true
        }
        return false
    }

    
       // MARK: -
    init() {
        
        allItems = [CountiresList]()
    }
}

