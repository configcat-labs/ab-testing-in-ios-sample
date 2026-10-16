//
//  ProductModel.swift
//  Whisker Shop
//
//  Created by Chavez Harris on 13/10/2026.
//

import Foundation

struct Product: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var description: String
    var price: String
    var image: String
}

let products: [Product] = [
    .init(id: 1, name: "Coffee Warmer", description: "Electric coffee warming plate.", price: "$60.00", image: "coffee-warmer")
]
