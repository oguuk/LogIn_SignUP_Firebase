//
//  OnboardingViewModel.swift
//  Login&SignUpWithFirebase
//
//  Created by 오국원 on 2022/05/13.
//

import Foundation
import paper_onboarding

struct OnboardingViewModel {
    private let itemCount: Int
    init(itemCount: Int){
        self.itemCount = itemCount
    }
    
    func shouldShowGetStartedButton(forIndex index: Int) -> Bool {
        return index == itemCount - 1 ? true : false
    }
}
