//
//  Functions.swift
//  game
//
//  Created by work on 20.08.2022.
//

import Foundation
import UIKit

class Function {
    
    static func saveImage(image: UIImage) -> String? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let fileName = UUID().uuidString
        let fileUrl = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.pngData() else { return nil }
        
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            do {
                try FileManager.default.removeItem(atPath: fileUrl.path)
                print("removed old image")
            } catch let error {
                print("couldn`t remove file at path", error)
            }
        }
        
        do {
            try data.write(to: fileUrl)
            print("\(fileName)")
            return fileName
        } catch let error {
            print("error saving file with error", error)
            return nil
        }
    }
    
    static func loadImage(fileName: String) -> UIImage? {
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let imageUrl = documentsDirectory.appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            
            return image
        }
        return nil
    }
}
