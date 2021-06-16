//
//  Landmarks_tutorial_swiftuiApp.swift
//  Landmarks-tutorial-swiftui
//
//  Created by Gemuele Aludino on 6/15/21.
//

import SwiftUI

/// An app that uses the SwiftUI app life cycle has a structure that conforms to the `App` protocol.
/// The structure’s body property returns one or more scenes, which in turn provide content for display.
/// The `@main` attribute identifies the app’s entry point.
@main
struct Landmarks: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
