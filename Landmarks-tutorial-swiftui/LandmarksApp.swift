//
//  LandmarksApp.swift
//  Landmarks-tutorial-swiftui
//
//  Created by Gemuele Aludino on 6/15/21.
//

import SwiftUI

/// An app that uses the SwiftUI app life cycle has a structure that conforms to the `App` protocol.
/// The structure’s body property returns one or more scenes, which in turn provide content for display.
/// The `@main` attribute identifies the app’s entry point.
@main
struct LandmarksApp: App {
    ///
    /// Use the `@StateObject` attribute to initialize a model object
    /// for a given property only once during the lifetime of the app.
    ///
    /// See `ModelData.swift` for definition of `ModelData.`
    ///
    @StateObject
    private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
