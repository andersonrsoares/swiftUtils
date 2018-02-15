//
//  OfflineSettings.swift
//  ASswiftUtils
//
//  Created by Anderson Soares on 15/02/2018.
//

import Foundation
//teste usando protocol swift 4 Codable
class OfflineSettings<T:Codable> {
   
    let name:String
    init(name:String) {
        self.name = name
    }
    
    public func clear(name : String) {
        UserDefaults.standard.removeObject(forKey: "userData")
    }
    
   public func save<T:Codable>(model : T) {
        
        let encoder = JSONEncoder()
        
        // Optional properties offered by JSONEncoder for customizing output
        encoder.outputFormatting = [.prettyPrinted] // another option: .sortedKeys
        //encoder.dataEncodingStrategy
//        encoder.dateEncodingStrategy
//        encoder.nonConformingFloatEncodingStrategy
//
        // Every encoder and decoder has a userInfo property to pass custom configuration down the chain. The supported keys depend on the specific encode/decoder.
       // encoder.userInfo
        
        guard let jsonData = try? encoder.encode(model) else {return}
        let data = String(data: jsonData, encoding: .utf8)
        

        
        UserDefaults.standard.setValue(data, forKey: name)
    }
    
   public func get<T:Codable>() -> T? {
        guard let jsonString = UserDefaults.standard
            .value(forKey: name) as? String else {return nil}
    
        if let jsonData = jsonString.data(using: .utf8)
        {
            guard let object = try? JSONDecoder().decode(T.self, from: jsonData) else {return nil}
            return object
        }
        return nil
    }
}
