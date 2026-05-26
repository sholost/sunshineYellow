//
//  TodayViewModel.swift
//  sunshineYellow
//
//  Created by Sholihatul Richas on 21/05/26.
//
import Foundation
import SwiftUI
import Combine

struct FastModel {
    var startTime: Date
    var endTime: Date?
    var isActive: Bool
}

@Observable
class TodayViewModel {
    
    var currentFast: FastModel?
    var isFastActive: Bool { currentFast != nil }
    var progress: Double {
        guard let fast = currentFast else { return 0 }
        let elapsed = Date().timeIntervalSince(fast.startTime)
        let target = 0.2 * 3600
        return min(elapsed / target, 1.0)
    }
    
    private func createNewFast() -> FastModel {
        FastModel(startTime: Date(), endTime: nil, isActive: true)
    }
    
    private func resetFast() {
        currentFast = nil
    }
    
    func handleActionCardTap() {
        if isFastActive {
            resetFast()
            return
        }
        currentFast = createNewFast()
    }
}
