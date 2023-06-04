//
//  ItemsStoreFirebase.swift
//  DiplomaProject
//
//  Created by РАЙЫМБЕК on 29.05.2023.
//

//import SwiftUI
//import FirebaseCore
//import FirebaseStorage
//import FirebaseFirestore
//
//class ItemsStore: ObservableObject {
////    private let store = Storage.storage()
//    private let db = Firestore.firestore()
//
//    @Published var clothTypes = [ClothType]()
//
//    func getClothTypes() {
//        db.collection("cloth_typse").getDocuments { snapshot, error in
//            if error == nil {
//                if let snapshot = snapshot {
//                    DispatchQueue.main.async {
//                        self.clothTypes = snapshot.documents.map {d in
//                            return ClothType(id: d.documentID, name: d["type"] as? String ?? "")
//                        }
//                    }
//                }
//            } else {
//
//            }
//
//        }
//    }
//}
