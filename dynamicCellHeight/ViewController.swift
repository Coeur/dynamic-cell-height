//
//  ViewController.swift
//  dynamicCellHeight
//
//  Created by Antoine Cœur on 05/04/2017.
//  Copyright © 2017 coeur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.estimatedRowHeight = 44
            tableView.rowHeight = UITableViewAutomaticDimension
        }
    }
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    */
}

class MyTableViewCell: UITableViewCell {
    @IBOutlet var aConstraint: NSLayoutConstraint!
    @IBOutlet var bConstraint: NSLayoutConstraint!
}

extension ViewController: UITableViewDelegate {
    /*
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
    */
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.contentView.translatesAutoresizingMaskIntoConstraints = false
        if true {
            // the goal is to achieve constraint changes in `cellForRowAt`
            NSLayoutConstraint.deactivate([cell.aConstraint])
            NSLayoutConstraint.activate([cell.bConstraint])
        } else {
            NSLayoutConstraint.deactivate([cell.bConstraint])
            NSLayoutConstraint.activate([cell.aConstraint])
        }
        return cell
    }
}
