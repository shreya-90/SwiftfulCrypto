//
//  PortfolioDataService.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 31/10/24.
//

import Foundation
import CoreData

class PortfolioDataService {
    
    let container: NSPersistentContainer
    let containerName: String = "PortfolioContainer"
    let entityName: String = "PortfolioEntity"
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    init() {
        self.container = NSPersistentContainer(name: containerName)
        
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error Loading Core Data!")
            }
        }
        
        getPortfolio() 
        
    }
    
    //MARK: PUBLIC
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        if let entity = savedEntities.first( where:  { $0.coinID == coin.id }) {
            
            if amount > 0 {
                updatePortfolio(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            addToPortfolio(coin: coin, amount: amount)
        }
            
    }
    
    // MARK: PRIVATE
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        
        do {
             savedEntities = try container.viewContext.fetch(request)
        } catch(let error) {
            print("Error Fetching Entities. \(error)")
        }
    }
    
    private func addToPortfolio(coin: CoinModel, amount: Double) {
        
        let entity = PortfolioEntity(context: container.viewContext) // new entity created
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
       
    }
    
    private func updatePortfolio(entity: PortfolioEntity, amount: Double) {
        //entity already exists
        
        entity.amount = amount
        applyChanges()
    }
    
    private func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch(let error) {
            print("Error saving to Core Data. \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        getPortfolio()
    }
}
