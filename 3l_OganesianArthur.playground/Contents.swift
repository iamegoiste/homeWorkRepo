import UIKit
import Foundation

enum Manufacture: String {
    case audi, bentley, mercedesBenz
}
enum CarType: String{
    case sedan, suv, truck
}

enum EngineState {
    case start, stop
}

enum WindowsState {
    case open, close
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
    func drive(){
        if self.engineState == EngineState.stop {
            print("Двигатель не запущен, вы не можете ехать")
        } else if self.engineState == EngineState.start{
            print("Двигатель запущен, вы можете начать движение")
        }
    }
    mutating func closeWindows(){
        self.windowsState = .close
        print("Окна закрыты")
    }
    mutating func openWindows(){
           self.windowsState = .open
           print("Окна открыты")
       }
    mutating func engineStart(){
        self.engineState = .start
    }
    mutating func engineStop(){
        self.engineState = .stop
    }
    mutating func luggageFullness(luggageCapacity: Int, baggage: Int){
        if baggage == 0{
            luggageFullness = luggageCapacity
        } else if baggage >= 0{
            luggageFullness = luggageCapacity - baggage
        }
    }
    
    mutating func getBaggage(luggageCapacity: Int, baggage: Int ){
        if luggageCapacity < baggage{
            print("Места недостаточно, вы не можете загрузить багаж.")
            self.engineState = .stop
            print("Двигатель принудительно выключен")
        } else if luggageCapacity >= baggage{
            print("Места достаточно, вы можете загрузить багаж")
        }
    }
}
var audiQ3 = Car(manufacture: .audi, carType: .suv, productionYear: 2011, luggageCapacity: 500, engineState: .start, windowsState: .open, luggageFullness: 500)
audiQ3.getBaggage(luggageCapacity: 500, baggage: 300)
audiQ3.luggageFullness(luggageCapacity: 500, baggage: 300)
audiQ3.drive()
print(audiQ3)

var audiA5 = Car(manufacture: .audi, carType: .sedan, productionYear: 2020, luggageCapacity: 300, engineState: .stop, windowsState: .close, luggageFullness: 300)
print(audiA5)
audiA5.closeWindows()
audiA5.getBaggage(luggageCapacity: 300, baggage: 100)
audiA5.luggageFullness(luggageCapacity: 300, baggage: 100)
audiA5.engineStop()
audiA5.drive()
print(audiA5)

var truckMercedesBenz = Car(manufacture: .mercedesBenz, carType: .truck, productionYear: 2001, luggageCapacity: 5000, engineState: .start, windowsState: .open, luggageFullness: 5000)
print(truckMercedesBenz)
truckMercedesBenz.openWindows()
truckMercedesBenz.engineStart()
truckMercedesBenz.getBaggage(luggageCapacity: 5000, baggage: 6000)
truckMercedesBenz.luggageFullness(luggageCapacity: 5000, baggage: 2000)
print(truckMercedesBenz)
