//
//  ContentView.swift
//  SwiftUIDraw
//
//  Created by Angelos Staboulis on 8/9/23.
//

import SwiftUI

struct ContentView: View {
    @State var points:[CGPoint] = []
    @State var startPoint:CGPoint! = .zero
    @State var show:Bool
    var body: some View {
        ZStack{
            Color.white
            Path { path in
                for (element,point) in points.enumerated(){
                    if element == 0 {
                        path.move(to: point)
                    }else{
                        path.addLine(to: point)
                    }
                }
            }
            .strokedPath(StrokeStyle(lineWidth: 15, lineCap: .square, lineJoin: .round))
            .foregroundColor(.red)
            .opacity(show ? 1.0 : 0.0)
          
        }.gesture(
            DragGesture()
                .onChanged({ value in
                    startPoint = value.location
                    points.append(startPoint)
                    show = true
                })
                
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(show: false)
    }
}
