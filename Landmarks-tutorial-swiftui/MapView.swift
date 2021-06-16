//
//  MapView.swift
//  Landmarks-tutorial-swiftui
//
//  Created by Gemuele Aludino on 6/15/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    ///
    /// Holds region information for the map.
    ///
    /// You use the `@State` attribute to establish a source of truth for data in your app that you can modify
    /// from more than one view. SwiftUI manages the underlying stroage and automatically updates
    /// views that depend on the value.
    ///
    @State
    private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        ///
        /// By prefixing a state variable with `$`, you pass a binding, which is like a reference to the underlying value.
        /// When the user interacts with the map, the map updates the region value to match the part of the map
        /// that's currently visible in the user interface.
        ///
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
