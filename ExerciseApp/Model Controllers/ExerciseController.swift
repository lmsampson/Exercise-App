//
//  ExerciseController.swift
//  ExerciseApp
//
//  Created by Lisa Sampson on 8/7/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import Foundation

class ExerciseController {
    
    func create(exercise: String, exerciseDetail: String) {
        let exercise = Exercise(exercise: exercise, exerciseDetail: exerciseDetail)
        exercises.append(exercise)
    }
    
    func updateExercise(newExercise: Exercise, exercise: String, exerciseDetail: String) {
        guard let index = exercises.index(of: newExercise) else { return }
        
        var scratch = newExercise
        scratch.exercise = exercise
        scratch.exerciseDetail = exerciseDetail
        
        exercises.remove(at: index)
        exercises.insert(scratch, at: index)
        
        saveToPersistence()
    }
    
    func updateHasBeenDone(newExercise: Exercise) {
        guard let index = exercises.index(of: newExercise) else { return }
        
        var scratch = newExercise
        scratch.hasBeenDone = !newExercise.hasBeenDone
        
        exercises.remove(at: index)
        exercises.insert(scratch, at: index)
        
        saveToPersistence()
    }
    
    func delete(newExercise: Exercise) {
        guard let index = exercises.index(of: newExercise) else { return }
        
        exercises.remove(at: index)
        
        saveToPersistence()
    }
    
    var exercises: [Exercise] = []
    var finishedExercises: [Exercise] {
        return exercises.filter({$0.hasBeenDone})
    }
    var toDoExercises: [Exercise] {
        return exercises.filter({$0.hasBeenDone == false})
    }
}
