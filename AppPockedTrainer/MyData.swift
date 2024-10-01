import SwiftUI

// ImagePicker для выбора изображения из галереи
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

// Экран Muscles
struct MyData: View {
    @State private var inputText1: String = ""
    @State private var inputText2: String = ""
    @State private var inputText3: String = ""
    @State private var inputText4: String = ""
    @State private var inputText5: String = ""
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage? = nil
    @State private var savedImage: UIImage? = nil

    var body: some View {
        ZStack {
            Image("listBumagy")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {

               

                VStack(spacing: 10) {
                    TextField("Ваша вага:", text: $inputText1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("Об'єм біцепсу:", text: $inputText2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("об'єм грудних:", text: $inputText3)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("Об'єм талії:", text: $inputText4)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("Об'єм стегна:", text: $inputText5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
                .padding(.top, 20)

                GeometryReader { geometry in
                    HStack(spacing: 5) {
                        VStack {
                            Text("Старе зображення:")
                                .padding(.top, 50)
                                .font(.headline)
                                .bold()
                            if let image = savedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width / 2, height: 300)
                                    .clipped()
                            } else {
                                Text("Изображение \nотсутствует")
                                    .frame(width: geometry.size.width / 2, height: 300)
                                    .background(Color.gray.opacity(0.3))
                            }
                        }
                        
                        VStack {
                            Text("Нове зображення:")
                                .padding(.top, 50)
                                .font(.headline)
                                .bold()
                                
                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width / 2, height: 300)
                                    .clipped()
                            } else {
                                Text("Изображение \nотсутствует")
                                    .frame(width: geometry.size.width / 2, height: 300)
                                    .background(Color.gray.opacity(0.2))
                            }
                        }
                    }
                    .frame(height: 260)
                }
                .padding(.top, 20)

                Spacer()

                Button(action: {
                    showImagePicker.toggle()
                }) {
                    Text("Выбрать изображение")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .opacity(0.8)
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "house")
                                .foregroundColor(.black)
                        }
                        
                        NavigationLink(destination: Muscules()) {
                            Image(systemName: "figure")
                                .foregroundColor(.black)
                        }
                        
                        NavigationLink(destination: ScrolWeuve()) {
                            Image(systemName: "book")
                                .foregroundColor(.black)
                        }

                        Button(action: {
                            saveData()
                        }) {
                            Image(systemName: "square.and.arrow.down")
                                .rotationEffect(.degrees(180))
                                .font(.headline)
                                .foregroundColor(.black)
                                .offset(y: 3)
                        }
                        
                        Button(action: {
                            loadData()
                        }) {
                            Image(systemName: "arrow.down.circle")
                                .foregroundColor(.black)
                        }
                        
                        Button(action: {
                            deleteData()
                        }) {
                            Image(systemName: "trash.circle")
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                    }
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage)
        }
    }

    private func saveData() {
        UserDefaults.standard.set(inputText1, forKey: "inputText1")
        UserDefaults.standard.set(inputText2, forKey: "inputText2")
        UserDefaults.standard.set(inputText3, forKey: "inputText3")
        UserDefaults.standard.set(inputText4, forKey: "inputText4")
        UserDefaults.standard.set(inputText5, forKey: "inputText5")

        if let image = selectedImage, let imageData = image.jpegData(compressionQuality: 0.8) {
            UserDefaults.standard.set(imageData, forKey: "selectedImage")
        }
    }

    private func loadData() {
        inputText1 = UserDefaults.standard.string(forKey: "inputText1") ?? ""
        inputText2 = UserDefaults.standard.string(forKey: "inputText2") ?? ""
        inputText3 = UserDefaults.standard.string(forKey: "inputText3") ?? ""
        inputText4 = UserDefaults.standard.string(forKey: "inputText4") ?? ""
        inputText5 = UserDefaults.standard.string(forKey: "inputText5") ?? ""

        if let imageData = UserDefaults.standard.data(forKey: "selectedImage"), let image = UIImage(data: imageData) {
            savedImage = image
        }
    }
    
    private func deleteData() {
        UserDefaults.standard.removeObject(forKey: "inputText1")
        UserDefaults.standard.removeObject(forKey: "inputText2")
        UserDefaults.standard.removeObject(forKey: "inputText3")
        UserDefaults.standard.removeObject(forKey: "inputText4")
        UserDefaults.standard.removeObject(forKey: "inputText5")
        UserDefaults.standard.removeObject(forKey: "selectedImage")

        inputText1 = ""
        inputText2 = ""
        inputText3 = ""
        inputText4 = ""
        inputText5 = ""
        savedImage = nil
    }
    
    private func exportData() {
        // Gather data to export (you can customize this part)
        let dataToExport = """
        Ваша вага: \(inputText1)
        Об'єм біцепсу: \(inputText2)
        Об'єм грудних: \(inputText3)
        Об'єм талії: \(inputText4)
        Об'єм стегна: \(inputText5)
        """

        // Here, you can save `dataToExport` to a file or share it using a ShareSheet.
        // For example, saving to a file could be done like this:
        
        let filename = getDocumentsDirectory().appendingPathComponent("data.txt")

        do {
            try dataToExport.write(to: filename, atomically: true, encoding: .utf8)
            // Optionally, you could present a share sheet here to share the file
        } catch {
            print("Failed to write file: \(error.localizedDescription)")
        }
    }

    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct MyData_Previews: PreviewProvider {
    static var previews: some View {
        MyData()
    }
}
