//
//  ABHapticFeedback.swift
//
//  Created by Abhijit KG on 03/01/18.

import Foundation
import UIKit


protocol ABFeedbackGenerator {
    func prepare()
    func trigger()
}

protocol ABNotificationFeedbackGenerator: ABFeedbackGenerator {
    var notificationType: UINotificationFeedbackType { get set }
    
    mutating func updateNotificationType(_ notificationType: UINotificationFeedbackType) -> Self
}

extension ABNotificationFeedbackGenerator {
   
    mutating func updateNotificationType(_ notificationType: UINotificationFeedbackType) -> Self {
        self.notificationType = notificationType
        return self
    }
}

@available(iOS 10.0, *)
extension UIFeedbackGenerator {
    
    struct Notification: ABNotificationFeedbackGenerator {
        
        var notificationType: UINotificationFeedbackType = UINotificationFeedbackType.success
        
        private var feedbackGenerator: UINotificationFeedbackGenerator = UINotificationFeedbackGenerator()
        
        func trigger() {
            feedbackGenerator.notificationOccurred(notificationType)
        }
        
        func prepare() {
            feedbackGenerator.prepare()
        }
    }
    
    struct Impact: ABFeedbackGenerator {
        
        private var feedbackGenerator: UIImpactFeedbackGenerator
        
        func trigger() {
            feedbackGenerator.impactOccurred()
        }
        
        func prepare() {
            feedbackGenerator.prepare()
        }
        
        init(style: UIImpactFeedbackStyle) {
            self.feedbackGenerator = UIImpactFeedbackGenerator(style: style)
        }
    }
    
    struct Selection: ABFeedbackGenerator {
        
        private var feedbackGenerator: UISelectionFeedbackGenerator = UISelectionFeedbackGenerator()
        
        func trigger() {
            feedbackGenerator.selectionChanged()
        }
        
        func prepare() {
            feedbackGenerator.prepare()
        }
    }
}
