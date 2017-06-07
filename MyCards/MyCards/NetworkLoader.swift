//
//  NetworkLoader.swift
//  MyCards
//
//  Created by Maciej Piotrowski on 11/11/16.
//

import Foundation

protocol DataDownloading {
    func download(from endpoint: String, callback: @escaping (Data?) -> Void)
}

protocol Parser {
    func parse(_ json: Data?, with decoder: JSONDecoder) throws -> Any?
}

protocol ParsedDataDownloading {
    func download(from endpoint: String, parser: Parser, callback: @escaping (Any?) -> Void)
}

protocol JSONDataConverting {
    func json(from object: Codable, with encoder: JSONEncoder) throws -> Data?
}

protocol DataUploading {
    func upload(data: Data, to endpoint: String, callback: @escaping (Any?) -> Void)
}

protocol JSONConvertibleDataUploading {
    func upload(object: Codable, to endpoint: String, parser: JSONDataConverting, callback: @escaping (Any?) -> Void)
}

typealias ResourceLoading = ParsedDataDownloading & JSONConvertibleDataUploading

final class NetworkLoader {

    let webserviceURL: URL
    let session: URLSession

    init(_ webserviceURL: URL, session: URLSession = URLSession(configuration: .default)) {
        self.webserviceURL = webserviceURL
        self.session = session
    }

    func url(with endpoint: String) -> URL {
        return webserviceURL.appendingPathComponent(endpoint)
    }
}

extension NetworkLoader: DataDownloading {
    func download(from endpoint: String, callback: @escaping (Data?) -> Void) {
        let url = self.url(with: endpoint)
        let task = session.dataTask(with: url) { (data, _, error) -> Void in
            guard error == nil,
                let data = data
                else { print(String(describing: error)); callback(nil); return }
            callback(data)
        }
        task.resume()
    }

}

extension NetworkLoader: ParsedDataDownloading {
    func download(from endpoint: String, parser: Parser, callback: @escaping (Any?) -> Void) {
        download(from: endpoint) { jsonData in
            do {
                let parsed = try parser.parse(jsonData, with: JSONDecoder())
                callback(parsed)
            } catch {
                callback(nil)
            }
        }
    }
}

extension NetworkLoader: DataUploading {
    func upload(data: Data, to endpoint: String, callback: @escaping (Any?) -> Void) {
        let url = self.url(with: endpoint)
        let request = URLRequest(url: url)
        let task = session.uploadTask(with: request, from: nil) { (data, _, error) in
            guard error == nil,
                let data = data
                else { print(String(describing: error)); callback(nil); return }
            callback(data.JSONObject)
        }
        task.resume()
    }
}

extension NetworkLoader: JSONConvertibleDataUploading {
    func upload(object: Codable, to endpoint: String, parser: JSONDataConverting, callback: @escaping (Any?) -> Void) {
        do {
            guard let jsonData = try parser.json(from: object, with: JSONEncoder()) else { callback(nil); return }
            //print(String(data: jsonData, encoding: .utf8) ?? "")
            upload(data: jsonData, to: endpoint) { (responseData) in
                callback(responseData)
            }
        } catch {
            callback(nil)
        }
    }
}
