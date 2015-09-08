//
//  TaskCell.swift
//  OpportunityMatrix
//
//  Created by Maxwell Zhou on 7/5/15.
//  Copyright © 2015 ILoveLovinda. All rights reserved.
//

import Foundation

class TaskCell : UICollectionViewCell {
    @IBOutlet weak var taskTextField: UILabel!
    var task: String = ""
    var myBorderView: UIView?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        taskTextField.text = nil
    }

    func inflate(task: String?, backgroundColor: UIColor?) {
        if let task = task {
            self.task = task
            taskTextField.text = task
        }

        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
    }

    func getTask() -> String {
        return task
    }

    func didSelectCell() {
        taskTextField.becomeFirstResponder()
    }

    func highlightBorder() {
        let myContentRect = CGRectInset(self.contentView.bounds, 3, 3)

        myBorderView = UIView(frame: myContentRect)
        myBorderView?.layer.borderColor = Color.Red6.CGColor
        myBorderView?.layer.borderWidth = 3
        self.contentView.addSubview(myBorderView!)
    }

}