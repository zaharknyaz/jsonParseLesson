//
//  ViewController.swift
//  jsonParseLesson
//
//  Created by Захар Князев on 22.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickButton(_ sender: Any) {
        let urlString = "https://icodeschool.ru/json1.php"
        
        guard let url = URL(string: urlString) else { return }
            
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString)
            
            do {
                let lessons = try JSONDecoder().decode([Lesson].self, from: data)
                print(lessons.first?.name)
            }catch {
                print(error)
            }
                
            
        }.resume()
        
    }
    
}

