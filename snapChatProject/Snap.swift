//
//  Snap.swift
//  snapChatProject
//
//  Created by Evan Chang on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class Snap {
    
    let time: Date!
    let image: UIImage!
    let poster: String!
    var read: Bool = false
    
    init(time: Date, image: UIImage, poster: String) {
        self.time = time
        self.image = image
        self.poster = poster
    }
    
    func toString(time: Double) -> String {
        let hours = String(Int(time / 3600))
        let minutes = String(Int(time / 60))
        let seconds = String(Int(time.truncatingRemainder(dividingBy: 60)))
        let timeString = hours + " hours " + minutes +  " minutes " + seconds + " seconds ago"
        return timeString
    }
    
}
