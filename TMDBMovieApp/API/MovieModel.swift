

import Foundation

struct MovieResponseModel: Decodable {
    let results: [Movie]
}

struct Movie: Decodable, Identifiable, Hashable {
    let id: Int
    let originalTitle, overview: String
    let posterPath: String?
    let releaseDate, title: String
    let backdropPath: String?
    let popularity, voteAverage: Double
    let voteCount: Int
    
    
    

    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case popularity
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case backdropPath = "backdrop_path"
    }
}

extension Movie {

    static var dummy: Movie {
        .init( id: 1151031,
               originalTitle: "Bring Her Back",
               overview: "Following the death of their father, a brother and sister are introduced to their new sibling by their foster mother, only to learn that she has a terrifying secret.",
               posterPath: "/tObSf1VzzHt9xB0csanFtb3DRjf.jpg",
               releaseDate: "2025-05-28",
               title: "Bring Her Back",
               backdropPath: "/5esDYWV0NoFwqPa1iC0g9akqZo9.jpg",
               popularity: 250.4393,
               voteAverage: 7.321,
               voteCount: 201)
    }
}
