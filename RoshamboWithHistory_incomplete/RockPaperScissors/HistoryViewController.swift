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
    let PLAYED_TAG = 1
    let RESULT_TAG = 2
    let VS_TAG = 3
    let CONTAINER_TAG = 4
    let winningBgColor = UIColor(red: CGFloat(0), green: CGFloat(0.9), blue: CGFloat(0.2), alpha: CGFloat(0.1))
    let losingBGColor = UIColor(red: CGFloat(0.8), green: CGFloat(0.1), blue: CGFloat(0.1), alpha: CGFloat(0.1))

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!

    override func viewDidLoad() {
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    }

    override func viewWillAppear(animated: Bool) {
        // Show last results first
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
        let playedLabel = historyCell.viewWithTag(PLAYED_TAG) as! UILabel
        let resultLabel = historyCell.viewWithTag(RESULT_TAG) as! UILabel
        let versusLabel = historyCell.viewWithTag(VS_TAG) as! UILabel
        let match = self.history[indexPath.row]

        playedLabel.text = "\(match.p1)"
        if match.p1 == match.p2 {
            resultLabel.text = "Tie"
            versusLabel.text = ""
        } else {
            versusLabel.text = "vs. \(match.p2)"
            if match.p1 == match.winner {
                resultLabel.text = "Won"
                historyCell.contentView.backgroundColor = self.winningBgColor
            } else {
                resultLabel.text = "Lost"
                historyCell.contentView.backgroundColor = self.losingBGColor
            }
        }

        return historyCell
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        // Adjust the cell width so that it matches the table's width:
        cell.separatorInset = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
    }

    @IBAction func dismiss(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}