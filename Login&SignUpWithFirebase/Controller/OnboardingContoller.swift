//
//  OnboardingContoller.swift
//  Login&SignUpWithFirebase
//
//  Created by 오국원 on 2022/05/12.
//

import paper_onboarding
import UIKit

class OnboardingContoller:UIViewController {
    //MARK: - Properties
    private var onboardingItems = [OnboardingItemInfo]()
    private var onboardingView = PaperOnboarding()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureOnboardingDataSource()
    }
    
    //MARK: -Helpers
    
    func configureUI() {
        view.addSubview(onboardingView)
        onboardingView.fillSuperview()
    }
    
    func configureOnboardingDataSource() {
        let item1 = OnboardingItemInfo(informationImage: (UIImage(named: "baseline_insert_chart_white_48pt")?.withRenderingMode(.alwaysOriginal))!, title: "Metrics", description: "Some description here..", pageIcon: UIImage(), color: .systemPurple, titleColor: .white, descriptionColor: .white, titleFont: UIFont.boldSystemFont(ofSize: 24), descriptionFont: UIFont.systemFont(ofSize: 16))
        
        onboardingItems.append(item1)
        onboardingItems.append(item1)
        onboardingItems.append(item1)
        
        onboardingView.dataSource = self
        onboardingView.reloadInputViews()
    }
    
}

extension OnboardingContoller: PaperOnboardingDataSource {
    //tableView 혹은 CollectionView와 같이 똑같은 컨셉
    func onboardingItemsCount() -> Int {
        return onboardingItems.count
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return onboardingItems[index]
    }
}
