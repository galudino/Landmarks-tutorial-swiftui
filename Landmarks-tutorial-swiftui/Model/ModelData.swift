//
//  ModelData.swift
//  Landmarks-tutorial-swiftui
//
//  Created by Gemuele Aludino on 6/15/21.
//

import Foundation

///
/// Create a `load` function that fetches the JSON data with a given name from the app's main bundle.
/// The `load` function relies on the return type's conformance to the `Decodable` protocol.
///
func load<T>(_ filename: String) -> T where T: Decodable {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n(error)")
    }
}

///
/// Create an array of landmarks that you initialize from `landmarkData.json`.
///
var landmarks: [Landmark] = load("landmarkData.json")

