//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by loratech on 14/02/24.
//

import Foundation

enum SampleError: Error {
    case errorRequired
}

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}

extension ErrorWrapper {
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this error.")
    }
}


