import UIKit


enum CarAction {
    case stopEngine, startEngine, openWindows, closeWindows, enableNitro, disableNitro, loadTruck, unLoadTruck
}

class Car {
    
    let brand: String
    let color: UIColor
    var isEngineOn: Bool = false
    var isWindowsOpen: Bool = false
    var wheelCount: Int
    
    init(brand: String, color: UIColor, wheelCount: Int) {
        self.brand = brand
        self.color = color
        self.wheelCount = wheelCount
    }
    
    func toDo(action: CarAction) {
        switch action {
        case .stopEngine:
            guard isEngineOn else {
                print("Двигатель уже выключен")
                return
            }
            isEngineOn = false
            case .startEngine:
            guard !isEngineOn else {
                print("Двигатель уже включен")
                return
            }
            isEngineOn = true
            
        case .closeWindows:
            guard isWindowsOpen else{
                print("Окна уже закрыты")
                return
            }
            isWindowsOpen = false
            
        case .openWindows:
        guard !isWindowsOpen else{
            print("Окна уже открыты")
            return
        }
            isWindowsOpen = true
            
        default:
            return
        }
    }
}
    
class TruckCar: Car {
    var baggageCappacity: Int
    var currentBaggageUsedPlace: Int = 0
    
    
    init(brand: String, color: UIColor, wheelCount: Int, capacity: Int) {
        self.baggageCappacity = capacity
        super.init(brand: brand, color: color, wheelCount: wheelCount)
    }
        override func toDo(action: CarAction) {
            super.toDo(action: action)
                if action == .loadTruck {
                    currentBaggageUsedPlace = min(currentBaggageUsedPlace + 1, baggageCappacity)
                }
                else if action == .unLoadTruck {
                    currentBaggageUsedPlace = max(currentBaggageUsedPlace - 1, 0)
                }
        }
    }

    

class SportCar: Car {
    var isNitrOxygenOn: Bool = false
    override func toDo(action: CarAction) {
        super.toDo(action: action)
        switch action {
        case .disableNitro:
            guard isNitrOxygenOn else {
                print("Закись озота не подается")
                return
            }
            isNitrOxygenOn = false
            
        case .enableNitro:
            guard !isNitrOxygenOn else {
                print("Подача закиси озота уже включена ")
                return
            }
            isNitrOxygenOn = true
            
        default:
            return
        }
    }
}

var truckMan = TruckCar(brand: "Man", color: .brown, wheelCount: 8, capacity: 50)
var sportAudi = SportCar(brand: "AUDI", color: .black, wheelCount: 4)

sportAudi.toDo(action: .startEngine)
sportAudi.toDo(action: .openWindows)
sportAudi.toDo(action: .enableNitro)

truckMan.toDo(action: .openWindows)
truckMan.toDo(action: .unLoadTruck)
truckMan.toDo(action: .loadTruck)
truckMan.toDo(action: .loadTruck)

print("TruckMan: в багажнике \(truckMan.currentBaggageUsedPlace) кг, окна открыты \(truckMan.isWindowsOpen), двигатель выключен \(truckMan.isEngineOn)")
print("SportAudi: двигатель включен \(sportAudi.isEngineOn) кг, окна открыты \(sportAudi.isWindowsOpen), подача нитроксида \(sportAudi.isNitrOxygenOn)")
