//
//  PersistenceExtention.swift
//  ExerciseApp
//
//  Created by Lisa Sampson on 8/7/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import Foundation

extension ExerciseController {
    
    var exerciseURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = "ExerciseApp.plist"
        return documentsDirectory.appendingPathComponent(fileName)
    }
    
    func saveToPersistence() {
        let plistEncoder = PropertyListEncoder()
        do {
            guard let exercise = exerciseURL else { return }
            let exerciseArray = try plistEncoder.encode(exercises)
            try exerciseArray.write(to: exercise)
        } catch let error {
            print("Error trying to save data! \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistence() {
        do {
            guard let exercise = exerciseURL else { return }
            let exerciseArray = try Data(contentsOf: exercise)
            let plistDecoder = PropertyListDecoder()
            let decodedExercises = try plistDecoder.decode([Exercise].self, from: exerciseArray)
            self.exercises = decodedExercises
            
        } catch let error {
            print("Error trying to save data! \(error.localizedDescription)")
        }
    }
}
