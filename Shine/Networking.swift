//
//  Networking.swift
//  Shine
//
//  Created by Kamil Caglar on 10/11/2022.
//

import Foundation
import Alamofire

class Networking {
    
    func execute() {
        AF.request("https://api.adviceslip.com/advice")
            .response { (response) in
                debugPrint(response)
            }
        let adviceURL = "https://api.adviceslip.com/advice"
        let request = AF.request(adviceURL)
        print(request)
    }
    
    static var shared = Networking()
    
    typealias completionHandler1 = ([Slips]?,String?) -> Void
    
    func adviceRequest(query: String, completion: @escaping (SlipQuestion?, String?) -> Void){
        
        let adviceURL = "https://api.adviceslip.com/advice/search/"
        let urlString = "\(adviceURL)\(query)"
        let request = AF.request(urlString)
        print(request)
        request.validate().responseDecodable(of: SlipQuestion.self) { response in
            switch response.result {
            case .success(let slipQuestion):
                completion(slipQuestion, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
        
//        print(urlString)
//        let request = AF.request(urlString).responseJSON { response in
//
//            print("Result: \(response.result)")
//            if let json = response.request?.value {
//                print(json)
//            }
//        }
    }
    
    typealias completionHandler = (Slip?,String?) -> Void
    
    func executeJson(completion: @escaping completionHandler) {
        
        let adviceURL = "https://api.adviceslip.com/advice"
        let request = AF.request(adviceURL)
        print(request)
        request.validate().responseDecodable(of: AdviceSlip.self) { response in
            switch response.result {
          case .success(let adviceSlip):
                completion(adviceSlip.slip, nil)
          case .failure(let error):
              completion(nil, error.localizedDescription)
            }
        }
    }
    
    
}
    
