//
//  CameraVIew.swift
//  SwiftUIStarterKitApp
//
//  Created by Адиль Бектурсунов on 15.04.2023.
//  Copyright © 2023 NexThings. All rights reserved.
//

import SwiftUI
import Combine

class Activities: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    var activitiesCollection : [ActivitiesData] {
        willSet {
            objectWillChange.send()
        }
    }
    
    var activities: [ActivitiesItem] {
        willSet {
            objectWillChange.send()
        }
    }
    
    init(data: [ActivitiesData], items: [ActivitiesItem] ) {
        self.activitiesCollection = data
        self.activities = items
    }
}

class ActivitySelected: ObservableObject {
    @Published var index: Int = 0
}

struct ActivitiesContentView: View {
    //    @EnvironmentObject var settings: UserSettings
    
    @ObservedObject var activtiesData : Activities
    @ObservedObject var selectedActivity = ActivitySelected()
    @State var isShowing: Bool = false
    @State var placeItemSelected: ActivitiesPlaces? = nil
    
    @State var isShowingDetail: Bool = false
    @State var selectedProduct: ActivityResourcesItem? = nil
    
    @Namespace var animation
    
    var body: some View {
        GeometryReader { g in
            ScrollView{
                VStack(alignment: .leading) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack (spacing: 10){
                            ForEach(self.activtiesData.activities, id: \.id) { item in
                                ShopPromotionBannerView(activtiesItems: item, selectedActivity: self.selectedActivity)
                                    .frame(width: 130, height: 50)
                            }
                        }.padding(.leading, 20)
                            .padding(.trailing, 30)
                            .padding(.bottom, 10)
                    }
                    
//                    Text("\(self.activtiesData.activities[self.selectedActivity.index].activityNameLabel) Regions")
//                        .font(.system(size: 20))
//                        .padding(.leading, 30)
//                        .padding(.top, 10)
                    
                    //                    ScrollView(.horizontal, showsIndicators: false) {
                    //                        HStack (spacing: 10) {
                    //                            ForEach(self.activtiesData.activitiesCollection[self.selectedActivity.index].activitiesPlaces, id: \.id) { item in
                    //                                Button(action: {
                    //                                    self.placeItemSelected = item
                    //                                    self.isShowing = true
                    //                                }) {
                    //                                    ShopBestSellerViews(activityPlaces: item)
                    //                                        .frame(width: 155, height: 225)
                    //                                }
                    //                            }
                    //
                    //                        }.padding(.leading, 30)
                    //                            .padding(.trailing, 30)
                    //                            .padding(.bottom, 10)
                    //
                    //                    }
                    
                    VStack (spacing: 25) {
                        ForEach(self.activtiesData.activitiesCollection[self.selectedActivity.index].activityResources, id: \.id) { item in
                            ShopNewProductViews(
                                activityResources: item,
                                isShowingDetail: self.$isShowingDetail,
                                selectedProduct: self.$selectedProduct
                            ).frame(width: g.size.width, height: g.size.width)
                        }
                    }.padding(.leading, 20)
                    
                    
                }
//                .navigationBarTitle("Activities")
                //                    .navigationBarItems(trailing:
                //                    Button(action: {
                //                        self.settings.loggedIn = false
                //                    }) {
                //                        Text("Log Out")
                //                    })
            }
            .fullScreenCover(isPresented: $isShowingDetail, content: {
                ItemDetailPage(isShowingDetail: self.$isShowingDetail, product: self.$selectedProduct, animation: animation)
            })
            //                        .sheet(isPresented: self.$isShowing) { PlaceDetailView(isShowing: self.$isShowing, placeItem: self.$placeItemSelected)}
        }
    }
}

struct ShopBestSellerViews: View {
    
    var activityPlaces: ActivitiesPlaces
    
    var body: some View {
        ZStack{
            Image("\(activityPlaces.activityPlaceImage)").renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 225)
                .background(Color.black)
                .cornerRadius(10)
                .opacity(0.8)
                .aspectRatio(contentMode: .fill)
            
            VStack (alignment: .leading) {
                Spacer()
                
                Text(activityPlaces.activityPlace)
                    .foregroundColor(Color.white) // был белый фон
                    .font(.system(size: 20, weight: .bold, design: Font.Design.default))
                    .padding(.bottom, 24)
            }
            
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
        
    }
}

struct ShopPromotionBannerView: View {
    var activtiesItems: ActivitiesItem
    @ObservedObject var selectedActivity: ActivitySelected
    
    var isSelected: Bool {
        return self.selectedActivity.index == self.activtiesItems.id
    }
    
    var body: some View {
        
        Button(action: {
            self.selectedActivity.index = self.activtiesItems.id
            
        }) {
            GeometryReader { g in
                ZStack {
                    // Rest of your content
                    
                    if (self.selectedActivity.index == self.activtiesItems.id) {
                        Text(self.activtiesItems.activityName)
                            .font(.system(size: 18, weight: .bold, design: Font.Design.default))
                            .foregroundColor(Color.white)
                    } else {
                        Text(self.activtiesItems.activityName)
                            .font(.system(size: 18, weight: .bold, design: Font.Design.default))
                            .foregroundColor(Color.white)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                .background(
                    RadialGradient(
                        gradient: Gradient(
                            colors: [
                                Color(red: 37/255, green: 145/255, blue: 251/255, opacity: 0.98),
                                Color(red: 0/255, green: 7/255, blue: 128/255, opacity: 1)
                            ]
                        ),
                        center: UnitPoint(x: 0.1, y: 0.2),
                        startRadius: 0,
                        endRadius: g.size.width * 0.4 // Adjust the value as desired
                    ).opacity(self.isSelected ? 1 : 0),
                    alignment: .center
                )
                .background(
                    RadialGradient(
                        gradient: Gradient(
                            colors: [
                                Color(red: 173/255, green: 0/255, blue: 171/255),
                                                Color(red: 15/255, green: 51/255, blue: 92/255)
                            ]
                        ),
                        center: UnitPoint(x: 0.086, y: 0.279),
                        startRadius: 0,
                        endRadius: 311
                    ).opacity(self.isSelected ? 0 : 1),
                    alignment: .center
                )
                .cornerRadius(15)
            }

//            GeometryReader { g in
//                ZStack{
//                    //                    Image("\(self.activtiesItems.activityImage)").renderingMode(.original)
//                    //                       .resizable()
//                    //                       .opacity(0.8)
//                    //                       .aspectRatio(contentMode: .fill)
//                    //                       .background(Color.black)
//
//
//                    if (self.selectedActivity.index == self.activtiesItems.id) {
//                        Text(self.activtiesItems.activityName)
//                            .font(.system(size: 18, weight: .bold, design: Font.Design.default))
//                            .foregroundColor(Color.white)
//                    } else {
//                        Text(self.activtiesItems.activityName)
//                            .font(.system(size: 18, weight: .bold, design: Font.Design.default))
//                            .foregroundColor(Color.white)
//                    }
//
//                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
//                    .background(self.isSelected ? Color(hex: 0x3A36F1) : Color(hex: 0xA6A5DF))
//                    .cornerRadius(15)
//            }
        }
    }
}


struct ShopNewProductViews: View {
    var activityResources: ActivityResource
    @Binding var isShowingDetail: Bool
    @Binding var selectedProduct: ActivityResourcesItem?
    
    var body: some View {
        GeometryReader { g in
            ZStack {
                VStack (alignment: .leading){
                    Text(self.activityResources.resourceName)
                        .padding(.top, 10)
                        .padding(.leading, 15)
                        .font(.system(size: 20, weight: .bold, design: Font.Design.default))
                    //                        .foregroundColor(Color("Purple"))
                        .foregroundColor(.white)
// 0.65 0.55 0.80
                    //                    Text(self.activityResources.resourceDescription)
                    //                        .padding(.leading, 18)
                    //                        .padding(.trailing, 18)
                    //                        .font(.system(size: 14))
                    //                        .foregroundColor(Color.black)
                    
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack (spacing: 15) {
                            
                            ForEach(self.activityResources.resources, id: \.id) { item in
                                ActivityResourceItems(resourceItems: item)
                                    .frame(width: 200, height: 300)
                                    .onTapGesture {
                                        isShowingDetail = true
                                        selectedProduct = item
                                    }
                            }
                            
                        }.padding(.leading, 15)
                            .padding(.bottom, 15)
                            .padding(.top, 10)
                    }
                    
                    //                    Spacer()
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//                .background(Color("HomeBG"))
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                Color(red: 0/255, green: 32/255, blue: 95/255),
                                Color(red: 132/255, green: 53/255, blue: 142/255)
                            ]
                        ),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            //                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                .cornerRadius(10)
            
        }
    }
}

struct ActivityResourceItems: View {
    var resourceItems: ActivityResourcesItem
    //    @ObservedObject var arViewModel : ARViewModel
//    @State var isShowing: Bool = true
//    @State var placeItemSelected: ActivitiesPlaces?  = Activities(data: ActivitiesMockStore.activityData, items: ActivitiesMockStore.activities)
//        .activitiesCollection[0].activitiesPlaces[0]
    
    var body: some View {
        GeometryReader { g in
            ZStack{
                Image("\(self.resourceItems.resourceImage)")
                    .resizable()
                    .opacity(0.8)
                    .aspectRatio(contentMode: .fill)
                    .background(Color.black)
                VStack(alignment: .center) {
                    
                    Text(self.resourceItems.resourceName)
                        .font(.system(size: 16, weight: .bold, design: Font.Design.default))
                        .frame(width: 150)
                        .foregroundColor(Color.white)  // цвет надписи на вещах
                        .multilineTextAlignment(.center)
                }
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .cornerRadius(10)
        }
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
