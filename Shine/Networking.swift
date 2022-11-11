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
    
    typealias completionHandler = (Slip?,String?) -> Void
    
    func executeJson(completion: @escaping completionHandler) {
        
        let adviceURL = "https://api.adviceslip.com/advice"
        let request = AF.request(adviceURL)

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
    
