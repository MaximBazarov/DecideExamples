import SwiftUI
struct UIKitCounterView: UIViewControllerRepresentable {
    typealias UIViewControllerType = CounterViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        CounterViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        uiViewController.onChange()
    }
}
