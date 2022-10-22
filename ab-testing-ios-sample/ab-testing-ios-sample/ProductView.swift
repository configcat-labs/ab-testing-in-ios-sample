//
//  ProductView.swift
//  ab-testing-ios-sample
//
//  Created by Chavez Harris on 10/21/22.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        VStack(spacing: 10) {
            ForEach(products, id: \.id) {
                product in ProductCard(product: product)
            }
        }.frame(alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
