//
//  ViewController.swift
//  Silly Song
//
//  Created by Lev Tsenovoy on 4/8/17.
//  Copyright © 2017 Lev Tsenovoy. All rights reserved.
//

import UIKit

extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField)-> Bool{
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {

    
    @IBOutlet weak var namedFiield: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            namedFiield.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        namedFiield.text = ""
        lyricsView.text = ""

    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = sillyName(name: namedFiield.text!)
    }

}//class

func shorten(x: Int, name: String)->String{
    var x = x
    var name = name
    while (x != 1){
        name.remove(at: name.startIndex)
        x = x-1
    }
    return name
}//shorten

func shortNameFromName(name:String)->String{
    var name = name.lowercased()
    var counter = 0
    
    for index in name.characters{
        counter+=1
        if ((index == "a")||(index == "e")||(index == "i")||(index=="o")||(index == "u")){
            return shorten(x: counter, name: name)
        }//for loop
    }
    return name
}//shortNameFromName

func sillyName( name: String) -> String{
    

    let fullname = name
    let shortname = shortNameFromName(name: fullname)
    
    let bananaFanaTemplate = ["\(fullname) ,\(fullname) , Bo B\(shortname)",
        "Banana Fana Fo F\(shortname)",
        "Me My Mo M\(shortname)",
        "\(fullname)"].joined(separator: "\n")
    return bananaFanaTemplate
}//silly name
