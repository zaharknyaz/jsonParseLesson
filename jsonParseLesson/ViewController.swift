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
        let urlString = "https://icodeschool.ru/json2.php"
        
        guard let url = URL(string: urlString) else { return }
            
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString)
            //2020-10-25 12:34:00
            do {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let lessons = try decoder.decode([Lesson].self, from: data)
                print(lessons.first?.comments?.first?.user.name)
            }catch {
                print(error)
            }
                
            
        }.resume()
        
    }
    
}

