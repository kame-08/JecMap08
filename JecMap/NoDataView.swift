//
//  NoDataView.swift
//  JecMap
//
//  Created by Ryo on 2022/10/24.
//

import SwiftUI

struct NoDataView: View {
    
    let url = URL(string: "app-settings:root=General&path=jp.jec.ac.cm.JecMap")
    
    var body: some View {
        VStack {
            Label("位置情報にアクセスできません", systemImage: "location.slash.fill")
            Button {
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            } label: {
                Text("設定を開く")
            }
            .buttonStyle(.borderedProminent)

        }
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
    }
}
