//
//  PostViewController.swift
//  snapChatProject
//
//  Created by Evan Chang on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.delegate = self
        postTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        postTableView.reloadData()
    }
    
    var ThreadNameArrays: [String] = []
    var selectedIndexPath: IndexPath?
    var array = [String] (threads.keys)
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return threads.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = [String] (threads.keys)
        let key = keys[section]
        guard let rows = threads[key] else {
            return 0
        }
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "outerPrototype", for: indexPath) as! outerTableViewCell
        let snapArray = threads[threadNames[indexPath.section]]!
        let snapSelected = snapArray[indexPath.row]
        cell.posterLabelOutlet.text = snapSelected.poster
        let timeElapsed = -((snapSelected.time).timeIntervalSinceNow)
        let timeString = snapSelected.toString(time: timeElapsed)
        cell.timeLabelOutlet.text = timeString
        if snapSelected.read {
            cell.readImageOutlet.image = UIImage(named: "read")
        } else {
            cell.readImageOutlet.image = UIImage(named: "unread")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        let snapArray = threads[threadNames[indexPath.section]]!
        let snapSelected = snapArray[indexPath.row]
        if snapSelected.read {
            print("SUCKS TO SUCK YOU ALREADY VIEWED THIS")
        } else {
            performSegue(withIdentifier: "postToImageViewer", sender: Any?.self)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "postToImageViewer" {
                if let dest = segue.destination as? ImageViewerViewController {
                    print(String((selectedIndexPath?.row)!))
                    print(String((selectedIndexPath?.section)!))
                    let snap = threads[threadNames[(selectedIndexPath?.section)!]]![(selectedIndexPath?.row)!]
                    dest.image = snap.image
                    snap.read = true
                }
            }
        }
    }
    
    @IBOutlet weak var postTableView: UITableView!
    
}
