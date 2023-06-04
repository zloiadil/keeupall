import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color(red: 0/255, green: 32/255, blue: 95/255),
                        Color(red: 132/255, green: 53/255, blue: 142/255)
                    ]
                ),
                startPoint: .leading,
                endPoint: .trailing
            )
            .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Image("logo_2-removebg-preview")
                        .resizable()
                        .frame(width: 100, height: 100)
//                    Image("logo1")
//                        .resizable()
                        
                    
                    Text("KeeUpAll")
//                        .foregroundColor(Color(hex: 0x3A36F1))
                        .foregroundColor(.white)
                        .font(.system(size: 36, weight: .bold))
                    Spacer()
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
                
                ActivitiesContentView(activtiesData: Activities(data: ActivitiesMockStore.activityData, items: ActivitiesMockStore.activities))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIColor {
    convenience init(hex: String) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

extension View {
    // get rectangle
    func getRect() -> CGRect{
        // CGRect contains locations and dimensions of a rectangle
        return UIScreen.main.bounds
    }
}

