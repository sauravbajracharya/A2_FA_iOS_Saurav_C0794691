//
//  Provider+CoreDataProperties.swift
//  A2_FA_iOS_Saurav_C0794691
//
//  Created by Saurav Bajracharya on 2021-05-25.
//  Copyright © 2021 Saurav Bajracharya. All rights reserved.
//
//

import Foundation
import CoreData


extension Provider {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Provider> {
        return NSFetchRequest<Provider>(entityName: "Provider")
    }

    @NSManaged public var name: String?
    @NSManaged public var providers: NSSet?

}

// MARK: Generated accessors for providers
extension Provider {

    @objc(addProvidersObject:)
    @NSManaged public func addToProviders(_ value: Product)

    @objc(removeProvidersObject:)
    @NSManaged public func removeFromProviders(_ value: Product)

    @objc(addProviders:)
    @NSManaged public func addToProviders(_ values: NSSet)

    @objc(removeProviders:)
    @NSManaged public func removeFromProviders(_ values: NSSet)

}
