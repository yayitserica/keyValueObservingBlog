//
//  ViewController.swift
//  KeyValueObserving_Blog
//
//  Created by Erica Millado on 1/18/17.
//  Copyright © 2017 Erica Millado. All rights reserved.

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var seaWebView: WKWebView!
    let keyPathToObserve:String = "estimatedProgress"
    let urlString = "https://unsplash.com/search/sealife"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.seaWebView = WKWebView()
        self.view = seaWebView
        self.seaWebView.addObserver(self, forKeyPath: keyPathToObserve, options: .new, context: nil)
        loadWebPage()
    }
    
    func loadWebPage() {
        guard let unwrappedURL = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: unwrappedURL)
        self.seaWebView.load(urlRequest)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == keyPathToObserve {
            print("Loaded \(self.seaWebView.estimatedProgress*100)%")
        }
    }
    
    deinit {
        self.seaWebView.removeObserver(self, forKeyPath: keyPathToObserve, context: nil)
    }
}

