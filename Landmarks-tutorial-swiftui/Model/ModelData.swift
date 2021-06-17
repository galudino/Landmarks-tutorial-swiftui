//
//  ModelData.swift
//  Landmarks-tutorial-swiftui
//
//  Created by Gemuele Aludino on 6/15/21.
//

import Foundation
import Combine

///
/// Declare a model type that conforms to the `ObservableObject`
/// protocol from the `Combine` framework.
///
/// SwiftUI subscribes to your observable object, and updates any views that need
/// refreshing when the data changes.
///
final class ModelData: ObservableObject {
    ///
    /// Create an array of landmarks that you initialize from `landmarkData.json`.
    ///
    /// An observable object needs to publish any changes to its data,
    /// so that its subscribes can pick up the change.
    ///
    @Published
    var landmarks: [Landmark] = load("landmarkData.json")
    
    ///
    /// Create a `load` function that fetches the JSON data with a given name from the app's main bundle.
    /// The `load` function relies on the return type's conformance to the `Decodable` protocol.
    ///
    private static func load<T: Decodable>(_ filename: String) -> T {
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
}
