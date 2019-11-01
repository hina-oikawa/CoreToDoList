//
//  AddTaskViewController.swift
//  CoreToDoList
//
//  Created by 及川ひな on 2019/10/29.
//  Copyright © 2019 oikawa. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var task: Task?

    var taskCategory = "ToDo"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(hex: "17202A")

        // taskに値が代入されていたら、textFieldとsegmentedControlにそれを表示
        if let task = task {
            taskTextField.text = task.name
            taskCategory = task.category!
            switch task.category! {
            case "ToDo":
                categorySegmentedControl.selectedSegmentIndex = 0
            case "Shopping":
                categorySegmentedControl.selectedSegmentIndex = 1
            case "Assignment":
                categorySegmentedControl.selectedSegmentIndex = 2
            default:
                categorySegmentedControl.selectedSegmentIndex = 0
            }
        }
    }

    // MARK: - Button Actions
    @IBAction func categoryChosen(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            taskCategory = "ToDo"
        case 1:
            taskCategory = "Shopping"
        case 2:
            taskCategory = "Assignment"
        default:
            taskCategory = "ToDo"
        }
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func plusButtonTapped(_ sender: Any) {
        // TextFieldに何も入力されていない場合は何もせずに1つ目のビューへ戻ります。
        let taskName = taskTextField.text
        if taskName == "" {
            dismiss(animated: true, completion: nil)
            return
        }

        // 受け取った値が空であれば、新しいTask型オブジェクトを作成する
        if task == nil {
            task = Task(context: context)
        }

        // 受け取ったオブジェクト、または、先ほど新しく作成したオブジェクトそのタスクのnameとcategoryに入力データを代入する
        if let task = task {
            task.name = taskName
            task.category = taskCategory
        }

        // 変更内容を保存する
        (UIApplication.shared.delegate as! AppDelegate).saveContext()

        dismiss(animated: true, completion: nil)
    }
}
