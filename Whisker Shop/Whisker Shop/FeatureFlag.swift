import Foundation
import ConfigCat

@MainActor
@Observable
final class FeatureFlag {
    private(set) var isFeatureFlagEnabled = false
    
    @ObservationIgnored private let client: ConfigCatClient
    @ObservationIgnored private var hasStarted = false
    
    // Add your feature flag key here
    static let featureFlagKey = "redPriceText"
    static let appUser = ConfigCatUser(identifier: "user-123")
    
    init(client: ConfigCatClient) {
        self.client = client
        
        client.hooks.addOnConfigChanged { [weak self] _, snapshot in
            let isEnabled = snapshot.getValue(for: FeatureFlag.featureFlagKey, defaultValue: false, user: FeatureFlag.appUser)
            
            Task { @MainActor [weak self] in
                self?.isFeatureFlagEnabled = isEnabled
            }
        }
    }
    
    func start() async {
        guard !hasStarted else { return }
        
        hasStarted = true
        
        await client.waitForReady()
        
        let snapshot = client.snapshot()
        
        isFeatureFlagEnabled = snapshot.getValue(
            for: FeatureFlag.featureFlagKey,
            defaultValue: false,
            user: FeatureFlag.appUser
        )
    }
}

