//
//  ObservationsJSONParser.swift
//  Field Survey
//
//  Created by Hayden on 7/15/18.
//  Copyright © 2018 Harrill, Hayden. All rights reserved.
//

import Foundation

class ObservationsJSONParser {//is actually a loader
    
    class func load(FileName: String) -> [Observation] {
        var observations = [Observation]()
        
        if let path = Bundle.main.path(forResource: FileName, ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            observations = ObservationJSONParser.parse(data)
        }
        return observations
    }
}
