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

    var taskCategory = "ToDo"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            self.dismiss(animated: true, completion: nil)
            return
        }

        // context(データベースを扱うのに必要)を定義。
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        // taskにTask(データベースのエンティティです)型オブジェクトを代入します。
        // このとき、Taskがサジェストされない（エラーになる）場合があります。
        // 詳しい原因はわかりませんが、Runするか、すべてのファイルを保存してXcodeを再起動すると直るので色々試してみてください。
        let task = Task(context: context)

        // 先ほど定義したTask型データのname、categoryプロパティに入力、選択したデータを代入します。
        task.name = taskName
        task.category = taskCategory

        // 上で作成したデータをデータベースに保存します。
        (UIApplication.shared.delegate as! AppDelegate).saveContext()

        self.dismiss(animated: true, completion: nil)
    }
}
