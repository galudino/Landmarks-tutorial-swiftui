//
//  LandmarkList.swift
//  Landmarks-tutorial-swiftui
//
//  Created by Gemuele Aludino on 6/15/21.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        HStack {
            NavigationView {
                ///
                /// Lists work with identifiable data. You can make your data identifiable in one of two ways:
                ///  - by passing along with your data a key path to a property that uniquely identifies each element
                ///  - by making your data type conform to the `Identifiable` protocol
                ///
                List(landmarks) { landmark in
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
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
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
}

///
/// Breaking down closure syntax:
///
/*
struct LandmarkList: View {
    var body: some View {
        return List(landmarks, rowContent: { (lm: landmark) -> LandmarkRow in
            return LandmarkRow(landmark: lm)
        })
    }
 
    var body: some View {
        return List(landmarks, rowContent: { lm -> LandmarkRow in
            return LandmarkRow(landmark: lm)
        })
    }
 
    var body: some View {
        return List(landmarks, rowContent: { lm in
            return LandmarkRow(landmark: lm)
        })
    }
 
    var body: some View {
        List(landmarks, rowContent: { lm in
            LandmarkRow(landmark: lm)
        })
    }
 
    var body: some View {
        List(landmarks, rowContent: {
            LandmarkRow(landmark: $0)
        })
    }

    var body: some View {
        List(landmarks) {
            LandmarkRow(landmark: $0)
        }
    }
}
*/
