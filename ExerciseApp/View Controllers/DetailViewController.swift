//
//  DetailViewController.swift
//  ExerciseApp
//
//  Created by Lisa Sampson on 8/7/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveExerciseButtonTapped(_ sender: Any) {
        guard let exerciseText = exerciseTextField.text,
            let exerciseDetail = exerciseDetailTextView.text else { return }
        
        if let exercise = exercise {
            exerciseController?.updateExercise(newExercise: exercise, exercise: exerciseText, exerciseDetail: exerciseDetail)
        } else {
            exerciseController?.create(exercise: exerciseText, exerciseDetail: exerciseDetail)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard isViewLoaded else { return }
        
        if let exercise = exercise {
            navigationController?.title = exercise.exercise
            exerciseTextField.text = exercise.exercise
            exerciseDetailTextView.text = exercise.exerciseDetail
        } else {
            navigationController?.title = "Add New Exercise Routine"
        }
    }
   
    var exerciseController: ExerciseController?
    
    var exercise: Exercise? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var exerciseTextField: UITextField!
    @IBOutlet weak var exerciseDetailTextView: UITextView!
    
}
