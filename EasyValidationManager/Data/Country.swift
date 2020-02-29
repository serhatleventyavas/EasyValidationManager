public struct Country: Decodable {
    var alpha2: String?
    var alpha3: String?
    var countryCode: String?
    var countryName: String?
    var mobileBeginWith: [String]?
    var phoneNumberLengths: [Int]?
    
    init(json: [String: Any]) {
        alpha2 = json["alpha2"] as? String
        alpha3 = json["alpha3"] as? String
        countryCode = json["country_code"] as? String
        countryName = json["country_name"] as? String
        mobileBeginWith = json["mobile_begin_with"] as? [String]
        phoneNumberLengths = json["phone_number_lengths"] as? [Int]
    }
}
