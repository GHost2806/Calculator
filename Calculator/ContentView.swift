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

struct ContentView: View {
    @State var value = "0"
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
