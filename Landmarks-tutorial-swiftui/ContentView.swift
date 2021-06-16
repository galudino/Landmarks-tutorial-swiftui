//
//  ContentView.swift
//  Landmarks-tutorial-swiftui
//
//  Created by Gemuele Aludino on 6/15/21.
//

import SwiftUI

///
/// By default, SwiftUI view files declare two structures.
/// The first structure conforms to the `View` protocol and describes the view’s content and layout.
/// The second structure declares a preview for that view.
///
struct ContentView: View {
    var body: some View {
        VStack {
            ///
            /// Add custom `MapView` to the top of the stack.
            ///
            /// When you specify only the `height` parameter, the view automatically sizes to the width
            /// of its content. In this case, `MapView` expands to fill the available space.
            ///
            /// To allow the map content to extend to the top edge of the screen,
            /// add the `ignoreSafeArea(edges: .top)` modifier to the map view.
            ///
            MapView().ignoresSafeArea(edges: .top).frame(height: 300)
            ///
            /// Add the `CircleImage` to the stack.
            ///
            /// To layer the image view on top of the map view, give the image an offset of -130 points
            /// vertically, and padding of -130 points from the bottom of the view.
            ///
            /// These adjustments make room for the text by moving the image upwards.
            ///
            CircleImage().offset(y: -130).padding(.bottom, -130)
            
            ///
            /// By default, stacks center their contents along their axis
            /// and provide context-appropriate spacing.
            ///
            VStack(alignment: .leading) {
                ///
                /// To customize a SwiftUI view, you call methods called modifiers.
                /// Modifiers wrap a view to change its display or other properties.
                /// Each modifier returns a new view, so it's common to chain
                /// multiple modifiers, stacked vertically.
                ///
                Text("Turtle Rock").font(.title).foregroundColor(.green)
                ///
                /// `.font(.title)`
                /// This applies the system font to the text
                /// so that it responds correctly to the user's preferred font sizes and settings.
                ///
                HStack {
                    Text("Joshua Tree National Park").font(.subheadline)
                    ///
                    /// A `Spacer` expands to make its containing view use all of the space of its parent view,
                    /// instead of having its size defined only by its contents.
                    ///
                    Spacer()
                    Text("California")
                }.font(.subheadline).foregroundColor(.secondary)
            }.padding()
            
            ///
            /// Add a divider and some additional descriptive text for the landmark.
            ///
            Divider()
            
            Text("About Turtle Rock")
                .font(.title2)
            
            ///
            /// Additional:
            ///     For longer descriptions, use a `ScrollView` so the user can move through the body of text.
            ///
            ScrollView(content: {
                Text("(from Wikipedia)")
                
                Text("Turtle Rock is a neighborhood in the south part of Irvine, Orange County, California, near Concordia University, Irvine and the University of California, Irvine. It is bounded to the north by University Drive and Mason Regional Park, to the east by the Strawberry Farms Golf Club and Ridgeline Drive, to the south by Shady Canyon Drive, and to the west by Culver Drive. Turtle Rock is one of the five \"villages\" originally forming Irvine; its 1967 founding is commemorated by a sculpture of a turtle in Turtle Rock Community Park, at the corner of Turtle Rock and Sunnyhill Drives. A two-lane internal loop road, Turtle Rock Drive, encircles the village and carries traffic between housing developments and the city's main streets.").padding()
                
                Text("Geographically, Turtle Rock lies in the San Joaquin Hills. Although the highest peak in the neighborhood is also sometimes called Turtle Rock, this hill has no official name. It is often referred to as \"Suicide Hill\" online, due to the usage of the hill's steepest slope to perform the \"Suicide\" exercise routine. The highest point at the hill is 161m tall. A lower peak to the north, also within the neighborhood, is called French Hill, with a peak of 128 meters. While it is not entirely clear where the name \"Turtle Rock\" comes from, there is a rocky outcropping on Rockview Drive at the northern end of the neighborhood (33°39′15″N 117°49′01″W) that is now maintained as part of an association park. This rock has the shape of the front of a turtle's carapace, and is sacred to the Gabrieleño Native Americans. It is often locally considered to be the origin of the name \"Turtle Rock\".").padding()
                    
                Text("Schools within Turtle Rock include Turtle Rock Preschool, Turtle Rock Elementary School, Bonita Canyon Elementary School, University High School, and Concordia University.").padding()
                
                Text("Planning and housing issues within Turtle Rock have been discussed regularly in Southern California newspapers. Henry Irving uses Turtle Rock as one of several test cases for analysis of urban communication.").padding()
            })

            
            ///
            /// Add a spacer at the bottom of the outer `VStack` to push the content to the top of the screen.
            ///
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
