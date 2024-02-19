class Animal {
    var name: String
    init(name: String) {
        self.name = name
    }
    func sound() {
        print("...")
    }
}

class Dog: Animal {
    override func sound() {
        print("Woof!")
    }
}

class Cat: Animal {
    override func sound() {
        print("Meow!")
    }
}

let cat = Cat(name: "Snowball")
cat.sound()

let dog=Dog(name: "Scooby")
dog.sound()

/////////////////////////////////

class House {
    var width: Double
    var height: Double
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    func create() {
        let area = width * height
        print("The area of the house: \(area)")
    }
    func destroy() {
        print("The house has been destroyed!")
    }
}

let home=House(width: 1024.0, height: 768.0)
home.create()
home.destroy()

///////////////////

struct Student {
    var name: String
    var age: Int
    var score: Double
}

class Sorter {
    func sortByName(students: [Student]) -> [Student] {
        return students.sorted(by: { $0.name < $1.name })
    }
    func sortByAge(students: [Student]) -> [Student] {
        return students.sorted(by: { $0.age < $1.age })
    }
    func sortByScore(students: [Student]) -> [Student] {
        return students.sorted(by: { $0.score > $1.score })
    }
}


var students = [Student]()

let student1 = Student(name: "Phillip", age: 19, score: 4.75)
let student2 = Student(name: "Andrew", age: 23, score: 3.57)
let student3 = Student(name: "Elizabeth", age: 24, score: 4.5)

students.append(student1)
students.append(student2)
students.append(student3)



print("Before Sorting")
for student in students {
    print(student)
}

let sorter = Sorter()

students = sorter.sortByName(students: students)
print("SortedByName")
for student in students {
    print(student)
}

students = sorter.sortByAge(students: students)
print("SortedByAge")
for student in students {
    print(student)
}

students = sorter.sortByScore(students: students)
print("SortedByScore from high to low")
for student in students {
    print(student)
}

//////////////////////////////

struct Person {
    var name: String
    var age: Int

    func sayHello(){
        print("Hello stranger! My name is \(name)")
    }

}

class PersonClass {
    var name: String
    var age: Int

    init(name: String, age: Int){
        self.name=name
        self.age=age
    }

    init(){
        name="Ivan"
        age=20
    }

    func sayHello(){
        print("Hello stranger! My name is \(name)")
    }
}

let person1=Person(name: "Joe", age: 29)
person1.sayHello()

let person2=PersonClass()
person2.sayHello()

let person3=PersonClass(name: "Cirilla", age: 12)
person3.sayHello()

// Структуры и классы имеют ряд отличий:
// 1. Наследование позволяет одному классу наследовать характеристики другого, структуры не имеют механизма наследования.
// 2. Классы обладают деинициализаторами, структуры - нет
// 3. Классы являются ссылочными типами, а структуры являются value типами.