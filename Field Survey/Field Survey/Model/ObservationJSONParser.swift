//
//  ObservationJSONParser.swift
//  Field Survey
//
//  Created by Hayden on 7/15/18.
//  Copyright © 2018 Harrill, Hayden. All rights reserved.
//

import Foundation

class ObservationJSONParser {
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [Observation] {
        var observations = [Observation]()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
           let root = json as? [String: Any],
           let status = root["status"] as? String,
           status == "ok" {
            
            if let survey = root["observations"] as? [Any] {
                for observation in survey {
                    if let observation = observation as? [String: String] {
                        if let classification = observation["classification"],
                           let title = observation["title"],
                           let description = observation["description"],
                           let dateString = observation["date"],
                           let date = dateFormatter.date(from: dateString) {
                            
                            if let observation = Observation(classificationName: classification, title: title, description: description, date: date) {
                                observations.append(observation)
                            }
                            
                            
                        }
                    }
                }
            }
        }
        
        return observations
    }
    
    
}
