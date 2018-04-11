//
//  WebPageCharacterViewController.swift
//
//  Created by Joel de Almeida Souza on 11/04/2018.
//  Copyright © 2018 Joel de Almeida Souza. All rights reserved.
//

import UIKit
import WebKit

class WebPageCharacterViewController: UIViewController {
    ///selectedCharacter Character character selecionado
    var character: Character!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: character.urls.first!.url)
        let request = URLRequest(url: url!)
        
        title = character.name
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.load(request)
    }
}

extension WebPageCharacterViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}
