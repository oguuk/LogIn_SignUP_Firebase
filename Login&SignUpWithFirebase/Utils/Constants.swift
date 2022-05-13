//
//  Constants.swift
//  Login&SignUpWithFirebase
//
//  Created by 오국원 on 2022/05/13.
//
// placeholder 용
// code를 클린하게 하기 위해 만듦
import Foundation
import Firebase

let MSG_METRICS = "Metrics"
let MSG_DASHBOARD = "Dashboard"
let MSG_NOTIFICATIONS = "Get Notified"
let MSG_ONBOARDING_METRICS = "Extract valuable insights and come up with data driven product initiatives to help grow your buisness"
let MSG_ONBOARDING_NOTIFICATIONS = "Get notified when important stuff is happening, so you don't miss out on the action"
let MSG_ONBOARDING_DASHBOARD = "Everything you need all in one place, available through our dashboard feature"

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
