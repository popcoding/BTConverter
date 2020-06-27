//
// CoinsAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class CoinsAPI {
    /**
     Get current data (name, price, market, ... including exchange tickers) for a coin

     - parameter _id: (path) pass the coin id (can be obtained from /coins) eg. bitcoin 
     - parameter localization: (query) Include all localized languages in response (true/false) &lt;b&gt;[default: true]&lt;/b&gt; (optional)
     - parameter tickers: (query) Include tickers data (true/false) &lt;b&gt;[default: true]&lt;/b&gt; (optional)
     - parameter marketData: (query) Include market_data (true/false) &lt;b&gt;[default: true]&lt;/b&gt; (optional)
     - parameter communityData: (query) Include community_data data (true/false) &lt;b&gt;[default: true]&lt;/b&gt; (optional)
     - parameter developerData: (query) Include developer_data data (true/false) &lt;b&gt;[default: true]&lt;/b&gt; (optional)
     - parameter sparkline: (query) Include sparkline 7 days data (eg. true, false) &lt;b&gt;[default: false]&lt;/b&gt; (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func coinsIdGet(_id: String, localization: String? = nil, tickers: Bool? = nil, marketData: Bool? = nil, communityData: Bool? = nil, developerData: Bool? = nil, sparkline: Bool? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        coinsIdGetWithRequestBuilder(_id: _id, localization: localization, tickers: tickers, marketData: marketData, communityData: communityData, developerData: developerData, sparkline: sparkline).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get current data (name, price, market, ... including exchange tickers) for a coin
     - GET /coins/{id}

     - parameter _id: (path) pass the coin id (can be obtained from /coins) eg. bitcoin 
     - parameter localization: (query) Include all localized languages in response (true/false) &lt;b&gt;[default: true]&lt;/b&gt; (optional)
     - parameter tickers: (query) Include tickers data (true/false) &lt;b&gt;[default: true]&lt;/b&gt; (optional)
     - parameter marketData: (query) Include market_data (true/false) &lt;b&gt;[default: true]&lt;/b&gt; (optional)
     - parameter communityData: (query) Include community_data data (true/false) &lt;b&gt;[default: true]&lt;/b&gt; (optional)
     - parameter developerData: (query) Include developer_data data (true/false) &lt;b&gt;[default: true]&lt;/b&gt; (optional)
     - parameter sparkline: (query) Include sparkline 7 days data (eg. true, false) &lt;b&gt;[default: false]&lt;/b&gt; (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func coinsIdGetWithRequestBuilder(_id: String, localization: String? = nil, tickers: Bool? = nil, marketData: Bool? = nil, communityData: Bool? = nil, developerData: Bool? = nil, sparkline: Bool? = nil) -> RequestBuilder<Void> {
        var path = "/coins/{id}"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "localization": localization, 
                        "tickers": tickers, 
                        "market_data": marketData, 
                        "community_data": communityData, 
                        "developer_data": developerData, 
                        "sparkline": sparkline
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get historical data (name, price, market, stats) at a given date for a coin

     - parameter _id: (path) pass the coin id (can be obtained from /coins) eg. bitcoin 
     - parameter date: (query) The date of data snapshot in dd-mm-yyyy eg. 30-12-2017 
     - parameter localization: (query) Set to false to exclude localized languages in response (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func coinsIdHistoryGet(_id: String, date: String, localization: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        coinsIdHistoryGetWithRequestBuilder(_id: _id, date: date, localization: localization).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get historical data (name, price, market, stats) at a given date for a coin
     - GET /coins/{id}/history

     - parameter _id: (path) pass the coin id (can be obtained from /coins) eg. bitcoin 
     - parameter date: (query) The date of data snapshot in dd-mm-yyyy eg. 30-12-2017 
     - parameter localization: (query) Set to false to exclude localized languages in response (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func coinsIdHistoryGetWithRequestBuilder(_id: String, date: String, localization: String? = nil) -> RequestBuilder<Void> {
        var path = "/coins/{id}/history"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "date": date, 
                        "localization": localization
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get historical market data include price, market cap, and 24h volume (granularity auto)

     - parameter _id: (path) pass the coin id (can be obtained from /coins) eg. bitcoin 
     - parameter vsCurrency: (query) The target currency of market data (usd, eur, jpy, etc.) 
     - parameter days: (query) Data up to number of days ago (eg. 1,14,30,max) 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func coinsIdMarketChartGet(_id: String, vsCurrency: String, days: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        coinsIdMarketChartGetWithRequestBuilder(_id: _id, vsCurrency: vsCurrency, days: days).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get historical market data include price, market cap, and 24h volume (granularity auto)
     - GET /coins/{id}/market_chart

     - parameter _id: (path) pass the coin id (can be obtained from /coins) eg. bitcoin 
     - parameter vsCurrency: (query) The target currency of market data (usd, eur, jpy, etc.) 
     - parameter days: (query) Data up to number of days ago (eg. 1,14,30,max) 

     - returns: RequestBuilder<Void> 
     */
    open class func coinsIdMarketChartGetWithRequestBuilder(_id: String, vsCurrency: String, days: String) -> RequestBuilder<Void> {
        var path = "/coins/{id}/market_chart"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "vs_currency": vsCurrency, 
                        "days": days
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto)

     - parameter _id: (path) pass the coin id (can be obtained from /coins) eg. bitcoin 
     - parameter vsCurrency: (query) The target currency of market data (usd, eur, jpy, etc.) 
     - parameter from: (query) From date in UNIX Timestamp (eg. 1392577232) 
     - parameter to: (query) To date in UNIX Timestamp (eg. 1422577232) 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func coinsIdMarketChartRangeGet(_id: String, vsCurrency: String, from: String, to: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        coinsIdMarketChartRangeGetWithRequestBuilder(_id: _id, vsCurrency: vsCurrency, from: from, to: to).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto)
     - GET /coins/{id}/market_chart/range

     - parameter _id: (path) pass the coin id (can be obtained from /coins) eg. bitcoin 
     - parameter vsCurrency: (query) The target currency of market data (usd, eur, jpy, etc.) 
     - parameter from: (query) From date in UNIX Timestamp (eg. 1392577232) 
     - parameter to: (query) To date in UNIX Timestamp (eg. 1422577232) 

     - returns: RequestBuilder<Void> 
     */
    open class func coinsIdMarketChartRangeGetWithRequestBuilder(_id: String, vsCurrency: String, from: String, to: String) -> RequestBuilder<Void> {
        var path = "/coins/{id}/market_chart/range"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "vs_currency": vsCurrency, 
                        "from": from, 
                        "to": to
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get status updates for a given coin (beta)

     - parameter _id: (path) pass the coin id (can be obtained from /coins) eg. bitcoin 
     - parameter perPage: (query) Total results per page (optional)
     - parameter page: (query) Page through results (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func coinsIdStatusUpdatesGet(_id: String, perPage: Int? = nil, page: Int? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        coinsIdStatusUpdatesGetWithRequestBuilder(_id: _id, perPage: perPage, page: page).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get status updates for a given coin (beta)
     - GET /coins/{id}/status_updates

     - parameter _id: (path) pass the coin id (can be obtained from /coins) eg. bitcoin 
     - parameter perPage: (query) Total results per page (optional)
     - parameter page: (query) Page through results (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func coinsIdStatusUpdatesGetWithRequestBuilder(_id: String, perPage: Int? = nil, page: Int? = nil) -> RequestBuilder<Void> {
        var path = "/coins/{id}/status_updates"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "per_page": perPage?.encodeToJSON(), 
                        "page": page?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get coin tickers (paginated to 100 items)

     - parameter _id: (path) pass the coin id (can be obtained from /coins/list) eg. bitcoin 
     - parameter exchangeIds: (query) filter results by exchange_ids (ref: v3/exchanges/list) (optional)
     - parameter includeExchangeLogo: (query) flag to show exchange_logo (optional)
     - parameter page: (query) Page through results (optional)
     - parameter order: (query) valid values: &lt;b&gt;trust_score_desc (default), trust_score_asc and volume_desc&lt;/b&gt; (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func coinsIdTickersGet(_id: String, exchangeIds: String? = nil, includeExchangeLogo: String? = nil, page: Int? = nil, order: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        coinsIdTickersGetWithRequestBuilder(_id: _id, exchangeIds: exchangeIds, includeExchangeLogo: includeExchangeLogo, page: page, order: order).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get coin tickers (paginated to 100 items)
     - GET /coins/{id}/tickers

     - parameter _id: (path) pass the coin id (can be obtained from /coins/list) eg. bitcoin 
     - parameter exchangeIds: (query) filter results by exchange_ids (ref: v3/exchanges/list) (optional)
     - parameter includeExchangeLogo: (query) flag to show exchange_logo (optional)
     - parameter page: (query) Page through results (optional)
     - parameter order: (query) valid values: &lt;b&gt;trust_score_desc (default), trust_score_asc and volume_desc&lt;/b&gt; (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func coinsIdTickersGetWithRequestBuilder(_id: String, exchangeIds: String? = nil, includeExchangeLogo: String? = nil, page: Int? = nil, order: String? = nil) -> RequestBuilder<Void> {
        var path = "/coins/{id}/tickers"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "exchange_ids": exchangeIds, 
                        "include_exchange_logo": includeExchangeLogo, 
                        "page": page?.encodeToJSON(), 
                        "order": order
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     List all supported coins id, name and symbol (no pagination required)

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func coinsListGet(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        coinsListGetWithRequestBuilder().execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     List all supported coins id, name and symbol (no pagination required)
     - GET /coins/list


     - returns: RequestBuilder<Void> 
     */
    open class func coinsListGetWithRequestBuilder() -> RequestBuilder<Void> {
        let path = "/coins/list"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     List all supported coins price, market cap, volume, and market related data

     - parameter vsCurrency: (query) The target currency of market data (usd, eur, jpy, etc.) 
     - parameter ids: (query) The ids of the coin, comma separated crytocurrency symbols (base). refers to &#x60;/coins/list&#x60;. &lt;b&gt;When left empty, returns numbers the coins observing the params &#x60;limit&#x60; and &#x60;start&#x60;&lt;/b&gt; (optional)
     - parameter order: (query) valid values: &lt;b&gt;market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, market_cap_desc, volume_asc, volume_desc, id_asc, id_desc&lt;/b&gt; sort results by field. (optional, default to market_cap_desc)
     - parameter perPage: (query) valid values: 1..250 Total results per page (optional, default to 100)
     - parameter page: (query) Page through results (optional, default to 1)
     - parameter sparkline: (query) Include sparkline 7 days data (eg. true, false) (optional, default to false)
     - parameter priceChangePercentage: (query) Include price change percentage in &lt;b&gt;1h, 24h, 7d, 14d, 30d, 200d, 1y&lt;/b&gt; (eg. &#x27;&#x60;1h,24h,7d&#x60;&#x27; comma-separated, invalid values will be discarded) (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func coinsMarketsGet(vsCurrency: String, ids: String? = nil, order: String? = nil, perPage: Int? = nil, page: Int? = nil, sparkline: Bool? = nil, priceChangePercentage: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        coinsMarketsGetWithRequestBuilder(vsCurrency: vsCurrency, ids: ids, order: order, perPage: perPage, page: page, sparkline: sparkline, priceChangePercentage: priceChangePercentage).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     List all supported coins price, market cap, volume, and market related data
     - GET /coins/markets

     - parameter vsCurrency: (query) The target currency of market data (usd, eur, jpy, etc.) 
     - parameter ids: (query) The ids of the coin, comma separated crytocurrency symbols (base). refers to &#x60;/coins/list&#x60;. &lt;b&gt;When left empty, returns numbers the coins observing the params &#x60;limit&#x60; and &#x60;start&#x60;&lt;/b&gt; (optional)
     - parameter order: (query) valid values: &lt;b&gt;market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, market_cap_desc, volume_asc, volume_desc, id_asc, id_desc&lt;/b&gt; sort results by field. (optional, default to market_cap_desc)
     - parameter perPage: (query) valid values: 1..250 Total results per page (optional, default to 100)
     - parameter page: (query) Page through results (optional, default to 1)
     - parameter sparkline: (query) Include sparkline 7 days data (eg. true, false) (optional, default to false)
     - parameter priceChangePercentage: (query) Include price change percentage in &lt;b&gt;1h, 24h, 7d, 14d, 30d, 200d, 1y&lt;/b&gt; (eg. &#x27;&#x60;1h,24h,7d&#x60;&#x27; comma-separated, invalid values will be discarded) (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func coinsMarketsGetWithRequestBuilder(vsCurrency: String, ids: String? = nil, order: String? = nil, perPage: Int? = nil, page: Int? = nil, sparkline: Bool? = nil, priceChangePercentage: String? = nil) -> RequestBuilder<Void> {
        let path = "/coins/markets"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "vs_currency": vsCurrency, 
                        "ids": ids, 
                        "order": order, 
                        "per_page": perPage?.encodeToJSON(), 
                        "page": page?.encodeToJSON(), 
                        "sparkline": sparkline, 
                        "price_change_percentage": priceChangePercentage
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}