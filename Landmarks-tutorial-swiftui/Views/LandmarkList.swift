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
                List(landmarks) { landmark in
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
        ForEach(["iPhone 12 Pro", "iPhone 12 Pro Max"], id: \.self) { deviceName in
            LandmarkList()
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
