//
//  ReportsGraphView.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 06/01/2021.
//

import SwiftUI

struct ReportsGraphView: View {
    let myCustomStyle = ChartStyle(backgroundColor: .clear, accentColor: Color(#colorLiteral(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)), secondGradientColor: Color(#colorLiteral(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)), textColor: .white, legendTextColor: .white, dropShadowColor: .clear)
    var body: some View {
        ZStack {
            LineChartView(data: [708000.00, 708876.00, 708654.00, 708876.00, 708900.00, 708560.00], title: "Line chart", legend: "Basic")
                .environment(\.colorScheme, .light)
        }
    }
}

struct ReportsGraphView_Previews: PreviewProvider {
    static var previews: some View {
        ReportsGraphView()
    }
}
