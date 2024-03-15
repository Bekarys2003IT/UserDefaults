//
//  UserDefaultManager.swift
//  database
//
//  Created by Bekarys Sandigali on 13.03.2024.
//

import Foundation
import SnapKit

class UserDefaultManager {
    static let shared = UserDefaultManager()
    
//    func create(_ names: Name ){
//        if var labels = UserDefaults.standard.array(forKey: "Names"){
//            labels.append(textInput.text)
//            UserDefaults.standard.setValue(labels, forKey: "Names")
//        }else {
//            UserDefaults.standard.setValue(labels, forKey: "Names")
//        }
//    }
    func getNames() -> [String]{
        if let labels = UserDefaults.standard.array(forKey: "Labels") as? [String] {
               print(labels)
               return labels
           } else {
               return []
           }
        

    }
}
