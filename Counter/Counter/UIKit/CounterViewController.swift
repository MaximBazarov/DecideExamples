import Decide
import UIKit

class CounterViewController: UIViewController, EnvironmentObservingObject {
    @Bind(\Counter.$count) var count
    var environment: Decide.SharedEnvironment = .default
    lazy var onChange: () -> Void = {
        print("UIKitCounter onChange \(self.count)")
        self.label.text = "\(self.count)"
    }
    lazy var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.widthAnchor.constraint(equalTo: view.widthAnchor),
            label.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
}

