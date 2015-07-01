//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Brian on 01/07/15.
//  Copyright (c) 2015 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var history: [RPSMatch]!

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!

    override func viewDidLoad() {
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    }

    override func viewWillAppear(animated: Bool) {
        self.history = self.history.reverse()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let matchHistory = history {
            return matchHistory.count
        }
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let historyCell = self.tableView.dequeueReusableCellWithIdentifier("historyCell") as! UITableViewCell
        let match = self.history[indexPath.row]
        var result: String
        if match.p1 == match.p2 {
            result = "Tie"
        } else if match.p1 == match.winner {
            result = "Won vs. \(match.p2)"
        } else {
            result = "Lost vs. \(match.p2)"
        }
        historyCell.textLabel?.text = "\(match.p1)"
        historyCell.detailTextLabel?.text = result
        return historyCell

    }

    @IBAction func dismiss(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}