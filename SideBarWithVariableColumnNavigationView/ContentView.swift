//
//  ContentView.swift
//  SideBarWithVariableColumnNavigationView
//
//  Created by Ataias Pereira Reis on 03/04/21.
//

import SwiftUI

enum NavigationItem {
    case item1
    case item2
}

struct ContentView: View {
    @State private var selection: NavigationItem? = NavigationItem.item2

    var sideBar: some View {
        List(selection: $selection) {
            NavigationLink(
                destination: Text("Item 1"),
                tag: NavigationItem.item1,
                selection: $selection
            ) {
                Label("Item 1", systemImage: "chart.bar")
            }
            .tag(NavigationItem.item1)

            NavigationLink(
                destination: PickSomethingView(),
                tag: NavigationItem.item2,
                selection: $selection
            ) {
                Label("Item 2", systemImage: "chart.bar")
            }
            .tag(NavigationItem.item2)
        }
        .frame(minWidth: 180)
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem {
                Button(action: toggleSideBar) {
                    Label("Toggle Sidebar", systemImage: "sidebar.left")
                }
            }
        }
    }

    func toggleSideBar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar), with: nil)
    }

    // FIXME how to have a variable hierarchy? check comments below
    // Reference: body01
//    // This case shows two levels of hierarchy even when we don't want it
//    var body: some View {
//        NavigationView {
//            sideBar
//            Text("Select a category")
//                .foregroundColor(.secondary)
//            Text("Select something")
//                .foregroundColor(.secondary)
//        }
//    }

    // This case only shows one level, not allowing you to go all down item2 hierarchy
    // Reference: body02
    var body: some View {
        NavigationView {
            sideBar
            switch selection {
            case .none:
                Text("Select on the sidebar")
            case .item1:
                Text("Nothing to select")
            case .item2:
                Text("Select a category")
                    .foregroundColor(.secondary)
                Text("Select something")
                    .foregroundColor(.secondary)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
