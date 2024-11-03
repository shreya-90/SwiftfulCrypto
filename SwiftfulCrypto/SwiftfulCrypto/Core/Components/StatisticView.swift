//
//  StatisticView.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 25/10/24.
//

import SwiftUI

struct StatisticView: View {
    
    var stat: StatisticModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(
                        degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
                   
            } .foregroundColor(
                (stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                )
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
            
        }
        
    }
}

struct StatisticView_Preview: PreviewProvider {
    static var previews: some View {
        
        Group {
            StatisticView(stat: dev.stat1)
                .previewLayout(.sizeThatFits)
            
            StatisticView(stat: dev.stat2)
                .previewLayout(.sizeThatFits)
            
            StatisticView(stat: dev.stat3)
                .previewLayout(.sizeThatFits)

        }
    }
}
