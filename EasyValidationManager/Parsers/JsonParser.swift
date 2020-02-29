import Foundation

public class JsonParser {
    
    public init() {}
    
    public func getCountryList() -> [Country] {
        let path = Bundle(for: type(of: self)).path(forResource: "country", ofType: "json")
        guard let filePath = path, let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else { return [] }
        
        do {
            let countries = try JSONDecoder().decode([Country].self, from: jsonData)
            return countries
        } catch let error {
            print("Json Parse Error : \(error)")
            return []
        }
    }
}
