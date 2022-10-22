//
//  ProductCard.swift
//  ab-testing-ios-sample
//
//  Created by Chavez Harris on 10/21/22.

import Foundation
import SwiftUI

struct ProductCard: View {
    var product: Product
    
    var body: some View {
        VStack{
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 300)
            VStack{
                Text(product.name)
                    .font(.title)
                    .lineLimit(2)
                Spacer()
                Text(product.description)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Spacer()
                Spacer()
                Text(product.price)
                    .foregroundColor(.green)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                Spacer()
                Button {
                    Ampli.instance.productTap()
                } label: {
                    Text("Buy Now")
                }
                .buttonStyle(.bordered)
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(8)
            }
            .padding()
            Spacer()
        }
        .frame(height: 500)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                .padding([.all], -20)
        )
        .shadow(radius: 1)
        .onAppear{
            Ampli.instance.load(LoadOptions(
            environment: AmpliEnvironment.production,
            client: LoadClientOptions(apiKey: "2550487ccf158fe7927ecde7d9207d5b")))
        }
        
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProductCard(product: products[0])
                .previewLayout(.fixed(width: 300, height: 510))
        }
    }
}
