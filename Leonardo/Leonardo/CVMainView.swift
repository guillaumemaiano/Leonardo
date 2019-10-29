//
//  CVMainView.swift
//  Leonardo
//
//  Created by guillaume MAIANO on 09/10/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct CVMainView: View {
    let userInformation: UserInformation
    
    @State private var isPicVisible = true
    @State private var isMailFocused = false
    @State private var isPhoneFocused = false
    @State private var isHomeFocused = false
    @State private var isExperienceFocused = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                    if isPicVisible {
                        VStack(alignment: .leading) {
                            if !isPhoneFocused {
                                Text("\(userInformation.contact.phone)")
                            }
                            if !isMailFocused {
                                Text("\(userInformation.contact.email)")
                            }
                        }
                        .padding(.leading)
                        .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(UIColor.systemBlue))
                    } else {
                        Group {
                            Button(action: { self.isPhoneFocused.toggle() }) {
                                Image(systemName: "phone")
                            }
                            Button(action: { self.isHomeFocused.toggle() }) {
                                Image(systemName: "house")
                            }
                            Button(action: { self.isMailFocused.toggle() }) {
                                Image(systemName: "envelope.badge")
                            }
                        }.font(.largeTitle).foregroundColor(Color(UIColor.label))
                }

                Spacer()
                Button(action: {
                    self.isPicVisible.toggle()
                    self.isMailFocused = false
                    self.isHomeFocused = false
                    self.isPhoneFocused = false
                }) {
                    if isPicVisible {
                    Image("visage")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 10.0)
                    }
                    else {
                        Image(systemName: "person").font(.largeTitle)
                    }
                 }
            }.padding( isPicVisible ? .trailing : .top)
            VStack(alignment: .leading) {
                if isPhoneFocused {
                                           Text("\(userInformation.contact.phone)")
                }
                if isMailFocused {
                                           Text("\(userInformation.contact.email)")
                }
                if isHomeFocused {
                    VStack(alignment: .leading) {
                        ForEach(userInformation.address.addressLines, id: \.self) {
                            line in
                            Text("\(line)")
                        }
                    Text("\(userInformation.address.zipcode) \(userInformation.address.city)")
                    }
                }
                }.font(.title).padding()
            Group {
            Text("\(userInformation.name) \(userInformation.surname)")
            .font(.title)
            Text(userInformation.role)
            Spacer()
                SkillsCVView(skills: [Skill(name: "Swift", level: 5),
                 Skill(name: "Objective-C", level: 4),
                 Skill(name: "SwiftUI", level: 3),
                 Skill(name: "Kotlin", level: 2),
                 Skill(name: "Java", level: 3),
                 Skill(name: "Linux", level: 4)
                ]).font(.largeTitle).padding()
                Button(action: { self.isExperienceFocused.toggle()}) {
                    Image(systemName: "person.3")
                }.font(.largeTitle).padding().foregroundColor(Color(UIColor.label))
                if isExperienceFocused {
                    ExperienceView(skills: [Skill(name: "Swift", level: 5),
                                         Skill(name: "Objective-C", level: 4),
                                         Skill(name: "SwiftUI", level: 3),
                                         Skill(name: "Kotlin", level: 2),
                                         Skill(name: "Java", level: 3),
                                         Skill(name: "Linux", level: 4)
                    ], jobs: [
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
                                      description: "Ingénierie informatique: gestion du parc informatique, maitien et surveillance du réseau, développement informatique, gestion de l'équipe mobile",
                                      skills: [
                                        Skill(name: "C++", level: 2),
                                        Skill(name: "Objective-C", level: 3),
                                        Skill(name: "Linux", level: 3)])
                        
                    ])
                        //.transition(.move(edge: .trailing))
                }
                AcademiaCVView(diplomas: [AcademiaDiploma(title: "titre d'ingénieur", issuer: "ENSIIE", date: "2009"),
                AcademiaDiploma(title: "MOOC RGPD", issuer: "CNIL", date: "2019")]).padding()
                //WebSiteContainerView(url: userInformation.contact.web).font(.largeTitle).padding()
            }.padding(.leading)
        }.multilineTextAlignment(.center)
            .padding(.bottom)
    }
}


struct UserInformation {

    // yes, that could be much better, but I don't need more myself
    // you're a doctor? Add the field in :)
    let name: String
    let surname: String
    let birthdate: Date
    let role: String
    let address: UserCVAddress
    let contact: UserCVContact
}

// It could be nice to pull this from the address book
// then again, this is a simple CV for the purpose of showing SwiftUI off, so why overengineer it
struct UserCVAddress {
    let city: String
    let zipcode: String
    let addressLines: [String]
}

struct UserCVContact {
    let phone: String
    let email: String
    let web: URL
}

struct ContentView_Previews: PreviewProvider {
    
    static let userInformation =
        UserInformation(
            name: "Guillaume",
            surname: "Maiano",
            birthdate: {
                let dateStringFormatter = DateFormatter()
                dateStringFormatter.dateFormat = "yyyy-MM-dd"
                dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
                return dateStringFormatter.date(from: "1982-04-20")!
                        }(),
            role: "Ingénieur Développement iOS",
            address: UserCVAddress(city: "Lille",
                                   zipcode: "59800",
                                   addressLines: ["151 rue Pierre Mauroy"]),
            contact: UserCVContact(phone: "06 27 06 83 48", email: "guillaume@maiano.fr", web: URL(string: "https://guillaume.maiano.fr")!))
    
    static var previews: some View {
        Group {
        CVMainView(userInformation: userInformation)
        CVMainView(userInformation: userInformation)
            .environment(\.colorScheme, .dark)
            .environment(\.layoutDirection, .rightToLeft)
        }
    }
}
