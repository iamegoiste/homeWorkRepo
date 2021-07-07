import Foundation

enum Manufacture: String {
    case audi, bentley, mercedesBenz
}
enum CarType: String{
    case sedan, suv, truck
}

enum EngineState {
    case started, stoped
}

enum WindowsState {
    case opened, closed
}

enum CarAction {
    case stopEngine, startEngine, openWindows, closeWindows
    case loadFreight (volume: Int)
    case unloadFreight (volume: Int)
}


var baggage: Double

struct Car {
    let manufacture: Manufacture
    let carType: CarType
    let productionYear: Int
    let luggageCapacity: Int
    var engineState: EngineState
    var windowsState: WindowsState
    var luggageFullness: Int
    
    mutating func toDo(action: CarAction) {
        switch action {
 
        case .startEngine:
            if engineState == .stoped{
                engineState = .started
                print("Запускаю двигатель")
            } else {
                print("Двигатель уже запущен")
            }
        case .stopEngine:
            if engineState == .started{
                engineState = .stoped
                print("Выключаю двигатель")
            } else {
                print("Двигатель уже отключен")
            }
        case .openWindows:
            if windowsState == .opened{
                print("Окна уже открыты")
            } else {
                windowsState = .opened
                print ("Открываю окна")
            }
        case .closeWindows:
            if windowsState == .closed {
                print("Окна уже закрыты")
            } else {
                print("Закрываю окна")
            }
        case .loadFreight(let volume):
            if luggageFullness >= luggageCapacity{
                print("Свободного места нет")
            } else {
                luggageFullness += volume
                let freeSpace = luggageCapacity - luggageFullness
                print("Загрузили \(volume) Осталось свободного места \(freeSpace)")
            }
        case .unloadFreight(let volume):
            if luggageFullness == 0{
                print("Нечего выгружать")
            } else {
            luggageFullness -= volume
                print("Выгрузили \(volume) Осталось груза \(luggageFullness)")
            }
        }
    }
}

var audiQ3 = Car(manufacture: .audi, carType: .sedan, productionYear: 2020, luggageCapacity: 500, engineState: .stoped, windowsState: .closed, luggageFullness: 0)

audiQ3.luggageFullness
audiQ3.toDo(action: .loadFreight(volume: 100))
audiQ3.toDo(action: .loadFreight(volume: 400))
audiQ3.toDo(action: .loadFreight(volume: 400))
audiQ3.toDo(action: .unloadFreight(volume: 300))
audiQ3.toDo(action: .unloadFreight(volume: 200))
audiQ3.toDo(action: .unloadFreight(volume: 100))
audiQ3.toDo(action: .closeWindows)
print(audiQ3.windowsState)
audiQ3.toDo(action: .startEngine)
print(audiQ3.engineState)
audiQ3.toDo(action: .startEngine)
print(audiQ3.manufacture, audiQ3.carType, audiQ3.productionYear, audiQ3.luggageCapacity, audiQ3.engineState, audiQ3.windowsState, audiQ3.luggageFullness)

var truckMan = Car(manufacture: .mercedesBenz, carType: .truck, productionYear: 2010, luggageCapacity: 5000, engineState: .stoped, windowsState: .closed, luggageFullness: 0)
truckMan.toDo(action: .loadFreight(volume: 3000))
truckMan.toDo(action: .openWindows)
truckMan.toDo(action: .unloadFreight(volume: 1000))
print(truckMan.manufacture, truckMan.carType, truckMan.productionYear, truckMan.luggageCapacity, truckMan.engineState, truckMan.windowsState, truckMan.luggageFullness)
