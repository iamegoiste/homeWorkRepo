import Foundation
// 1. Пример квадратного уравнения - ax^2+bx+c=0. d - дискриминант
var a: Double = 5
var b: Double = 10
var c: Double = 2
var x1: Double = 0
var x2: Double = 0
var d: Double = pow(b, 2) - 4 * a * c

if (d < 0) {
    print("Корней нет")
} else if (d == 0){
    x1 = (-b+sqrt(d))/(2*a)
} else if (d > 0) {
    x1 = (-b+sqrt(d))/(2*a)
    x1 = (-b-sqrt(d))/(2*a)
}

// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
// Катеты katOne и katTwo; Площадь - s; Периметр - p; Гипотенуза - gipo;

var katOne: Double = 5
var katTwo: Double = 10
var gipo: Double = sqrt(katOne * katOne + katTwo * katTwo)
var s = katOne * katTwo * 0.5
var p = katOne + katTwo + gipo

// 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var vklad: Int = 100
var percent: Int = 30
var resultFirstYear = vklad + percent
var resultSecondYear = vklad + percent + resultFirstYear * percent/100
var resultThirdYear = resultSecondYear + resultSecondYear * percent/100
var resultFourthYear = resultThirdYear + resultThirdYear * percent/100
var resultFifthYear = resultFourthYear + resultFourthYear * percent/100
print(resultFifthYear)



