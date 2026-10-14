import SwiftUI

struct ProductView: View {
    var product: Product

    var body: some View {
        VStack(spacing: 16) {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(width: 350)
                .frame(height: 350)
                .clipped()

            Text(product.name)
                .font(.title)
                .lineLimit(2)

            Text(product.description)
                .font(.headline)
                .foregroundColor(.secondary)

            Text(product.price)
                .foregroundColor(.green)
                .font(.system(size: 24))
                .fontWeight(.bold)

            Button {
                // Buy action
            } label: {
                Text("Buy Now")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
        }
        .padding(20)
        .frame(width: 370)
        .frame(height: 550)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    Color(.sRGB,
                          red: 150 / 255,
                          green: 150 / 255,
                          blue: 150 / 255,
                          opacity: 0.6),
                    lineWidth: 1
                )
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 1)
        .onAppear {
            // TODO: Load Amplitude instance here
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: products[0])
                .previewLayout(.fixed(width: 300, height: 510))
    }
}
