import XCTest
@testable import EasyValidationManager

class EasyValidationManagerTests: XCTestCase {

    var sut: JsonParser!
    var country: Country!

    override func setUp() {
        super.setUp()
        sut = JsonParser()
        var dicExampleCountry: [String: Any] = [:]
        dicExampleCountry["alpha2"] = "TR"
        dicExampleCountry["alpha3"] = "TUR"
        dicExampleCountry["country_code"] = "90"
        dicExampleCountry["country_name"] = "Turkey"
        dicExampleCountry["mobile_begin_with"] = ["5"]
        dicExampleCountry["phone_number_lengths"] = [10]
        country = Country(json: dicExampleCountry)
    }

    override func tearDown() {
        sut = nil
        country = nil
        super.tearDown()
    }
    
    func test_parseCountryListFromJSONData() {
        let countries = sut.getCountryList()
        XCTAssertEqual(countries.count, 228)
    }
    
    func test_checkFirstCountryIsUS() {
        let countries = sut.getCountryList()
        XCTAssertEqual(countries[0].alpha2, "US")
    }
    
    func test_checkLastCountryZW() {
        let countries = sut.getCountryList()
        XCTAssertEqual(countries[countries.count - 1].alpha2, "ZW")
    }
    
    func test_invalidTurkeyPhoneNumberWithWrongMobileBegin() {
        let result: Bool = PhoneValidation.validPhoneNumber(country: country, phoneNumber: "4551231233")
        XCTAssertEqual(result, false)
    }

    func test_invalidTurkeyPhoneNumberWithWrongPhoneNumberLength() {
        let result: Bool = PhoneValidation.validPhoneNumber(country: country, phoneNumber: "555121233")
        XCTAssertEqual(result, false)
    }
    
    func test_validTurkeyPhoneNumber() {
        let result: Bool = PhoneValidation.validPhoneNumber(country: country, phoneNumber: "5551231233")
        XCTAssertEqual(result, true)
    }
}
