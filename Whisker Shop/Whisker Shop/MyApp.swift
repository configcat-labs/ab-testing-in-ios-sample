import SwiftUI
import ConfigCat
import AmplitudeSwift

@main
struct MyApp: App {
    private let configCatClient = ConfigCatClient.get(sdkKey: "YOUR-CONFIGCAT-SDK-KEY") { options in
        options.pollingMode = PollingModes.autoPoll(autoPollIntervalInSeconds: 5)
    }
    // Initialize Amplitude with your API key
    let amplitude = Amplitude(configuration: Configuration(apiKey: "YOUR-AMPLITUDE-API-KEY"))
    var body: some Scene {
        WindowGroup {
            ProductView(
                product: products[0],
                configCatClient: configCatClient,
                amplitude: amplitude
            )
        }
    }
}
