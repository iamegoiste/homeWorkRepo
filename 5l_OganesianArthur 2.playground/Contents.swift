import UIKit

protocol CarProtocol {
    var color: UIColor { get set }
    var brand: String { get set }
    var doors: Int { get }
    var wheels: Int { get }
    var engineState: Bool { get set }
    var windowsState: Bool { get set }
    
    func turnEngine () -> Bool
}

extension CarProtocol {
        func turnEngine() -> Bool {
    
            if engineState == true {
                print("Запускаю двигатель")
            } else if engineState == false {
                print("Отключаю двигатель")
            }
            return engineState
        }
    func windowsState() -> Bool {
        if windowsState == true {
                print("Открываю окна")
        } else if windowsState == false {
                print("Закрываю окна")
        }
        return windowsState
    }
}

class SportCar: CarProtocol {
    var windowsState: Bool = false
    
    var engineState: Bool = false
    
    var color: UIColor
    
    var brand: String
    
    var doors: Int
    
    var wheels: Int
    
    var superSpeed: Bool = false
    var lamboDoors: Bool = true
    
    init(color: UIColor, brand: String, doors: Int, wheels: Int, engineState: Bool) {
        self.brand = brand
        self.color = color
        self.doors = doors
        self.wheels = wheels
        self.engineState = engineState
    }

}

extension SportCar: CustomStringConvertible{
    var description: String {
        let message = "Автомобиль бренда \(brand), кол-во дверей \(doors), кол-во колёс \(wheels), состояние двигателя \(engineState), опция superSpeed \(superSpeed), наличие lamboDoors \(lamboDoors) "
        return message
    }
}

var myCar = SportCar(color: .black, brand: "d", doors: 4, wheels: 4, engineState: true)
print(myCar.description)


class TruckCar: CarProtocol{
    
    var windowsState: Bool = false
    
    var color: UIColor
    
    var brand: String
    
    var doors: Int
    
    var wheels: Int
    
    var engineState: Bool
    
    var superCappacity: Int
    
    var cementTank: Bool = true
    
    init(color: UIColor, brand: String, doors: Int, wheels: Int, engineState: Bool, superCappacity: Int) {
        self.brand = brand
        self.color = color
        self.doors = doors
        self.wheels = wheels
        self.engineState = engineState
        self.superCappacity = superCappacity
    }
}

//let carTest = Car(color: .black, brand: "audi", doors: 4, wheels: 4, engineState: false)
//
//carTest.doors = 7
//carTest.turnEngine()
//carTest.engineState = true
//carTest.engineState
//carTest.turnEngine()
//
//
//
