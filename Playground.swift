// MARK: - Расширения (Extensions)

// расширение класса методом

extension String {
  func greeting() {
    print("Привет, " + self)
  }
}

var name: String = "Андрей"
name.greeting() // => "Привет, Андрей"

// расширение класса вычисляемыми свойствами

extension Double {
  var celsius: Double {
    return self
  }
  
  var fahrenheit: Double {
    return self * 9.0 / 5.0 + 32.0
  }
  
  var kelvin: Double {
    return self + 273.15
  }
}

let temperature: Double = 18.0
print(temperature.celsius) // => 18 градусов по Цельсию
print(temperature.fahrenheit) // => 18 градусов по Фаренгейту
print(temperature.kelvin) // => 18 градусов по Кельвину


// MARK: - Протоколы (Protocols)

protocol MyProtocol {
  var name: String { get }
  
  func greeting()
}

class MyClass: MyProtocol {
  var name: String = "Елена"
  
  func greeting() {
    print("Привет, " + name)
  }
}

let myClass = MyClass()
myClass.greeting() // => "Привет, Елена"


// MARK: - Extensions + Protocols

// реализация протокола в расширении класса

class Person {
  var firstName: String
  var lastName: String
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

extension Person: MyProtocol {
  var name: String {
    return firstName + " " + lastName
  }
  
  func greeting() {
    print("Привет, " + name)
  }
}

let person = Person(firstName: "Том", lastName: "Круз")
person.greeting() // => "Привет, Том Круз"

// расширение протокола
//
// в классе, который следует протоколу, можно не реализовывать
// определенный метод, если этот метод реализовать в расширении протокола

extension MyProtocol {
  func greeting() {
    print("Привет, Мир!")
  }
}

// таким образом, метод greeting() протокола MyProtocol становится опциональным.
// при вызове метода greeting() из экземпляра класса будет вызываться метод
// по умолчанию, реализованный в расширении протокола.

// используем реализацию по умолчанию:

class WorldPerson: MyProtocol {
  var name: String = "Грут"
}

let worldPerson = WorldPerson()
worldPerson.greeting() // => "Привет, Мир!"

// используем собственную реализацию метода:

class Groot: MyProtocol {
  var name: String = "Грут"
  
  func greeting() {
    print("Я есть " + name)
  }
}

let groot = Groot()
groot.greeting() // => "Я есть Грут"

// если в классе реализован метод протокола, то при вызове будет использоваться именно он.
// если не реализован, то будет использоваться метод по умолчанию.
