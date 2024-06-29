//
//  SaveData.swift
//  WikiGame
//
//  Created by Andrea Moreno on 28-06-24.
//

import Foundation
class SaveData{
    
    var emails: String = ""
    var password: String = ""
    var name: String = ""

    func saveData(emails: String, password: String, name:String)-> Bool{
        
        print("\(emails) + \(password) + \(name)")
        
        UserDefaults.standard.set([emails,password,name], forKey: "Date User")
        
        return true
    }
    func recoverData() -> [String]{
        
        let dataUser: [String] = UserDefaults.standard.stringArray(forKey: "Date User")
        print("I'm recovering of method and I recoverd \(dataUser)")
        return dataUser
    }
    func validate(emails: String, password: String)-> Bool{
        var emailSaved = ""
        var passwordSaved = ""
        
        print("Review if you have data of user default \(emails) and \(name)")
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil{
            
            emailSaved = UserDefaults.standard.stringArray(forKey: "dataUser")![0]
            passwordSaved = UserDefaults.standard.stringArray(forKey: "dataUser")![1]
            print("email saved is \(emailSaved), password saved is \(passwordSaved))

                  if (emails == emailSaved && password == passwordSaved){
                return true
            }
                  
        }else{
            print("Don't exist user")
            return false
        }
    }
    
}
