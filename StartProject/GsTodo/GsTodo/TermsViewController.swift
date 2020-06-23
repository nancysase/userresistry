//
//  TermsViewController.swift
//  GsTodo
//
//  Created by SASE Koichiro on 2020/06/20.
//  Copyright © 2020 yamamototatsuya. All rights reserved.
//

import UIKit
import WebKit

class TermsViewController: UIViewController {

    @IBOutlet weak var wkWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadWebView("https://policies.google.com/terms?hl=ja")
        self.wkWebView.allowsBackForwardNavigationGestures = true
        
        }

    func loadWebView(_ urlString : String){
        let myURL =
URL(string: urlString)
        let myRequest = URLRequest(url: myURL!)
        self.wkWebView.load(myRequest)
        
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
