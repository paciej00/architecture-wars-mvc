//
//  URL+Extension.swift
//  MyCards
//
//  Created by Maciej Piotrowski on 06/03/17.
//

import Foundation

extension URL {
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public mutating func setExcludedFromBackup(_ flag: Bool) throws {
        
        var values: URLResourceValues = try resourceValues(forKeys: [URLResourceKey.isExcludedFromBackupKey])
        
        
        values.isExcludedFromBackup = flag
        
        
        try setResourceValues(values)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    var sqliteFileURLs: [URL] {
        
        
        let wal: String = "\(path)-wal"
        let journal: String = "\(path)-journal"
        let shm: String = "\(path)-shm"
        
        let filesNames: [String] = [path, wal, shm, journal]
        
        return filesNames
            .filter { FileManager.default.fileExists(atPath: $0) }
            .map { (path: String) -> URL in URL(fileURLWithPath: path) }
        
        
    }
}
    
    
    
    
    
    
    








