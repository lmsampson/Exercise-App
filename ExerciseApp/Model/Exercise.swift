//
//  Exercise.swift
//  ExerciseApp
//
//  Created by Lisa Sampson on 8/7/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import Foundation

struct Exercise: Equatable, Codable {
    var exercise: String
    var exerciseDetail: String
    var hasBeenDone: Bool
    
    init(exercise: String, exerciseDetail: String, hasBeenDone: Bool = false) {
        self.exercise = exercise
        self.exerciseDetail = exerciseDetail
        self.hasBeenDone = hasBeenDone
    }
}
