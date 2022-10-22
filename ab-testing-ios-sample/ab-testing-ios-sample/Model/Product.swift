//
//  Product.swift
//  ab-testing-ios-sample
//
//  Created by Chavez Harris on 10/21/22.
//

import Foundation

struct Product: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var description: String
    var price: String
}

let products: [Product] = [
    .init(id: 1, name: "Coffee Warmer", description: "Cofee and beverage warmer heating plate...", price: "$60.00")
]
