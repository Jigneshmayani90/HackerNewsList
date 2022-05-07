//
//  NewsListingVC.swift
//  News
//
//  Created by Rahul Mayani on 24/04/21.
//

import Foundation
import RxSwift
import RxCocoa

class NewsListingVC: BaseVC {
    // MARK: - IBOutlet -
    @IBOutlet weak var listTableView: UITableView!
    
    // MARK: - Variable -
    // interaction between view and model by listing view model
    public let listingVM = NewsListingVM()
        
    // MARK: - View Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Bind table view with rxswift
        bindTableViewData()
                
        // Get data from Server
        listingVM.getDataFromServer(true)
    }
}

// MARK: - UITableView -
extension NewsListingVC {
    
    private func bindTableViewData() {
        
        listingVM.dataArray.bind(to: listTableView.rx.items(cellIdentifier: R.reuseIdentifier.newsListingCell.identifier, cellType: NewsListingCell.self))
        {  (row, news, cell) in
            cell.data = news
        }.disposed(by: rxbag)
    }
}
