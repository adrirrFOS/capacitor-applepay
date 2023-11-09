import Foundation
import PassKit

extension PKMerchantCapability {

    init?(capability: String) {
        switch capability.lowercased() {
        case "capability3ds": self.init(rawValue: PKMerchantCapability.capability3DS.rawValue)
        case "capabilitycredit": self.init(rawValue: PKMerchantCapability.capabilityCredit.rawValue)
        case "capabilitydebit": self.init(rawValue: PKMerchantCapability.capabilityDebit.rawValue)
        case "capabilityemv": self.init(rawValue: PKMerchantCapability.capabilityEMV.rawValue)
        default: return nil
        }
    }

    init(capabilities: [String]) {
        self.init()

        for stringCap in capabilities {
            if let resolvedCap = PKMerchantCapability(capability: stringCap) {
                self.insert(resolvedCap)
            }
        }
    }
}
