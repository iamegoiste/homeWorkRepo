import UIKit
// 1. Написать функцию, которая определяет, четное число или нет.

func checkEven(number: Int){
    if number % 2 == 0{
        print("Even number")
    } else {
        print("Odd number")
    }
}

print(checkEven(number: 99))

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func checkDivision(number: Int){
    if number % 3 == 0{
        print("Verification passed")
    } else {
        print("Verification failed")
    }
}

print(checkDivision(number: 102))

// 3. Создать возрастающий массив из 100 чисел.

var array: [Int] = []
    for _ in 1...100{
        let i = Int.random(in: -2147483647...2147483647)
        array.append(i)
}
print(array)

array.sort(by: {$0 < $1})

print(array)

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var count = 0
for (_, value) in array.enumerated(){
    if (value % 2) == 0{
        array.remove(at: array.firstIndex(of: value)!)
    } else if (value % 3) == 0{
        array.remove(at: array.firstIndex(of: value)!)
    }
}
print(array)


