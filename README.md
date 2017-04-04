# Snapchat Clone #

## Description ##
A Snapchat clone where users are able to select a picture, post to a feed, and then view all the posts in a feed in the "Snap" style of clicking on an image, viewing it, and not being able to see it again.
![alt text](/README-images/previewSnap.002.jpeg)

## Project Structure ##
* 4 views: Camera view, Post tableview, Feed tableview, and the image view

## Features ##

![alt text](/README-images/camera-preview.gif)
###  Image Selection ###
* Camera layout similar to Snapchat
* Uses AVFoundation to capture camera input from connected device
* Flip camera feature

###  Image Posting ###
##### Screen Elements #####
* UITableView of feeds to post to
* UIbutton to post snap to feed
* Status indicator that displays what feed you have selected to post to
* Alert that you have posted the snap

##### Flow #####
* User selects feed to post to (Cannot select multiple!)
* User sees the feed he's posting to and clicks the post button
* User is alerted that snap has been posted and is taken back to the image picker screen

### Image Feed ###
##### Screen Elements #####
* UITableView split into sections based on feed
* Each section has a UITableViewCell with the poster's name, how long ago it was posted, and a status indicator image (read/unread)
* Tapping on a UITableViewCell opens the image full screen

##### Flow #####
* User selects a snap to view by tapping on it
* The entire screen only has the image on it
* Tapping the image dismisses the image
* Image marked as read with the "read" image
* Image not viewable again
