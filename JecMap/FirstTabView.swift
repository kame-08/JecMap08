//
//  TabView.swift
//  JecMap
//
//  Created by Ryo on 2022/10/20.
//

import SwiftUI

struct FirstTabView: View {
    
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            ContentView()
                .tabItem {
                    Label("マップ", systemImage: "map.fill")
                }.tag(1)
            SafariView()
                .ignoresSafeArea(edges: .top)
                .tabItem {
                    Label("サイト", systemImage: "safari.fill")
                    
                }.tag(2)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}
