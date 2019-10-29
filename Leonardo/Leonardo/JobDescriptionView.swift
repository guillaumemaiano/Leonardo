//
//  JobDescriptionView.swift
//  Leonardo
//
//  Created by guillaume MAIANO on 22/10/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct JobDescriptionView: View {

    var job: ProExperience
    var onDismiss: () -> Void
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ScrollView(.vertical) {
        VStack(alignment: .leading) {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                print("oO")
                self.onDismiss()}) {
                    Text(job.companyName).foregroundColor(.primary).font(.headline).padding()
                Image(systemName: "chevron.left.circle")
                }
            Text(job.description).padding()
            }
        }// note how the back button works if I set it here,
        // but not if I set it within 
        .navigationBarBackButtonHidden(true)
    }
}

struct JobDescriptionView_Previews: PreviewProvider {
    
    static var job = ProExperience(companyName: "Locuz Software Solutions B.V.", dates: "2011 - 2015",
    description: "Ingénierie informatique: gestion du parc informatique, maintien et surveillance du réseau, développement informatique, gestion de l'équipe mobile",
    skills: [
      Skill(name: "C++", level: 2),
      Skill(name: "Objective-C", level: 3),
      Skill(name: "Linux", level: 3)])
    
    static var previews: some View {
        JobDescriptionView(job: job, onDismiss: {})
    }
}
