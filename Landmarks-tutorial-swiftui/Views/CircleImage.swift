//
//  CircleImage.swift
//  Landmarks-tutorial-swiftui
//
//  Created by Gemuele Aludino on 6/15/21.
//

import SwiftUI

///
/// Custom image view
///
struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            /// Add a call to `clipShape(Circle())` to apply the circular clipping shape to the image.
            /// The `Circle` type is a shape that you can use as a mask, or as a view by giving the circle
            /// a stroke or fill.
            .clipShape(Circle())
            /// - Create another circle with a white stroke, and then add it as an overlay to give the image a border.
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            /// - Add a shadow with a 7 point radius.
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
