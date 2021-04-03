//
//  PickSomethingView.swift
//  SideBarWithVariableColumnNavigationView
//
//  Created by Ataias Pereira Reis on 03/04/21.
//

import SwiftUI

struct PickSomethingView: View {
    var body: some View {
        List {
            ForEach(1..<5) { value in
                NavigationLink(destination: Text("Sub-Item \(value)")) {
                    Text("Link \(value)")
                }
            }
        }
    }
}

struct DateList_Previews: PreviewProvider {
    static var previews: some View {
        PickSomethingView()
    }
}
