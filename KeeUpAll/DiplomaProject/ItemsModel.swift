//
//  ItemsModel.swift
//  DiplomaProject
//
//  Created by РАЙЫМБЕК on 28.05.2023.
//

import Foundation

struct ActivitiesItem {
    var id: Int
    var activityName: String
    var activityNameLabel: String
    var activityImage: String
    var selectedActivity: Bool
}

struct ActivitiesPlaces {
    var id: Int
    var activityPlace: String
    var activityPlaceImage: String
    var famousPointsArray: [ActivitiesFamousPoints]
    
}

struct ActivityResource {
    var id: Int
    var resourceName: String
    var resourceDescription: String
    var resources : [ActivityResourcesItem]
}

struct ActivityResourcesItem {
    var id: Int
    var resourceName: String
    var resourceImage: String
    var resourceDescription: String
    var resourseModel: String = "character/shirt_norm.usdz"
}

struct ActivitiesData {
    var id: Int
    var activitiesPlaces: [ActivitiesPlaces]
    var activityResources: [ActivityResource]
}

struct ActivitiesFamousPoints {
    var id: Int
    var pointName: String
    var pointImage: String
    var pointDescription: String
}

struct ClothType {
    var id: String
    var name: String
}
