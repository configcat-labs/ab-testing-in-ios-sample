import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ProductView(product: products[0])
        }
    }
}
