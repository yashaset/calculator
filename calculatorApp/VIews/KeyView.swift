//
//  KeyView.swift
//  calculatorApp
//
//  Created by Yash on 25/04/24.
//

import SwiftUI
struct KeyView: View {
    let buttons:[[Keys]]=[
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    @State var value = "0"
    @State var currentOperation: Operation = .none
    @State var runningNumber = 0
    @State var changeColor = false
    var body: some View {
        VStack{
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 12)
                    .scaleEffect(changeColor ? 1.5: 1.0)
                    .frame(width: 350, height: 280).animation(Animation.easeInOut.speed(0.17).repeatForever(), value: changeColor).onAppear(
                        perform: {
                            self.changeColor.toggle()
                        })
                    .foregroundColor(
                    changeColor ? Color("num").opacity(0.4)
                    :Color.pink.opacity(0.2)
                           
                ).overlay(Text(value)).bold().font(.system(size: 80)).foregroundColor(.black)
            }.padding()
            ForEach(buttons, id: \.self){
                row in
                HStack(spacing: 10){
                    ForEach(row, id:\.self){ elem in
                        Button{
                            self.didTap(button: elem)
                        }label: {
                            Text(elem.rawValue).font(.system(size: 32)).frame(width: 60, height: 60).background(elem.buttonColor)
                                .foregroundColor(.black).cornerRadius(30).shadow(
                                    color: .purple,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 6)
                        }
                        
                    }
                    
                }.padding(.bottom, 6)
            }
        }
    }
    func didTap(button:Keys){
        print("yash")
    }
}

#Preview {
    KeyView()
}
