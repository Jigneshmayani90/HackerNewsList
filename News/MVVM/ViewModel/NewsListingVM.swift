//
//  NewsListingVM.swift
//  News
//
//  Created by Rahul Mayani on 24/04/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsListingVM {
    
    // MARK: - Variable -
    // listing data array observe by rxswift
    public var dataArray : BehaviorRelay<[NewsModel]> = BehaviorRelay(value: [])
        
    private let disposeBag = DisposeBag()
        
    // MARK: - Init -
    init() {
        
    }
}

// MARK: - API -
extension NewsListingVM {
    // get data from server by rxswift with alamofire
    public func getDataFromServer(_ isLoading: Bool = false) {
        
        if isLoading {
            Loader.startLoaderToAnimating()
        }
        
        APIManager.shared.setURL(APIEndPoint.Name.topNews)
        .setDeferredAsObservable()
        .flatMap({ (topNewsResponse) -> Observable<[Data]> in
            let topnews = TopNewsListModel.decodeJsonData(topNewsResponse)
            return Observable.from(topnews).flatMap { (story_id) -> Observable<Data> in
                return APIManager.shared.setURL(APIEndPoint.Name.newsDetails + "\(story_id).json")
                        .setDeferredAsObservable()
            }.toArray().asObservable()
        })
        .subscribeConcurrentBackgroundToMainThreads()
        .subscribe(onNext: { (response) in
            let news: [NewsModel] = response.map({ NewsModel.decodeJsonData($0) })
            self.dataArray.accept(news)
            Loader.stopLoaderToAnimating()
        }, onError: { (error) in
            UIAlertController.showAlert(title: nil, message: error.localizedDescription)
            Loader.stopLoaderToAnimating()
        }).disposed(by: disposeBag)
    }
}
