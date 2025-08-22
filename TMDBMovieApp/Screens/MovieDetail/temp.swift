////
////  temp.swift
////  TMDBMovieApp
////
////  Created by Sagar Rathode   on 29/07/25.
////
//
//func MapFilterexample()
//{
//    
//    let numbers = [1, 2, 3, 4, 5]
//    let squared = numbers.map { $0 * $0 }
//    
//    for _ in 1...2{
//        print(squared) // [1, 4, 9, 16, 25]
//    }
//    
//    let numbers0 = [1, 2, 3]
//    let stringValues = numbers0.map { "\($0)" }
//    print(stringValues) // ["1", "2", "3"]
//    
//    
//    let numbers1 = [1, 2, 3, 4, 5, 6]
//    let evenNumbers = numbers1.filter { $0 % 2 == 0 }
//    print(evenNumbers) // [2, 4, 6]
//    
//    
//    struct User {
//        let name: String
//        let age: Int
//    }
//    
//    let users = [
//        User(name: "Alice", age: 25),
//        User(name: "Bob", age: 30),
//        User(name: "SAGAR", age:32),
//        User(name: "Charlie", age: 22),
//        User(name: "David", age: 27),
//        User(name: "Emma", age: 24),
//        User(name: "Frank", age: 29),
//        User(name: "Grace", age: 21),
//        User(name: "Henry", age: 26)
//    ]
//    
//    
//    let names = users.map { $0.name }
//    print(names) // ["Alice", "Bob”,”SAGAR”]
//    let namesAndAges = Dictionary(uniqueKeysWithValues: users.map { ($0.name, $0.age) })
//    
//    print(namesAndAges) // ["SAGAR": 30, "Alice": 25, "Bob": 30]
//    
//    let sortedByAge = namesAndAges.sorted { $0.value < $1.value }
//    print(sortedByAge) // [(key: "Alice", value: 25), (key: "SAGAR", value: 30), (key: "Bob", value: 30)]
//    
//    for (name, age) in sortedByAge {
//        print("\(name): \(age)")
//    }
//    // for output
//    //Alice: 25
//    //SAGAR: 30
//    //Bob: 30
//    
//    //Filter by Age
//    let adults = users.filter { $0.age >= 18 }
//    print(adults.map { $0.name }) // ["Alice", "Bob"]
//    
//    //Remove empty strings
//    let namesArray = ["Alice", "", "Bob", "", "Charlie"]
//    let nonEmpty = namesArray.filter { !$0.isEmpty }
//    print(nonEmpty) // ["Alice", "Bob", "Charlie"]
//    
//    //Filter + map :
//    let youngUserNames = users
//        .filter { $0.age < 30 }
//        .map { $0.name.uppercased() }
//    
//    print(youngUserNames) // ["ALICE"]
//    
//    //Convert strings to int
//    let strings = ["123", "abc", "456"]
//    let numbersStrings = strings.compactMap { Int($0) }
//    print(numbersStrings) // [123, 456]
//    
//    //Remove all nil values from an array of optional
//    let values: [Int?] = [1, nil, 3, nil, 5]
//    let nonNilValues = values.compactMap { $0 }
//    print(nonNilValues) // [1, 3, 5]
//    
//    let nested = [[1, 2], [3, 4], [5]]
//    let flat = nested.flatMap { $0 }
//    print(flat) // [1, 2, 3, 4, 5]
//    
//    let name: String? = "sagar"
//    let upperName = name.map { $0.uppercased() }
//    print(upperName!) // Optional("SAGAR")
//    
//    let input: String? = "123"
//    let number = input.flatMap { Int($0) }!
//    print(number) // Optional(123)
//    
//    //let input1:String? = "abc”
//    //let numberstring = input1.flatMap{int($0)}
//    //print(numberstring) // nil
//    
//    let numbersquared = [1,7,9,6,8,2, 3, 4, 5]
//    let squaredNumber = numbersquared.map { $0 * $0 }
//    print(squaredNumber) // [1, 49, 81, 36, 64, 4, 9, 16, 25]
//    
//    let sortedNumber = squared.sorted{$0 < $1}
//    print(sortedNumber) // [1, 4, 9, 16, 25, 36, 49, 64, 81]
//    
//    let map1 = squared.filter{$0 > 10}.sorted{$0 > $1}
//    print(map1) //[81, 64, 49, 36, 25, 16]
//    
//    let even = map1.compactMap { $0 % 2 == 0 ? "\($0)" : nil }
//    print(even) //["64", "36", "16"]
//    
////            let queue = DispatchQueue(label: "com.example.queue",attributes: .concurrent)
////            queue.sync() {
////                print("Task 1 started")
////                        call1to100()
////                print("Task 1 finished")
////
////
////            }
////
////            queue.sync() {
////                print("Task 2 started")
////                        call100to1000()
////                print("Task 2 finished")
////
////            }
//    
//    
//    let dispatch1 = DispatchQueue.global(qos: .utility)
//    dispatch1.async {
//        print("dispatch1")
//        self.call1to100()
//        
//    }
//    dispatch1.async {
//        self.call100to1000()
//    }
//
//    let dispatch2 = DispatchQueue.global(qos: .userInteractive)
//    dispatch2.async {
//        print("dispatch2")
//        self.call1to100()
//        
//    }
//    dispatch2.async {
//        self.call100to1000()
//    }
//    
//}
//
//func call1to100(){
//    for i in 0..<100 {
//        print(i)
//        sleep(2)
//        
//        let integerToDescribe = 5
//        var description = "The number \(integerToDescribe) is"
//        switch integerToDescribe {
//        case 2, 3, 5, 7, 11, 13, 17, 19:
//            description += " a prime number, and also"
//            fallthrough
//        default:
//            description += " an integer."
//        }
//        print(description)
//    }
//    
//}
//func call100to1000(){
//    print("\n")
//    for i in 500..<1000 {
//        print(i)
//    }
//}
