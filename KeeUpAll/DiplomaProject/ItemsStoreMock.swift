//
//  CameraVIew.swift
//  SwiftUIStarterKitApp
//
//  Created by Адиль Бектурсунов on 15.04.2023.
//  Copyright © 2023 NexThings. All rights reserved.
//

import SwiftUI

class ActivitiesMockStore {
    
    static let activities: [ActivitiesItem] = [
        ActivitiesItem(id: 0, activityName: "T-SHIRTS", activityNameLabel: "T-SHIRTS", activityImage: "CLOTHING", selectedActivity: false),
        ActivitiesItem(id: 1, activityName: "PANTS", activityNameLabel: "PANTS", activityImage: "SHOES", selectedActivity: false),
//        ActivitiesItem(id: 2, activityName: "ACCESSORIES", activityNameLabel: "ACCESSORIES", activityImage: "ACCESSORIES", selectedActivity: false)

    ]
    
    static let activityData: [ActivitiesData] = [
        
        ActivitiesData(id: 0, activitiesPlaces:
            [ActivitiesPlaces(id: 0, activityPlace: "BRAND NEW", activityPlaceImage: "c1", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Tamarindo", pointImage: "c4", pointDescription: "TRY NOW"),
                                                                                                                       
            ActivitiesFamousPoints(id: 1, pointName: "Jaco", pointImage: "c5", pointDescription: "TRY NOW"),
            
            ActivitiesFamousPoints(id: 2, pointName: "Dominical", pointImage: "c6", pointDescription: "TRY NOW")
            ]),
             
             ActivitiesPlaces(id: 1, activityPlace: "BRAND NEW", activityPlaceImage: "c2", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "mkc", pointImage: "polo3", pointDescription: "Kuta"),
             
                 ActivitiesFamousPoints(id: 1, pointName: "Jimbaran", pointImage: "tommy2", pointDescription: "Jimbaran.")
             ]),
             
             ActivitiesPlaces(id: 2, activityPlace: "BRAND NEW", activityPlaceImage: "c3", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Muizenberg", pointImage: "tommy3", pointDescription: "TRY NOW"),
                 
                  ActivitiesFamousPoints(id: 1, pointName: "Long Beach", pointImage: "ax2", pointDescription: "TRY NOW")
             ])],
                      
            activityResources:
        
            [ActivityResource(id: 0, resourceName: "Tommy Hilfiger",
                              resourceDescription: "Explore, Fashion",
                              resources:
                [ActivityResourcesItem(
                    id: 0,
                    resourceName: "T-Shirt",
                    resourceImage: "kbtu",
                    resourceDescription: "Introducing our stylish and comfortable T-shirt, the epitome of casual fashion with a touch of modern flair. Crafted with utmost care and attention to detail, this T-shirt seamlessly blends contemporary design and superior comfort to create a wardrobe essential that will leave you feeling confident and effortlessly cool.",
                    resourseModel: "character/tshirt-kbtu.usdz"
                ),
                 ActivityResourcesItem(id: 1, resourceName: "T-Shirt", resourceImage: "tommy2", resourceDescription: "Article"),
                 ActivityResourcesItem(id: 2, resourceName: "T-Shirt", resourceImage: "tommy3", resourceDescription: "Tutorial")]),
                
                ActivityResource(id: 1, resourceName: "Armani Exchange", resourceDescription: "Find your dream gear", resources: [ActivityResourcesItem(id: 1, resourceName: "Boards", resourceImage: "ax1", resourceDescription: ""),
                     ActivityResourcesItem(id: 2, resourceName: "Boardshorts", resourceImage: "ax2", resourceDescription: ""),
                     ActivityResourcesItem(id: 3, resourceName: "Surfboard Bags", resourceImage: "ax3", resourceDescription: "")]),
                
//                ActivityResource(id: 2, resourceName: "Polo Ralph Lauren", resourceDescription: "On the luxe side", resources: [ActivityResourcesItem(id: 1, resourceName: "Surf Core Training", resourceImage: "polo1", resourceDescription: "Video"),
//                     ActivityResourcesItem(id: 2, resourceName: "Sri Lanka Surf Camp", resourceImage: "polo2", resourceDescription: "Camp"),
//                     ActivityResourcesItem(id: 3, resourceName: "Surf Photography Training", resourceImage: "polo3", resourceDescription: "Photography")])
                ]),
       
        ActivitiesData(id: 1, activitiesPlaces: [
        
            ActivitiesPlaces(id: 1, activityPlace: "Snowbird", activityPlaceImage: "polo1", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Snowbird", pointImage: "polo1", pointDescription: "Just")]),
            ActivitiesPlaces(id: 2, activityPlace: "Cervinia", activityPlaceImage: "ax2", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Cervinia", pointImage: "ax2", pointDescription: "B")]),
            ActivitiesPlaces(id: 3, activityPlace: "Chamonix", activityPlaceImage: "ax3", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Chamonix", pointImage: "ax3", pointDescription: "")])],
                      
                      
            activityResources:
       
           [ActivityResource(id: 0, resourceName: "Lifestyle", resourceDescription: "Explore, Fashion, Food, music, art, photography, travel and more!", resources:
               [ActivityResourcesItem(id: 0, resourceName: "Peace in Mountains", resourceImage: "ax1", resourceDescription: "Article"),
                ActivityResourcesItem(id: 1, resourceName: "Travel for a living", resourceImage: "polo3", resourceDescription: "Article"),
                ActivityResourcesItem(id: 2, resourceName: "Mountain top drinks", resourceImage: "c1", resourceDescription: "Guide")]),
               
               ActivityResource(id: 1, resourceName: "Equipment", resourceDescription: "Find your dream gear", resources: [ActivityResourcesItem(id: 1, resourceName: "Boards", resourceImage: "c2", resourceDescription: ""),
                    ActivityResourcesItem(id: 2, resourceName: "Goggles", resourceImage: "goggles", resourceDescription: ""),
                    ActivityResourcesItem(id: 3, resourceName: "Snowboarding boots", resourceImage: "c3", resourceDescription: "")]),
               
//               ActivityResource(id: 2, resourceName: "Training", resourceDescription: "Best Snowboarding training resources", resources: [ActivityResourcesItem(id: 1, resourceName: "Snowboard Training", resourceImage: "c4", resourceDescription: "Video"),
//                    ActivityResourcesItem(id: 2, resourceName: "Snowboard Resorts Training", resourceImage: "c5", resourceDescription: "Camp"),
//                    ActivityResourcesItem(id: 3, resourceName: "Snowboarding Photography", resourceImage: "c6", resourceDescription: "Photography")])
               ]),
       
       
//        ActivitiesData(id: 2, activitiesPlaces: [
//
//            ActivitiesPlaces(id: 1, activityPlace: "Torres del Paine", activityPlaceImage: "ax1", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "The Fauna Trail", pointImage: "ax1", pointDescription: ""),
//
//                ActivitiesFamousPoints(id: 1, pointName: "Laguna Azul", pointImage: "c3", pointDescription: "aguna")
//            ]),
//
//            ActivitiesPlaces(id: 2, activityPlace: "Peru", activityPlaceImage: "c6", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Inca Trail", pointImage: "c6", pointDescription: "One thing"),
//
//                ActivitiesFamousPoints(id: 1, pointName: "Santa Cruz Trek", pointImage: "polo1", pointDescription: "The Santa Cruz")
//
//            ]),
//            ActivitiesPlaces(id: 3, activityPlace: "Grand Canyon", activityPlaceImage: "ax2", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "South Rim Trail", pointImage: "ax2", pointDescription: "Stops"),
//
//                ActivitiesFamousPoints(id: 1, pointName: "Bright Angel Trail", pointImage: "polo2", pointDescription: " Colorado River.")
//
//            ])],
//
//
//            activityResources:
//
//           [ActivityResource(id: 0, resourceName: "Lifestyle", resourceDescription: "Explore, Fashion, Food, music, art, photography, travel and more!", resources:
//               [ActivityResourcesItem(id: 0, resourceName: "Clearing your thoughts", resourceImage: "c1", resourceDescription: "Article"),
//                ActivityResourcesItem(id: 1, resourceName: "Hiking and physical benefits", resourceImage: "c2", resourceDescription: "Article"),
//                ActivityResourcesItem(id: 2, resourceName: "Hikers Parties", resourceImage: "c3", resourceDescription: "Fun")]),
//
//               ActivityResource(id: 1, resourceName: "Equipment", resourceDescription: "Find your dream gear", resources: [ActivityResourcesItem(id: 1, resourceName: "Footwear", resourceImage: "SHOES", resourceDescription: ""),
//                    ActivityResourcesItem(id: 2, resourceName: "Camping Equipment", resourceImage: "c3", resourceDescription: ""),
//                    ActivityResourcesItem(id: 3, resourceName: "Hiking bags", resourceImage: "c4", resourceDescription: "")]),
//
//               ActivityResource(id: 2, resourceName: "Photography", resourceDescription: "Best landscape photography resources", resources: [ActivityResourcesItem(id: 1, resourceName: "Camera equipment", resourceImage: "ax3", resourceDescription: "Video"),
//                    ActivityResourcesItem(id: 2, resourceName: "Long exposure photography", resourceImage: "polo1", resourceDescription: "Tutorial"),
//                    ActivityResourcesItem(id: 3, resourceName: "Tips for best photography", resourceImage: "tommy1", resourceDescription: "Photography")])
//               ])
       
    ]
}

