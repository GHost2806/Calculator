//
//  ContentView.swift
//  Calculator
//
//  Created by Macbook Air on 14/09/23.
//

import SwiftUI

enum CalcButtons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case substrack = "-"
    case divide = "/"
    case multiply = "*"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var buttonColor: Color {
        switch self {
        case .add, .substrack, .multiply, .divide, .equal:
            return .blue
        case .clear, .negative, .percent:
            return Color(.purple)
        default: return Color(.systemPink)
        }
    }
}

enum Operation {
    case add, substrack, multiply, divide, none
    
}

struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
   @State var currentOperation: Operation = .none
    
    let buttons: [[CalcButtons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substrack],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    var body: some View {
        VStack {
            
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text(value)
                            .bold()
                            .font(.system(size:100))
                            .foregroundColor(.pink)
                    }
                    .padding()
                    ForEach(buttons, id: \.self) {row in
                        HStack(spacing: 12){
                            ForEach(row, id: \.self) {item in
                                Button(action: {
                                    self.didTap(button: item)
                                }, label: {
                                    Text(item.rawValue)
                                        .font(.system(size:40))
                                        .frame(
                                            width: self.buttonWidth(item: item),
                                            height:self.buttonHeight())
                                        .background(item.buttonColor)
                                        .foregroundColor(.white)
                                        .cornerRadius(self.buttonWidth(item: item)/2)
                                })
                        }
                        
                        }
                        .padding(.bottom, 3)
                    }
                }
            }
        }
    }
    func didTap(button: CalcButtons) {
        switch button {
        case .add, .substrack, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            } else if button == .substrack {
                self.currentOperation = .substrack
                self.runningNumber = Int(self.value) ?? 0
            } else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            } else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            } else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                    case .add: self.value = "\(runningValue + currentValue)"
                case .substrack: self.value = "\(runningValue - currentValue)"
                    case .multiply: self.value = "\(runningValue * currentValue)"
                    case .divide:
                        if currentValue != 0 {
                            self.value = "\(runningValue / currentValue)"
                        } else {
                            self.value = "Ошибка"
                        }
                    case .none:
                        break
                }
            }
            if button != .equal {
                self.value = "0"
            }
        case .clear:
            self.value = "0"
            self.currentOperation = .none
        case .decimal:
            if !self.value.contains(".") {
                            self.value += "."
                        }
        case .percent:
                if let currentValue = Double(self.value) {
                    self.value = "\(currentValue / 100)"
                }
        case .negative:
                if let currentValue = Double(self.value) {
                    self.value = "\(-currentValue)"
                }
        default:
            let number = button.rawValue
            if self.value == "0" {
                            value = button.rawValue
                        } else {
                            self.value = "\(self.value)\(button.rawValue)"
                        }
        }
    }
    
    func buttonWidth(item: CalcButtons) -> CGFloat {
        if item == .equal {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
