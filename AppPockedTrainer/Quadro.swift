import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let Quadrobuttons = [
    SliderButton(
        title: "Присідання.",
        description: "Опис кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "62", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Спина .",  "Стегна біцепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Присідання у Сміті.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "63", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Стегна біцепс",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Фронтальні присідання у Сміті.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "64", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Стегна біцепс",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Гак-присідання.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "65", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Спина .",  "Стегна біцепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Виподи зі штангою.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "67", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Спина .",  "Стегна біцепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Підйом на платформу.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "68", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Стегна біцепс",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Згинання запьястка.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "69", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Стегна квадрицепс: Широка медіальна.", "  Стегна квадрицепс: Широка латеральна.", "  Стегна квадрицепс: Прямий м'яз стегна.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    
    SliderButton(
        title: "Ривок штанги на груди.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "70", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Плечі.", "  Сідниці.", "  Стегна квадрицепс.",  "  Стегна біцепс"]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    
    




]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Quadro: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image("listBumagy")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(Quadrobuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Quadrobuttons[index])) {
                                        SliderButtonView(button: Quadrobuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»
    }
}

// Провайдер предварительного просмотра для SwiftUI.
struct QuadroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Quadro()
    }
}
