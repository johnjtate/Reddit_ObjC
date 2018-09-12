//
//  SubredditTableViewCell.swift
//  Reddit_ObjC
//
//  Created by John Tate on 9/12/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import UIKit

class SubredditTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var redditImageView: UIImageView!
    
    var subreddit: JJTSubreddit? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let subreddit = subreddit else { return }
        titleLabel.text = subreddit.title
        likesCountLabel.text = "Likes: \(subreddit.likeCount)"
        commentCountLabel.text = "Comments: \(subreddit.commentCount)"
        redditImageView.image = subreddit.photo
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        redditImageView.image = nil 
    }

}
