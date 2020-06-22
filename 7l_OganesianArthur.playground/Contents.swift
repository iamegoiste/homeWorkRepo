import UIKit

struct Cats {
    let kind: String
}
enum PetShopError: Error {
    case notEnoughMoney(moneyNeeded: Int)
    case tooYoungForSale
    case invalidSelection
}
struct Animal {
    var price: Int
    var age: Int // month
    var color: UIColor
    var type: Cats
}

class PetShop {
    private var animals = [
        "British": Animal(price: 500, age: 3, color: .gray, type: Cats(kind: "British")),
        "Scotish": Animal(price: 300, age: 5, color: .black, type: Cats(kind: "Scotish")),
        "Oriental": Animal(price: 350, age: 1, color: .brown, type: Cats(kind: "Oriental")),
        "Siam": Animal(price: 200, age: 7, color: .blue, type: Cats(kind: "Siam")),
        "Leopard": Animal(price: 500, age: 2, color: .darkGray, type: Cats(kind: "Leopard"))
    ]
    var moneyInWallet = 0

    func sale(catKind kind: String) -> (Cats?, Error?) {
        guard let cat = animals[kind] else {
            return (nil, PetShopError.invalidSelection)
        }

        guard cat.age >= 3 else {
            return (nil, PetShopError.tooYoungForSale)
        }

        guard cat.price <= moneyInWallet else {
            return (nil, PetShopError.notEnoughMoney(moneyNeeded: cat.price - moneyInWallet))
        }

        moneyInWallet -= cat.price

        print("Sold \(kind) cat")

        return (cat.type, nil)
    }
}
let petShop = PetShop()

petShop.moneyInWallet = 100

let (result, error) = petShop.sale(catKind: "British")

if let error = error {
    switch error {
    case PetShopError.invalidSelection:
        print("Invalid selection")
    case PetShopError.tooYoungForSale:
        print("Too young for sale, only reserve")
    case PetShopError.notEnoughMoney(let needed):
        print("Need \(needed) more rubles")
    default:
        print("N/A")
    }
}

struct MyCard {
    var balance = 100000
}

enum AtmError: Error {
    case notEnoughMoneyOnCard
    case notEnoughMoneyInATM
    
}
class ATM {
    var balanceATM = 10000
    
    func withDrow (moneySum: Int, myCard: MyCard) throws {
        var resultCard: MyCard = MyCard()
        guard moneySum <= balanceATM else {
            throw AtmError.notEnoughMoneyInATM
        }
        guard myCard.balance > moneySum else {
            throw AtmError.notEnoughMoneyOnCard
        }
        
        resultCard.balance = myCard.balance - moneySum
        
        print("Выдано \(moneySum), остаток \(resultCard.balance)")
    }
}

var atm = ATM()
var myCard = MyCard()
do {
   try atm.withDrow(moneySum: 11000, myCard: myCard)
}
catch AtmError.notEnoughMoneyInATM {
    print("Not enough money in ATM")
}
catch AtmError.notEnoughMoneyOnCard {
    print("Not enough money on card")
}
