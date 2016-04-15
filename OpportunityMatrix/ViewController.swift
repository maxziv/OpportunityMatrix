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

    let quotes = ["“I’ve missed more than 9,000 shots in my career. I’ve lost almost 300 games. 26 times I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life and that is why I succeed.”  –Michael Jordan, NBA Legendary Basketball MVP", "“Chase the vision, not the money; the money will end up following you.”  –Tony Hsieh, Zappos CEO", "“The critical ingredient is getting off your butt and doing something. It’s as simple as that. A lot of people have ideas, but there are few who decide to do something about them now. Not tomorrow. Not next week. But today. The true entrepreneur is a doer, not a dreamer.”  –Nolan Bushnell, Entrepreneur", "“Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do.”  –Steve Jobs, Co-Founder, Chairman and CEO, Apple", "“Don’t worry about failure; you only have to be right once.”  –Drew Houston, Dropbox Co-Founder and CEO", "“Ideas are easy. Implementation is hard.”  –Guy Kawasaki, Alltop Co-Founder and Entrepreneur", "“The secret to successful hiring is this: look for the people who want to change the world.”  –Marc Benioff, Salesforce CEO", "“I skate to where the puck is going to be, not where it has been.”  –Wayne Gretzy, Hockey Star", "“If you’re going through hell, keep going.”  –Winston Churchill, British Prime Minister", "“Ideas are commodity. Execution of them is not.”  –Michael Dell, Dell Chairman and CEO", "“I knew that if I failed I wouldn’t regret that, but I knew the one thing I might regret is not trying.”  –Jeff Bezos, Amazon Founder and CEO", "“If you are not embarrassed by the first version of your product, you’ve launched too late.”  –Reid Hoffman, LinkedIn Co-Founder and Venture Capitalist", "“The way to get started is to quit talking and start doing.”  –Walt Disney, Co-Founder, Disney", "“User experience is everything. It always has been, but it’s undervalued and underinvested in. If you don’t know user-centered design, study it. Hire people who know it. Obsess over it. Live and breathe it. Get your whole company on board.”  –Evan Williams, Co-Founder, Twitter", "“Life is not always a matter of holding good cards, but sometimes playing a poor hand well.”  –Jack London, Author", "“Remember to celebrate milestones as you prepare for the road ahead.”  –Nelson Mandela, South African Leader", "“A pessimist sees the difficulty in every opportunity; an optimist sees the opportunity in every difficulty.”  –Winston Churchill, British Prime Minister", "“Whether you think you can, or think you can’t — you’re right.”  –Henry Ford, Ford Motor Company Founder", "“Always deliver more than expected.”  –Larry Page, Co-Founder, Google", "“Don’t be afraid to assert yourself, have confidence in your abilities, and don’t let the bastards get you down.”  –Michael Bloomberg, Former Mayor of New York and Founder of Bloomberg L.P.", "“If you’re not a risk taker, you should get the hell out of business.”  –Ray Kroc, McDonald’s Founder", "“The secret of getting ahead is getting started. The secret of getting started is breaking your complex overwhelming tasks into smaller manageable tasks, and then starting on the first one.”  –Mark Twain, American Humorist and Author", "“Your most unhappy customers are your greatest source of learning.”  –Bill Gates, Microsoft Founder and former CEO", "“If you just work on stuff that you like and you’re passionate about, you don’t have to have a master plan with how things will play out.”  –Mark Zuckerberg, Facebook Founder and CEO", "“In between goals is a thing called life, that has to be lived and enjoyed.”  –Sid Caesar, Entertainer", "“I’m convinced that about half of what separates the successful entrepreneurs from the non-successful ones is pure perseverance.”  –Steve Jobs, Co-Founder and CEO, Apple", "“Never, never, never give up.”  –Winston Churchill, British Prime Minister"]

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
        def.synchronize();
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
                backgroundColor = Color.Red
            } else if q2.contains(indexPath.item) {
                backgroundColor = Color.Orange
            } else if q3.contains(indexPath.item) {
                backgroundColor = Color.Purple
            } else {
                backgroundColor = Color.Blue
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
            let randomIndex = Int(arc4random_uniform(UInt32(quotes.count)))
            let alertView = UIAlertView(title: "Task", message: quotes[randomIndex], delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Done")
            currentAlertCellIndex = indexPath
            alertView.alertViewStyle = .PlainTextInput
            alertView.textFieldAtIndex(0)?.placeholder = cell.getTask()
            alertView.textFieldAtIndex(0)?.autocorrectionType = .Yes
            alertView.textFieldAtIndex(0)?.autocapitalizationType = .Sentences
            alertView.textFieldAtIndex(0)?.returnKeyType = .Go


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