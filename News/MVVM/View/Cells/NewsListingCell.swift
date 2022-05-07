//
//  NewsListingCell.swift
//  News
//
//  Created by Rahul Mayani on 24/04/21.
//

import Foundation
import UIKit

class NewsListingCell: UITableViewCell {

    // MARK: - IBOutlet -
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Variable -
    public var data: NewsModel? = nil {
        didSet {
            titleLabel.text = data?.title ?? ""
            descLabel.text = (data?.type ?? "") + "\n" + (data?.url ?? "")
            dateLabel.text = TimeInterval(data?.time ?? 0).string(dateFormate: AppDateFormat.date)
        }
    }
    
    // MARK: - Cell Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
