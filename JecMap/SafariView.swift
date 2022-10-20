//
//  SafariView.swift
//  JecMap
//
//  Created by Ryo on 2022/10/20.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL = URL(string:"https://event.jec.ac.jp/nissensai/#")!
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.dismissButtonStyle = .close
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView()
    }
}
