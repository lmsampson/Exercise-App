//
//  ExerciseTableViewCell.swift
//  ExerciseApp
//
//  Created by Lisa Sampson on 8/7/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

protocol ExerciseTableViewCellDelegate: class {
    func toggleHasBeenDoneButton(for cell: ExerciseTableViewCell)
}

class ExerciseTableViewCell: UITableViewCell {

    @IBAction func isCompleteButtonTapped(_ sender: Any) {
        delegate?.toggleHasBeenDoneButton(for: self)
    }
    
    func updateViews() {
        guard let exercise = exercise else { return }
        exerciseLabel.text = exercise.exercise
        let image = exercise.hasBeenDone ? UIImage(named: "checked") : UIImage(named: "unchecked")
        isCompleteButton.setImage(image, for: .normal)
    }
    
    var exercise: Exercise? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: ExerciseTableViewCellDelegate?
    
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    
}
