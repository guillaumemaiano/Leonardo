//
//  WebPageCVView.swift
//  Leonardo
//
//  Created by guillaume MAIANO on 21/10/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI
import WebKit

struct WebPageCVView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: url))
    }
}

#if DEBUG
struct WebPageCVView_Previews: PreviewProvider {
    static var previews: some View {
        WebPageCVView(url: URL(string: "https://guillaume.maiano.fr")!)
    }
}
#endif
