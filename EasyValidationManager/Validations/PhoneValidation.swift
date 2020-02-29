import Foundation

public class PhoneValidation {
    
    private init() {}
    
    public static func validPhoneNumber(country: Country, phoneNumber: String) -> Bool {
        
        var isCorrectMobileBegin: Bool = false

        let mobileBeginWithArray = country.mobileBeginWith ?? []
        
        for index in 0..<mobileBeginWithArray.count {
            if phoneNumber.starts(with: mobileBeginWithArray[index]) {
                isCorrectMobileBegin = true
            }
        }

        if (!isCorrectMobileBegin) {
            return false
        }

        var isCorrectPhoneNumberLength: Bool = false
        
        
        let phoneNumberLengthsArray = country.phoneNumberLengths ?? []
        for index in 0..<phoneNumberLengthsArray.count {
            if (phoneNumber.count == phoneNumberLengthsArray[index]) {
                isCorrectPhoneNumberLength = true
                break
            }
        }

        if (!isCorrectPhoneNumberLength) {
            return false
        }

        return true
    }
}
