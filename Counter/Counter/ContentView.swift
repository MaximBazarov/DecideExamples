import SwiftUI
import Decide

final class Counter: StateRoot {
    @ObservableValue
    var count: Int = 0
}

struct UpdateCounter: ValueDecision {
    let newValue: Int

    func mutate(_ env: DecisionEnvironment) {
        env[\Counter.$count] = newValue
    }
}

struct ContentView: View {

    @SwiftUIBind(\Counter.$count, mutate: UpdateCounter.self) var count

    var body: some View {
        Self._printChanges()
        return VStack {
            VStack {
                Text("UIKit: ")
                UIKitCounterView()
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.blue.opacity(0.3))
            )
            .frame(height: 64)
            .padding()

            Text("\(count)").font(.headline)
            HStack {
                VStack {
                    HStack {
                        Button("decrease") {
                            count -= 1
                        }
                        Button("increase") {
                            count += 1
                        }
                    }
                }.padding()
            }
            Spacer()
            UnrelatedView()
        }
    }
}

struct UnrelatedView: View {

    var body: some View {
        Self._printChanges()
        return VStack {
            Text("This View Updates Only Once.")
        }
    }
}

#Preview {
    ContentView()
}
