import UIKit

protocol AnimalProtocol {
    var name: String {get set}
}

struct Queue<Animal: AnimalProtocol> {
    var animals = [Animal]()
    
   mutating func addAnimal(animal: Animal){
        animals.append(animal)
    }
    
    mutating func deleteAnimal() {
        animals.removeLast()
    }
    func filterStack(animals: [Animal]) -> [Animal]{
        return animals.filter{
            $0.name.count > 3
        }
    }
    subscript(index index: Int) -> String? {
        get {
            if index < animals.count {
                return animals[index].name
            } else {
                return nil
            }
        }
    }
    
}

struct Cat: AnimalProtocol {
    var name: String
}


var stackCats = Queue<Cat>()

stackCats.addAnimal(animal: Cat(name: "Барсик"))
stackCats.addAnimal(animal: Cat(name: "Том"))
stackCats.addAnimal(animal: Cat(name: "Жак"))
stackCats.addAnimal(animal: Cat(name: "Вася"))
stackCats.addAnimal(animal: Cat(name: "Жерар"))

var newStack = stackCats.filterStack(animals: stackCats.animals)
newStack.forEach {
    print($0.name)
}

print(stackCats[index: 1])
print(stackCats[index: 15])
