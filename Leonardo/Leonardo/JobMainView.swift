//
//  JobMainView.swift
//  Leonardo
//
//  Created by guillaume MAIANO on 28/10/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct JobMainView: View {
    
    var job: ProExperience
    var body: some View {
        // putting the scrollview here allows scrolling the element content, but it's not looking very good
        //ScrollView(.vertical)  {
        VStack(alignment: .leading) {
            NavigationLink(destination: JobDescriptionView(job: job, onDismiss: {
                // I don't know, play a sound? whatever could be cool ^^'
            })) {
                HStack {
                    Text(job.companyName).font(.body)
                    Text(job.dates).font(.callout).italic()
                }
            }//.navigationBarTitle("Experiences")
            VStack(alignment: .leading) {
                ForEach(job.skills) {
                    skill in
                    // quick trick to get my gears to align
                    VStack(alignment: .trailing) {
                        HStack {
                            Text(skill.name)
                            Spacer()
                            ForEach (0 ..< skill.level, id: \.self) {
                                _ in
                                Image(systemName: "gear")
                            }
                        }.font(.caption)
                    }
                }
            }
            Spacer()
        }.padding(.bottom)
            // does not work here
        .navigationBarBackButtonHidden(true)
        //}
    }
}

struct JobMainView_Previews: PreviewProvider {
    
    static var job = ProExperience(companyName: "Locuz Software Solutions B.V.", dates: "2011 - 2015",
    description: "Ingénierie informatique: gestion du parc informatique, maintien et surveillance du réseau, développement informatique, gestion de l'équipe mobile",
    skills: [
      Skill(name: "C++", level: 2),
      Skill(name: "Objective-C", level: 3),
      Skill(name: "Linux", level: 3)])
    static var previews: some View {
        JobMainView(job: job)
    }
}
