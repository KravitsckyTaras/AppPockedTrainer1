import SwiftUI
import AVKit
import WebKit


// Пример данных для кнопок слайдера
let Corebuttons = [
    SliderButton(
        title: "Скручування.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "43", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  .",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Скручування на римському стільці.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "44", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  .",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Скручування на лаві з нахилом вниз.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "45", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.3, 0],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  Прямая мышца бедра.",  ""]
        ,progressColors: [.red, .red, .green, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Скручування на колінах у блоці.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "46", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  .",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Зворотні скручування.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "47", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  .",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Підйом колін висячи.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "48", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.3],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  Прямий м'яз стегна.",  "Стегна квадрицепс : Гребінчаста."]
        ,progressColors: [.red, .red, .orange, .green,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Підйом ніг у висі",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "49", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.3],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  Прямий м'яз стегна.",  "Стегна квадрицепс : Гребінчаста."]
        ,progressColors: [.red, .red, .orange, .green,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Косі скручування.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "50", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  .",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),




]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Core: View {
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
                                ForEach(Corebuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Corebuttons[index])) {
                                        SliderButtonView(button: Corebuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
struct FMuscleCore_Previews: PreviewProvider {
    static var previews: some View {
        Core()
    }
}
