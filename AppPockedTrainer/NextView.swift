import SwiftUI

// Модель даних для изображений
struct ImageData: Identifiable {
    let id = UUID()
    let name: String
    let description: String
}

struct NextView: View {
    var imageName: String
    let images = [
        ImageData(name: "1", description: "Описание для изображения 1"),
        ImageData(name: "2", description: "Описание для изображения 2"),
        ImageData(name: "3", description: "Описание для изображения 3"),
        ImageData(name: "4", description: "Описание для изображения 4"),
        ImageData(name: "5", description: "Описание для изображения 5"),
        ImageData(name: "6", description: "Описание для изображения 6")
    ]
    
    var body: some View {
        ZStack {
            
                // Для інших вікон
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }


struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NextView(imageName: "Arny2")
                .previewDisplayName("Arny2 Preview")
            
            NextView(imageName: "KayG")
                .previewDisplayName("KayG Preview")
            
            NextView(imageName: "Kevin")
                .previewDisplayName("Kevin")
            
            NextView(imageName: "Khris")
                .previewDisplayName("Khris")
            
            NextView(imageName: "Ohern")
                .previewDisplayName("Ohern")
        }
    }
}
