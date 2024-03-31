//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Sisi Wang on 3/31/24.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var titleTextView: UITextView!
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never 
        // Do any additional setup after loading the view.
        
        if let post = post {
            print("Post: \(post)")
            titleTextView.text = post.caption.trimHTMLTags()
        } else {
            print("No post received")
        }
        
        if let photo = post?.photos.first {
            let imageUrlString = photo.originalSize.url.absoluteString
            
            if let imageURL = URL(string: imageUrlString) {
                Nuke.loadImage(with: imageURL, into: backdropImageView)
            } else {
                print("Invalid image URL")
            }
        } else {
            print("No photo available")
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
    
