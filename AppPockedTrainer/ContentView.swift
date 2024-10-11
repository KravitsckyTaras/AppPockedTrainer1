import SwiftUI

// Структура данных для кнопок
struct ButtonData {
    let imageName: String
    let size: CGFloat
}

// Обновленный список данных для кнопок
let buttonData = [
    ButtonData(imageName: "Arny2", size: 450),
    ButtonData(imageName: "KayG", size: 450),
    ButtonData(imageName: "Kevin", size: 450),
    ButtonData(imageName: "Khris", size: 450),
    ButtonData(imageName: "Ohern", size: 450)
]

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showContactTrainer = false // Состояние для управления показом окна

    var body: some View {
        NavigationView {
            ZStack {
                // Фоновое изображение
                Image("listBumagy") // Замените "listBumagy" на имя вашего изображения
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all) // Изображение будет занимать весь экран
                
                VStack {
                    // Три кнопки с пользовательскими изображениями вверху
                    HStack {
                        // Первая кнопка с переходом на MusclesView
                        VStack {
                            NavigationLink(destination: Muscules()) {
                                Image("worckaut")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding()
                                    .background(Color.black.opacity(0.4)) // Цвет фона с прозрачностью
                                    .cornerRadius(10) // Скругление углов фона
                            }
                            Text("Вправи.") // Добавьте текст под кнопкой
                                .padding(1)
                                .background(Color.black.opacity(0.2))
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .cornerRadius(4)
                                .padding(5)
                        }
                        
                        // Вторая кнопка с переходом на BicepsView
                        VStack {
                            NavigationLink(destination: MyData()) {
                                Image("biceps")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding()
                                    .background(Color.black.opacity(0.4)) // Цвет фона с прозрачностью
                                    .cornerRadius(10) // Скругление углов фона
                            }
                            Text("Заміри.") // Добавьте текст под кнопкой
                                .padding(1)
                                .background(Color.black.opacity(0.2))
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .cornerRadius(4)
                                .padding(5)
                        }

                        // Третья кнопка с переходом на NotebookView
                        VStack {
                            NavigationLink(destination: ScrolWeuve()) {
                                Image("blaknot")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding()
                                    .background(Color.black.opacity(0.4)) // Цвет фона с прозрачностью
                                    .cornerRadius(10) // Скругление углов фона
                            }
                            Text("Тренування.") // Добавьте текст под кнопкой
                                .padding(1)
                                .background(Color.black.opacity(0.2))
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .cornerRadius(4)
                                .padding(5)
                        }
                    }
                    
                    ScrollViewReader { proxy in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) { // Пространство между кнопками
                                ForEach(buttonData.indices, id: \.self) { index in
                                    NavigationLink(destination: NextView(imageName: buttonData[index].imageName)) { // Переход на новое окно
                                        Image(buttonData[index].imageName) // Использование пользовательского изображения
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 350, height: buttonData[index].size) // Установка размера кнопок
                                            .padding(.horizontal, 5) // Отступы слева и справа для кнопок
                                            .background(Color.black.opacity(0.4)) // Опционально: фон для кнопки
                                            .cornerRadius(10) // Скругление углов
                                            .id(index) // Уникальный идентификатор для прокрутки
                                    }
                                }
                            }
                            .frame(height: 500) // Высота ScrollView
                            .padding(.horizontal) // Отступы по горизонтали для ScrollView
                        }
                        .frame(width: 390) // Ширина ScrollView
                    }

                    // Кнопка внизу экрана
                    Button(action: {
                        showContactTrainer.toggle() // Показать модальное окно
                    }) {
                        Text("Звязок з тренером")
                            .font(.system(size: 24))
                            .frame(width: 330)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                            .fontWeight(.bold)
                    }
                    .sheet(isPresented: $showContactTrainer) {
                        ByContactTrainer() // Окно с сообщением
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»
    }
}

// Новый вид для окна с текстовыми полями

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
