// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let countiresLists = try? newJSONDecoder().decode(CountiresLists.self, from: jsonData)

import Foundation

// MARK: - CountiresList
struct CountiresList: Codable {
    let id: ID
//    let id: Int
    let enabled, code3L, code2L, name: String
    let nameOfficial: String
    let flag: String
    let latitude, longitude: String?
    let zoom: String
    var notes: String? = " "

    enum CodingKeys: String, CodingKey {
        case id, enabled
        case code3L = "code3l"
        case code2L = "code2l"
        case name
        case nameOfficial = "name_official"
        case flag, latitude, longitude, zoom, notes
    }
}

enum ID: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ID.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ID"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

