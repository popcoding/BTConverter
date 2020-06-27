//
// PingAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class PingAPI {
    /**
     Check API server status

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func pingGet(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        pingGetWithRequestBuilder().execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Check API server status
     - GET /ping


     - returns: RequestBuilder<Void> 
     */
    open class func pingGetWithRequestBuilder() -> RequestBuilder<Void> {
        let path = "/ping"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}