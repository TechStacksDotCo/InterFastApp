//
//  PrivacyLevel.swift
//  InterFastApp
//
//  Created by Marc Boanas on 09/09/2021.
//

import Foundation


enum PrivacyLevel: Comparable {
    case _private, _public
    
    var title: String {
        switch self {
        case ._private:
            return "private"
        case ._public:
            return "public"
        }
    }
    
    static func from(string: String) -> PrivacyLevel? {
        switch string {
        case _private.title:
            return _private
        case _public.title:
            return _public
        default:
            return nil
        }
    }
}
