//
//  TwilioStudioAPI.swift
//  KKPhone
//
//  Created by KKday on 2020/11/26.
//

import Foundation
import DolphinHTTP

final class TwilioStudioAPI {
    
    private let loader: HTTPLoader
    
    init(loader: HTTPLoader) {
        self.loader = loader
    }
    
    func createExcution() {
        
        var r = HTTPRequest()
        r.host = "studio.twilio.com"
        r.path = "/v2/Flows/FWc8546f29786f758d5f8bc0a4468630fe/Executions"
        
        r.headers = ["Authorization" : "Basic QUM0ZTcyZDBmMDcxNjk2ZTFkNDQzMjA0NzdjMTJhYWNhYTpkODU1ZTIzOTkwYThiZDRjZGFiNDg5ZmU2YzliMTFlYw=="]

        r.body = FormBody([
            "To" : "+886989233699",
            "From" : "+15017122661"
       ])
        
        r.method = .post
        
        loader.load(request: r) { result in
            print(result.response?.status)
            
            switch result.response!.status {
            case .success, .create:
                print("OK")
            default:
                print("Bad")

            }
        }
        
    }
}
