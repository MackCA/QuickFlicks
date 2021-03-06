//
//  TrailerViewController.swift
//  Flix
//
//  Created by Chloe Mack on 2/26/21.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKUIDelegate {

    
    @IBOutlet weak var webView: WKWebView!
    var trailer:String = ""
    
    override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            view = webView
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myURL = URL(string: "https://www.youtube.com/watch?v=/\(trailer)")
                let myRequest = URLRequest(url: myURL!)
                webView.load(myRequest)

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
