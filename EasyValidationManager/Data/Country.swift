public struct Country: Decodable {
    public var alpha2: String?
    public var alpha3: String?
    public var countryCode: String?
    public var countryName: String?
    public var mobileBeginWith: [String]?
    public var phoneNumberLengths: [Int]?
    
    public init(json: [String: Any]) {
        alpha2 = json["alpha2"] as? String
        alpha3 = json["alpha3"] as? String
        countryCode = json["country_code"] as? String
        countryName = json["country_name"] as? String
        mobileBeginWith = json["mobile_begin_with"] as? [String]
        phoneNumberLengths = json["phone_number_lengths"] as? [Int]
    }
}
