import SwiftUI
import ConfigCat
import AmplitudeSwift

struct ProductView: View {
    var product: Product
    var amplitude: Amplitude
    @State private var featureFlag: FeatureFlag
    
    init(
        product: Product,
        configCatClient: ConfigCatClient,
        amplitude: Amplitude
    ) {
        self.product = product
        self.amplitude = amplitude
        _featureFlag = State(wrappedValue: FeatureFlag(client: configCatClient))
    }

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
                .foregroundColor(
                    // Update the price text color based on the feature flag's value
                    featureFlag.isFeatureFlagEnabled ? .red : .green
                )
                .font(.system(size: 24))
                .fontWeight(.bold)

            Button {
                amplitude.track(eventType: "Price Text Color", eventProperties: [
                    "priceTextColor": featureFlag.isFeatureFlagEnabled ? "red" : "green"
                ])
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
        .task {
            await featureFlag.start()
        }
    }
}
