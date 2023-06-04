import SwiftUI
import SceneKit

let customFont = "Raleway-Regular"

struct ItemDetailPage: View {
    @StateObject var arViewModel: ARViewModel = ARViewModel()
    @Binding var isShowingDetail: Bool
    @Binding var product: ActivityResourcesItem?
    @State var isShowingCamera: Bool = false
    var animation: Namespace.ID
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                isShowingDetail = false
                            }
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                                .foregroundColor(Color.black.opacity(0.7))
                        }
                        Spacer()
                    }
                    .padding()
                    
                    SceneView(scene: {
                        let scene = SCNScene(named: product!.resourseModel)!
                        scene.background.contents = UIColor(Color("HomeBG"))
                        return scene
                    }(), options: [.autoenablesDefaultLighting, .allowsCameraControl])
                }
                .frame(height: getRect().height / 2.7)
                .zIndex(1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(product!.resourceName)
                            .font(.custom(customFont, size: 20).bold())
                        
                        Text(product!.resourceDescription)
                            .font(.custom(customFont, size: 15))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Button(action: {
                            // Handle button action
                        }) {
                            Text("Go to product site")
                                .font(.custom(customFont, size: 20).bold())
                                .foregroundColor(.purple)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.purple, lineWidth: 3)
                                )
                        }
                        
                        NavigationLink(destination: ARViewContainer(arViewModel: arViewModel, product: $product), isActive: $isShowingCamera) {
                            Text("Try-On")
                                .font(.custom(customFont, size: 20).bold())
                                .foregroundColor(.white)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity)
                                .background(Color.purple)
                                .cornerRadius(15)
                        }
                    }
                    .padding([.horizontal, .bottom], 20)
                    .padding(.top, 25)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color.white
                        .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                        .ignoresSafeArea()
                )
                .zIndex(0)
            }
            .background(Color("HomeBG").ignoresSafeArea())
            .navigationBarHidden(true)
        }
    }
}

struct CustomCorners: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
