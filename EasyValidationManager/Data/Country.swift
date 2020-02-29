public struct Country: Decodable {
    public var alpha2: String?
    public var alpha3: String?
    public var countryCode: String?
    public var countryName: String?
    public var mobileBeginWith: [String]?
    public var phoneNumberLengths: [Int]?

    enum CodingKeys: String, CodingKey {
        case alpha2
        case alpha3
        case countryCode = "country_code"
        case countryName = "country_name"
        case mobileBeginWith = "mobile_begin_with"
        case phoneNumberLengths = "phone_number_lengths"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        alpha2 = try values.decode(String.self, forKey: .alpha2)
        alpha3 = try values.decode(String.self, forKey: .alpha3)
        countryCode = try values.decode(String.self, forKey: .countryCode)
        countryName = try values.decode(String.self, forKey: .countryName)
        mobileBeginWith = try values.decode([String].self, forKey: .mobileBeginWith)
        phoneNumberLengths = try values.decode([Int].self, forKey: .phoneNumberLengths)
        
    }
    
    public init(json: [String: Any]) {
        alpha2 = json["alpha2"] as? String
        alpha3 = json["alpha3"] as? String
        countryCode = json["country_code"] as? String
        countryName = json["country_name"] as? String
        mobileBeginWith = json["mobile_begin_with"] as? [String]
        phoneNumberLengths = json["phone_number_lengths"] as? [Int]
    }
}
