//
//  LandmarkRow.swift
//  Landmarks-tutorial-swiftui
//
//  Created by Gemuele Aludino on 6/15/21.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkView_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        ///
        /// You can use a `Group` to return multiple previews from a preview provider.
        ///
        /// Wrap the returned row in a `Group, and add the first row back again.
        /// `Group` is a container for grouping view content. Xcode renderes the group's child
        /// views as separate previews in the canvas.
        ///
        Group {
            LandmarkRow(landmark: landmarks[0]).previewLayout(.fixed(width: 300, height: 70))
            LandmarkRow(landmark: landmarks[1]).previewLayout(.fixed(width: 300, height: 70))
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
