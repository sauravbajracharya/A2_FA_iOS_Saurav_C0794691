//
//  Product.swift
//  A2_FA_iOS_Saurav_C0794691
//
//  Created by Saurav Bajracharya on 2021-05-24.
//  Copyright © 2021 Saurav Bajracharya. All rights reserved.
//




class ProductModel
{
    internal init(id: Int, name: String, desc: String, price: Double, provider: String) {
        self.id = id
        self.name = name
        self.desc = desc
        self.price = price
        self.provider = provider
    }
    
    var id: Int
    var name: String
    var desc: String
    var price: Double
    var provider: String
    
    
}

