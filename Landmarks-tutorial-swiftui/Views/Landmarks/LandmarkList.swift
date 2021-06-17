//
//  LandmarkList.swift
//  Landmarks-tutorial-swiftui
//
//  Created by Gemuele Aludino on 6/15/21.
//

import SwiftUI

struct LandmarkList: View {
    ///
    /// Add an `@EnvironmentObject` property declaration to the view,
    /// and an `environmentObject(_ :)` modifier to the preview.
    ///
    /// The `modelData` property gets its value automatically,
    /// as long as the `environmentObject(_ :)` modifier
    /// has been applied to a parent.
    ///
    @EnvironmentObject
    var modelData: ModelData
    
    ///
    /// Add a `@state` property called `showFavoritesOnly` with its initial value to set to `false`.
    ///
    /// Because you use state properties to hold information that's specific to a view and its subviews,
    /// you always create state as `private`.
    ///
    @State
    private var showFavoritesOnly = false
    
    ///
    /// Compute a filtered version of the landmarks list by checking the `showFavoritesOnly`
    /// property and each `landmark.isFavorite` value.
    ///
    var filteredLandmarks: [Landmark] {
        ///
        /// `filter(_ :isIncluded)` will return a new `[Landmark]`
        ///  that consists of elements that satisfiy the condition `(!showFavoritesOnly || $0.isFavorite)`
        ///
        modelData.landmarks.filter { !showFavoritesOnly || $0.isFavorite }
    }
    
    var body: some View {
        NavigationView {
            ///
            /// Lists work with identifiable data. You can make your data identifiable in one of two ways:
            ///  - by passing along with your data a key path to a property that uniquely identifies each element
            ///  - by making your data type conform to the `Identifiable` protocol
            ///
            List {
                ///
                /// Add a `Toggle` view as the first child of the `List` view,
                /// passing a binding to show `FavoritesOnly`.
                ///
                /// Use a `$` prefix to access a bnding to a state variable, or one of its properties.
                ///
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ///
                /// Create a nested `ForEach` group to transform the landmarks into rows.
                ///
                /// To combine static and dynamic views in a list,
                /// or to combine two or more different
                /// groups of dynamic views,
                /// use for `ForEach` type instead of passing your collection of data to `List`.
                ///
                ForEach(filteredLandmarks) { landmark in
                    ///
                    /// Wrap the returned row in a `NavigationLink`,
                    /// specifying the `LandmarkDetail` view as the destination.
                    ///
                    /// Pass the current landmark to the destination, `LandmarkDetail`.
                    ///
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
    
    /*
    static var previews: some View {
        ///
        /// Within the list preview, embed the `LandmarkList` in a `ForEach` instance,
        /// using an array of device names as the data.
        ///
        /// `ForEach` operates on collections the same way as the list, which means you can use it
        /// anywhere you can use a child view, such as in stacks, lists, groups, and more.
        /// When the elements of your data are simple value types -- like the strings you're using here --
        /// you can use `\.self` as key path to the identifier.
        ///
        ForEach(["iPhone 12 Pro", "iPhone 12 Pro Max"], id: \.self) { deviceName in
            LandmarkList()
                ///
                /// Use the `previewDisplayName(_ :)` modifier
                /// to add the device names as labels for the previews.
                ///
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
    */
}
