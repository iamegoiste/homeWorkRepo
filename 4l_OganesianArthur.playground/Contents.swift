import UIKit


enum CarAction {
    case stopEngine, startEngine, openWindows, closeWindows, doorUnlock, doorLock
}

enum TruckActions {
    case loadFreight, unloadFreight
}

enum SportCarActions{
    case superSpeedOn, superSpeedOff
}

class Car {
    
    let brand: String
    let carAction: CarAction
    
    init(brand: String, carAction: CarAction) {
        self.brand = brand
        self.carAction = carAction
    }
    
    func toDo(action: CarAction) {
        print(action)
    }
    
}
class TruckCar: Car {
    let wheels = 6
    let truckAction: TruckActions
    
    init(brand: String, carAction: CarAction, truckAction: TruckActions) {
        self.truckAction = truckAction
        super.init(brand: brand, carAction: carAction)
    }
    
    func toDoTruck(action: TruckActions) {
        print(action)
    }
    
}

class SportCar: Car{
    let lamboDoors = true
    let sportCarAction: SportCarActions
    
    init(brand: String, carAction: CarAction, sportCarAction: SportCarActions) {
        self.sportCarAction = sportCarAction
        super.init(brand: brand, carAction: carAction)
    }
        func toDoSportCar(action: SportCarActions){
            print(action)
        }
    }


let truckCar = TruckCar(brand: "BMW", carAction: .closeWindows, truckAction: .loadFreight)
truckCar.toDoTruck(action: .unloadFreight)
truckCar.toDo(action: .startEngine)
print(truckCar.brand, truckCar.truckAction, truckCar.wheels, truckCar.carAction)

let sportCar = SportCar(brand: "Audi", carAction: .doorUnlock, sportCarAction: .superSpeedOn)
sportCar.toDo(action: .openWindows)
sportCar.toDoSportCar(action: .superSpeedOff)
print(sportCar.lamboDoors, sportCar.brand, sportCar.carAction, sportCar.sportCarAction)



