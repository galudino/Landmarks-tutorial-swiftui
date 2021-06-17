//
//  FavoriteButton.swift
//  Landmarks-tutorial-swiftui
//
//  Created by Gemuele Aludino on 6/16/21.
//

import SwiftUI

struct FavoriteButton: View {
    ///
    /// Add an `isSet` binding that indicates the button's current state,
    /// and provide a constant value for the preview.
    ///
    /// Because you use a binding, changes made inside this view propagate
    /// back to the data source.
    ///
    @Binding
    var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        ///
        /// Create a `Button` with an action that toggles the `isSet` state,
        /// and that changes its appearance based on the state.
        ///
        FavoriteButton(isSet: .constant(true))
    }
}
