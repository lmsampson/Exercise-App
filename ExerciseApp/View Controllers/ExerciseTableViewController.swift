//
//  ExerciseTableViewController.swift
//  ExerciseApp
//
//  Created by Lisa Sampson on 8/7/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class ExerciseTableViewController: UITableViewController, ExerciseTableViewCellDelegate {
    
    func toggleHasBeenDoneButton(for cell: ExerciseTableViewCell) {
        guard let index = tableView.indexPath(for: cell) else { return }
        let exercise = exerciseFor(indexPath: index)
        
        exerciseController.updateHasBeenDone(newExercise: exercise)
        tableView.reloadData()
    }
    
    func exerciseFor(indexPath: IndexPath) -> Exercise {
        if indexPath.section == 0 {
            return exerciseController.finishedExercises[indexPath.row]
        } else {
            return exerciseController.toDoExercises[indexPath.row]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseController.loadFromPersistence()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return exerciseController.finishedExercises.count
        } else {
            return exerciseController.toDoExercises.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Done for Today"
        } else if section == 1 {
            return "To Do Today"
        }
        return "Error"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as? ExerciseTableViewCell else { return UITableViewCell() }

        let exercise = exerciseFor(indexPath: indexPath)
        cell.delegate = self
        cell.exercise = exercise

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let exercise = exerciseFor(indexPath: indexPath)
            exerciseController.delete(newExercise: exercise)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UpdateExerciseSegue" {
            guard let indexPath = tableView.indexPathForSelectedRow, let detailVC = segue.destination as? DetailViewController else { return }
            let exercise = exerciseFor(indexPath: indexPath)
            detailVC.exerciseController = exerciseController
            detailVC.exercise = exercise
        } else if segue.identifier == "AddExerciseSegue" {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            detailVC.exerciseController = exerciseController
        }
    }

    let exerciseController = ExerciseController()
    
}
