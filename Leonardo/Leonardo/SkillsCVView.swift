//
//  SkillsCVView.swift
//  Leonardo
//
//  Created by guillaume MAIANO on 21/10/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct SkillsCVView: View {
    
    @State var isSkillVisible = false
    
    var skills: [Skill]
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: { self.isSkillVisible.toggle() }) {
                Image(systemName: "checkmark.seal.fill").foregroundColor(.primary)
            }
            if isSkillVisible {
                ForEach(skills) {
                    skill in
                    HStack {
                        Text(skill.name)
                        Spacer()
                        HStack { ForEach(0..<skill.level, id: \.self) {
                            _ in
                            Image(systemName: "gear")
                            }
                        }
                    }
                }.font(.body)
            }
        }
    }
}

struct Skill: Identifiable {
    let id = UUID()
    let name: String
    let level: Int
}

struct SkillsCVView_Previews: PreviewProvider {
    
    static var skills = [Skill(name: "Swift", level: 5),
                         Skill(name: "Objective-C", level: 4),
                         Skill(name: "SwiftUI", level: 3),
                         Skill(name: "Kotlin", level: 2),
                         Skill(name: "Java", level: 3),
                         Skill(name: "Linux", level: 4)
    ]
    static var previews: some View {
        SkillsCVView(skills: skills)
    }
}
