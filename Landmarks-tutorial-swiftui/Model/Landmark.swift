//
//  Landmark.swift
//  Landmarks-tutorial-swiftui
//
//  Created by Gemuele Aludino on 6/15/21.
//

import Foundation
import SwiftUI
import CoreLocation

///
/// Define a `Landmark` strucuture with a few properties matching names
/// of some of the keys in the `landmarkData.json` data file.
///
/// Adding `Codable` conformance makes it easier to load data into the structure.
///
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int // required by `Identifiable` protocol
    var name: String
    var park: String
    var state: String
    var description: String

    ///
    /// Add an `imageName` property to read the name of the image from the data,
    /// and a computed `image` property that loads an image from the asset catalog.
    ///
    /// You'll make the `imageName` property `private` because users of the `Landmark`
    /// structure care only about the image itself.
    ///
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    ///
    /// Add a `coordinates` property to the structure using a nested `Coordinates`
    /// type that reflects the storage in the JSON data structure.
    ///
    /// You'll mark this property as `private` because you'l use it only to create a `public`
    /// computed property, `locationCoordinate`.
    ///
    /// `locationCoordinate` will be used to interact with the `MapKit` framework.
    ///
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude,
                               longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
