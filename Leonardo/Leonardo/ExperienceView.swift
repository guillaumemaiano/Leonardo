//
//  ExperienceView.swift
//  Leonardo
//
//  Created by guillaume MAIANO on 22/10/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI
import Combine

struct ExperienceView: View {
    
    var skills: [Skill]
    var jobs: [ProExperience]
    var selectedSkill:  Skill?
    var shownJobs: [ProExperience]?
    //var publisher: AnyPublisher<Void, Never>
    
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
            NavigationView {
                ScrollView(.vertical)  {
                // filtered stack of experiences
                VStack(alignment: .leading) {
                    ForEach(jobs) {
                        job in
                        JobMainView(job: job)
                    }
                }.padding()
                }
            }
        }
    }
}

struct ProExperience: Identifiable {
    let id = UUID()
    let companyName: String
    let dates: String
    let description: String
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
                      description: "Développement d'applications IoT (instruments musicaux) et gestion de l'équipe mobile (trois personnes).",
                      skills: [
                        Skill(name: "Swift", level: 5),
                        Skill(name: "Objective-C", level: 4),
                        Skill(name: "C++", level: 3),
                        Skill(name: "Kotlin", level: 2)]),
        ProExperience(companyName: "Pumpkin", dates: "2018",
        description: "Développement d'applications e-finance.",
                      skills: [
                        Skill(name: "Swift", level: 5),
                        Skill(name: "Objective-C", level: 4)]),
        ProExperience(companyName: "Wemanity", dates: "2016 - 2017",
                      description: "Consulting mobile pour divers clients requérant des applications iOS.",
                      skills: [
                        Skill(name: "Swift", level: 5),
                        Skill(name: "Objective-C", level: 4),
                        Skill(name: "C++", level: 3)]),
        ProExperience(companyName: "Locuz Software Solutions B.V.", dates: "2011 - 2015",
                      description: "Ingénierie informatique: gestion du parc informatique, maintien et surveillance du réseau, développement informatique, gestion de l'équipe mobile",
                      skills: [
                        Skill(name: "C++", level: 2),
                        Skill(name: "Objective-C", level: 3),
                        Skill(name: "Linux", level: 3)])
        
    ]
    
    static var previews: some View {
        ExperienceView(skills: skills, jobs: jobs)
    }
}
