//
//  ImageFeedViewController.swift
//  snapChatProject
//
//  Created by Evan Chang on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var ThreadNameArrays: [String] = []
    var selectedIndexPath: IndexPath?
    var snap: Snap?
    var chosenImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewController.delegate = self
        tableViewController.dataSource = self
        postingToOutlet.text = "Select a Feed to Post to"
        ThreadNameArrays = threadNames
    }

    @IBOutlet weak var tableViewController: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ThreadNameArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewController.dequeueReusableCell(withIdentifier: "prototype", for: indexPath) as! tableViewCell
        cell.feedLabel.text = ThreadNameArrays[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        postingToOutlet.text = "Posting To: \(ThreadNameArrays[indexPath.row])"
    }
    
    @IBOutlet weak var postingToOutlet: UILabel!
    

    @IBAction func buttonWasPressed(_ sender: Any) {
        let date = Date()
        if let indexPath = selectedIndexPath {
            if let image = chosenImage {
                snap = Snap(time: date, image: image, poster: tempUser)
                threads[ThreadNameArrays[(indexPath.row)]]!.append(snap!)
            } else {
                print("You need to select an image first!")
            }
            performSegue(withIdentifier: "FeedToImagePickerSegue", sender: Any?.self)
            postedAlert()
        } else {
            print("Select a feed to post to first!")
        }
        
    }
    
    func postedAlert() {
        let alertController = UIAlertController(title: "Image Posted!", message: "You're cool", preferredStyle: .alert)
        
        // Create the actions
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        
        // Add the actions
        alertController.addAction(OKAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "FeedToImagePickerSegue" {
                if segue.destination is ImagePickerController {
                }
            }
        }
    }
}
