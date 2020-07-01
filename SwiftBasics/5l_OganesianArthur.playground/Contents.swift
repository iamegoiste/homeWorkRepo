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
        return "Автомобиль бренда \(brand), кол-во дверей \(doors), кол-во колёс \(wheels), состояние двигателя \(engineState), окна \(windowsState), опция superSpeed \(superSpeed), наличие lamboDoors \(lamboDoors) "
    }
}

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
extension TruckCar: CustomStringConvertible{
    var description: String {
        return "Автомобиль бренда \(brand), кол-во дверей \(doors), кол-во колёс \(wheels), состояние двигателя \(engineState), окна \(windowsState), наличие цистерны \(cementTank), объем цистерны \(superCappacity) "
    }
}

var audiQ3 = SportCar(color: .black, brand: "Audi", doors: 4, wheels: 4, engineState: true)
print(audiQ3.description)
audiQ3.color = .blue
audiQ3.lamboDoors = false
audiQ3.engineState = true
audiQ3.doors = 2
print(audiQ3.description)

var truckMan = TruckCar(color: .cyan, brand: "MAN", doors: 6, wheels: 8, engineState: false, superCappacity: 500)
print(truckMan.description)
truckMan.windowsState = true
truckMan.engineState = true
truckMan.superCappacity = 1000
truckMan.doors = 8
print(truckMan.description)

