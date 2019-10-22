//
//  WebSiteContainerView.swift
//  Leonardo
//
//  Created by guillaume MAIANO on 21/10/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct WebSiteContainerView: View {
    let url: URL
    var body: some View {
        VStack {
            Image(systemName: "safari").foregroundColor(Color(UIColor.label))
            WebPageCVView(url: url)
        }
    }
}

struct WebSiteContainerView_Previews: PreviewProvider {
    static var previews: some View {
        WebSiteContainerView(url: URL(string: "https://guillaume.maiano.fr")!)
    }
}
