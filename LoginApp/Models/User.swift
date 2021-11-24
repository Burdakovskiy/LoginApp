//
//  User.swift
//  LoginApp
//
//  Created by Дмитрий on 24.11.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserDescription() -> User {
         User(
            login: "user",
            password: "password",
            person: Person(name: "Dima", surname: "Ishenko"))
    }
}

struct Person {
    let name: String
    let surname: String
    
    var getFullName: String {
        "\(name) \(surname)"
    }
}
