//
//  ViewController.swift
//  OpportunityMatrix
//
//  Created by Maxwell Zhou on 7/5/15.
//  Copyright © 2015 ILoveLovinda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bigBetHeight: NSLayoutConstraint!
    @IBOutlet weak var homeRunHeight: NSLayoutConstraint!
    @IBOutlet weak var smallWinsHeight: NSLayoutConstraint!
    @IBOutlet weak var junkHeight: NSLayoutConstraint!

    let def = NSUserDefaults.standardUserDefaults()
    var key = "tasks"

    var tasks: [String] = []
    let q1 = [2, 3, 6, 7, 10, 11]
    let q2 = [0, 1, 4, 5, 8, 9]
    let q3 = [12, 13, 16, 17, 20, 21]
    let q4 = [14, 15, 18, 19, 22, 23]
    var currentAlertCellIndex: NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()


        let nib = UINib(nibName: "TaskCell", bundle: NSBundle(forClass: self.dynamicType.self))
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "TaskCell")

        if let tasks = def.objectForKey(key) as? NSArray {
            self.tasks = tasks as! [String]
        } else {
            for _ in 0...23 {
                tasks.append("")
            }
        }

        bigBetHeight.constant = ScreenSize.SCREEN_HEIGHT/2.0
        homeRunHeight.constant = ScreenSize.SCREEN_HEIGHT/2.0
        smallWinsHeight.constant = ScreenSize.SCREEN_HEIGHT/2.0
        junkHeight.constant = ScreenSize.SCREEN_HEIGHT/2.0
    }

    @IBAction func didSelectDoge(sender: AnyObject) {

        let rootViewController = DetailViewController()
        let navController: UINavigationController = UINavigationController(rootViewController: rootViewController)
        self.presentViewController(navController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        def.setObject(tasks, forKey: key)
    }


}

struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TaskCell", forIndexPath: indexPath) as? TaskCell {

            let backgroundColor: UIColor
            if q1.contains(indexPath.item) {
                backgroundColor = Color.Red2
            } else if q2.contains(indexPath.item) {
                backgroundColor = Color.Orange2
            } else if q3.contains(indexPath.item) {
                backgroundColor = Color.Purple2
            } else {
                backgroundColor = Color.Blue2
            }
            cell.inflate(tasks[indexPath.item], backgroundColor: backgroundColor)

            return cell
        }
        assertionFailure()
        return UICollectionViewCell()
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension ViewController: LXReorderableCollectionViewDataSource {
    func collectionView(collectionView: UICollectionView!, itemAtIndexPath fromIndexPath: NSIndexPath!, willMoveToIndexPath toIndexPath: NSIndexPath!) {
        let temp: String = tasks[toIndexPath.item]
        tasks[toIndexPath.item] = tasks[fromIndexPath.item]
        tasks[fromIndexPath.item] = temp
    }

    func collectionView(collectionView: UICollectionView!, itemAtIndexPath fromIndexPath: NSIndexPath!, didMoveToIndexPath toIndexPath: NSIndexPath!) {
        collectionView.reloadData()
    }

}

extension ViewController: UICollectionViewDelegate {

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? TaskCell {

            let alertView = UIAlertView(title: "Task", message: "", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Done")
            currentAlertCellIndex = indexPath
            alertView.alertViewStyle = .PlainTextInput
            alertView.textFieldAtIndex(0)?.placeholder = cell.getTask()
            alertView.show()
            //cell.didSelectCell()
        }
    }
}

extension ViewController: UIAlertViewDelegate {
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if (buttonIndex == 1) {
            if  let currentAlertCellIndex = currentAlertCellIndex,
                let cell = collectionView.cellForItemAtIndexPath(currentAlertCellIndex) as? TaskCell,
                let inputText = alertView.textFieldAtIndex(0)?.text{
                    tasks[currentAlertCellIndex.item] = inputText
                    cell.inflate(inputText, backgroundColor: nil)
            }
        }
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width: CGFloat
        let height: CGFloat
        if DeviceType.IS_IPHONE_4_OR_LESS {
            width = ScreenSize.SCREEN_WIDTH/4.0 + 1.8
            height = (ScreenSize.SCREEN_HEIGHT - 20)/6.0 + 0.8
        } else if DeviceType.IS_IPHONE_5 {
            width = ScreenSize.SCREEN_WIDTH/4.0 + 1.8
            height = (ScreenSize.SCREEN_HEIGHT - 20)/6.0
        } else if DeviceType.IS_IPHONE_6 {
            width = ScreenSize.SCREEN_WIDTH/4.0 + 2.0
            height = (ScreenSize.SCREEN_HEIGHT - 20)/6.0
        } else if DeviceType.IS_IPHONE_6P {
            width = ScreenSize.SCREEN_WIDTH/4.0
            height = (ScreenSize.SCREEN_HEIGHT - 20)/6.0
        } else {
            width = ScreenSize.SCREEN_WIDTH/4.0
            height = (ScreenSize.SCREEN_HEIGHT - 20)/6.0
        }
        return CGSize(width:width, height: height)
    }

}