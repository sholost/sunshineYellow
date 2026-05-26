//
//  Homepage.swift
//  sunshineYellow
//
//  Created by Sholihatul Richas on 21/05/26.
//

import SwiftUI

struct TodayView: View {
    @State var viewModel: TodayViewModel = .init()
    var body: some View {
        VStack(spacing: 16) {
            WeeklyWidgetView()
                .padding(.top, 100)
            TimerCard(viewModel: viewModel)
                .padding(20)
            Spacer()
        }
    }
}

struct WeeklyWidgetView: View {
    var body: some View {
        HStack(spacing: 8) {
            ForEach(1...7, id: \.self) { day in
                VStack {
                    Text("\(day)")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(16)
                    Text("mon")
                }
            }
        }
    }
}

struct TimerCard: View {
    var viewModel: TodayViewModel
    var body: some View {
        VStack {
            TimelineView(.animation(minimumInterval: 1)) { _ in
                
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.15), lineWidth: 48)
                    
                    Circle()
                        .trim(from: 0, to: viewModel.progress)
                        .stroke(
                            Color.orange,
                            style: StrokeStyle(lineWidth: 48, lineCap: .butt)
                        )
                        .rotationEffect(.degrees(-90))
                    
                    VStack(spacing: 4) {
                        if let fast = viewModel.currentFast {
                            Text(fast.startTime, style: .timer)
                            Text("dari 16 jam")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        } else {
                            Text("Puasa gak!!!")
                                .font(.headline)
                        }
                    }
                }
                
            }
            .padding(40)
            
            Button {
                viewModel.handleActionCardTap()
            } label: {
                Text(viewModel.isFastActive ? "Selesai" : "Mulai")
            }
            
        }
        .padding(20)
        .background(.green)
        .cornerRadius(30)
    }
}

#Preview {
    TodayView()
}
