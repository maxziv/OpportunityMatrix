//
//  DetailViewController.swift
//  OpportunityMatrix
//
//  Created by Maxwell Zhou on 7/6/15.
//  Copyright © 2015 ILoveLovinda. All rights reserved.
//

import Foundation


class DetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    init () {
        super.init(nibName: "DetailViewController", bundle: NSBundle(forClass: self.dynamicType.self))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .Stop,
            target: self,
            action: "dismiss"
        )

        navigationItem.title = "Opportunity Matrix"

        let requestURL = NSURL(string:"https://www.linkedin.com/in/maxwellzhou")
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }


    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}