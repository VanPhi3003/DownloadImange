//
//  ViewController.swift
//  downloadImage
//
//  Created by Phi Trinh on 7/5/17.
//  Copyright © 2017 Phi Trinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textImange: UIImageView!
    @IBOutlet weak var textLink: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLoadImage(_ sender: UIButton) {
        if textLink.text == "" {
        let alert = UIAlertController(title: "Error", message:"please input link image", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        }
        else {
            let url = textLink.text
            downloadImangeURL(url!)
            
        }
        
    }
    
    func downloadImangeURL(_ url: String) {
        let imgURl = URL(string: url)
        (URLSession(configuration: .default)).dataTask(with: imgURl!, completionHandler: {(dataImage, response, Error) in
            if let data = dataImage {
                DispatchQueue.main.async() { () -> Void in
                    self.textImange.image = UIImage(data: data)
                }
            }
    }).resume()
    }
    
    @IBAction func btnClear(_ sender: Any) {
        
        textLink.text = ""
        textImange.image = nil
    }

}

