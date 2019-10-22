//
//  Experience.swift
//  Leonardo
//
//  Created by guillaume MAIANO on 22/10/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct Experience: View {
    
    var skills: [Skill]
    var jobs: [ProExperience]

    var body: some View {
        VStack(alignment: .trailing) {
            Button (action: {}) {
            Image(systemName: "arrow.2.circlepath.circle").foregroundColor(.primary)
            }
        // Cloud of skills
        HStack {
            ForEach(skills) { skill in
            Button (action: {}) {
                Text (skill.name).foregroundColor(.white)
            }.foregroundColor(.primary)
                }.background(Capsule()
                    .foregroundColor(.accentColor))
        }.padding(.bottom)
            // filtered stack of experiences
            VStack(alignment: .leading) {
                ForEach(jobs) {
                    job in
                    VStack {
                        HStack {
                            Text(job.companyName).font(.body)
                            Text(job.dates).font(.callout).italic()
                        }
                        HStack {
                            ForEach(job.skills) {
                                skill in
                                HStack {
                                    Text(skill.name)
//                                    ForEach (0 ..< skill.level, id: \.self) {
//                                        _ in
//                                        Image(systemName: "gear")
//                                    }
                                }.font(.caption)
                            }
                        }
                    }.padding(.bottom)
                }
            }.padding()
        }
    }
}

struct ProExperience: Identifiable {
    let id = UUID()
    let companyName: String
    let dates: String
    let skills: [Skill]
}

struct Experience_Previews: PreviewProvider {
    
    static var skills = [Skill(name: "Swift", level: 5),
                         Skill(name: "Objective-C", level: 4),
                         Skill(name: "SwiftUI", level: 3),
                         Skill(name: "Kotlin", level: 2),
                         Skill(name: "Java", level: 3),
                         Skill(name: "Linux", level: 4)
    ]
    
    static var jobs = [
        ProExperience(companyName: "Redison", dates: "2018 - 2019",
                      skills: [
                        Skill(name: "Swift", level: 5),
                        Skill(name: "Objective-C", level: 4),
                        Skill(name: "C++", level: 3),
                        Skill(name: "Kotlin", level: 2)]),
        ProExperience(companyName: "Pumpkin", dates: "2018",
                      skills: [
                        Skill(name: "Swift", level: 5),
                        Skill(name: "Objective-C", level: 4)]),
        ProExperience(companyName: "Wemanity", dates: "2016 - 2017",
                      skills: [
                        Skill(name: "Swift", level: 5),
                        Skill(name: "Objective-C", level: 4),
                        Skill(name: "C++", level: 3)]),
        ProExperience(companyName: "Locuz Software Solutions B.V.", dates: "2011 - 2015",
                      skills: [
                        Skill(name: "C++", level: 2),
                        Skill(name: "Objective-C", level: 3),
                        Skill(name: "Linux", level: 3)])
        
    ]

    static var previews: some View {
        Experience(skills: skills, jobs: jobs)
    }
}
