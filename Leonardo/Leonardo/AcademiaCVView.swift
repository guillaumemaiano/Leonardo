//
//  AcademiaCVView.swift
//  Leonardo
//
//  Created by guillaume MAIANO on 21/10/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct AcademiaCVView: View {
    @State var isDetailed = false
    var diplomas: [AcademiaDiploma]
    var body: some View {
        Button(action: { self.isDetailed.toggle() }) {
            VStack(alignment: .leading) {
                Image(systemName: "rosette").font(.largeTitle)
                if isDetailed {
                    ForEach(diplomas, id: \.self) { diploma in
                        Text("Diplôme: \(diploma.title) \(diploma.issuer) - \(diploma.date)").padding(.top)
                    }
                }
            }
        }.foregroundColor(Color(UIColor.label))
    }
}

struct AcademiaDiploma: Hashable {
    let title: String
    let issuer: String
    let date: String // Frankly, Date's really painful
}

struct AcademiaCVView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        AcademiaCVView(diplomas: [AcademiaDiploma(title: "titre d'ingénieur", issuer: "ENSIIE", date: "2009"),
              AcademiaDiploma(title: "MOOC RGPD", issuer: "CNIL", date: "2019")])
             .environment(\.colorScheme, .dark)
            AcademiaCVView(diplomas: [AcademiaDiploma(title: "titre d'ingénieur", issuer: "ENSIIE", date: "2009"),
                  AcademiaDiploma(title: "MOOC RGPD", issuer: "CNIL", date: "2019")])
        }
    }
}
