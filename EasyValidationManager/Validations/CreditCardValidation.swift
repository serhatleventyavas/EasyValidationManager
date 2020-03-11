import Foundation

public class CreditCardValidation {
    
    private init() {}
    
    public static func validCreditCard(cardNumber: String) -> Bool {
        if cardNumber.trimmingCharacters(in: .whitespacesAndNewlines).count != 16 {
            return false
        }
        
        let cardNumberArray = Array(cardNumber)
        var numberList: [Int] = []
        
        let lastDigit: Int = Int(String(cardNumberArray[cardNumberArray.count - 1]))!
        
        for index in 0...cardNumberArray.count - 2 {
            let number: Int = Int(String(cardNumberArray[index]))!
            numberList.append(number)
        }
        
        numberList.reverse()
        
        for index in 0..<numberList.count {
            if (index % 2 == 0) {
                let number = numberList[index]
                numberList[index] = number * 2
            }
        }
        
        for index in 0..<numberList.count {
            if (index % 2 == 0) {
                let number = numberList[index]
                if (number > 9) {
                    numberList[index] = number - 9
                }
            }
        }
        
        var totalSum = 0
        
        for index in 0..<numberList.count {
            let number = numberList[index]
            totalSum += number
        }
        
        let resultOfMod10 = (totalSum + lastDigit) % 10
        return resultOfMod10 == 0
    }
    
}
