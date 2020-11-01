import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView : View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: CanvasViewControllerWrapper().edgesIgnoringSafeArea(.all)) {
                    AwesomeText(title: "Canvas View Original")

                }
                Spacer().frame(minHeight: 0, maxHeight: 20)
                NavigationLink(destination: CanvasViewWrapper().edgesIgnoringSafeArea(.all)) {
                    AwesomeText(title: "Canvas View Wrapper")
                }
            }
        }
    }
}

struct AwesomeText : View {
    
    private let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
        .frame(minWidth: 0, maxWidth: 300)
        .padding()
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(40)
        .font(.title)
    }
}

struct CanvasViewWrapper : UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return CanvasView()
    }
        func updateUIView(_ uiView: UIView, context: Context) {
        uiView.backgroundColor = .white
    }
}

struct CanvasViewControllerWrapper : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CanvasViewController {
        CanvasViewController()
    }
    
    func updateUIViewController(_ uiViewController: CanvasViewController, context: Context) {
    }
    
    typealias UIViewControllerType = CanvasViewController
}
