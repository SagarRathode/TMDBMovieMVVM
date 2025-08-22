//
//  Trailer.swift
//  TMDBMovieApp
//
//  Created by Sagar Rathode   on 21/08/25.
//



struct VideoResponse: Decodable {
    let id: Int
    let results: [Video]
}

struct Video: Decodable, Identifiable {
    let id: String       // TMDB’s video id
    let key: String      // YouTube key
    let name: String
    let site: String
    let type: String
}

/*
{
  "id": 1151031,
  "results": [
    {
      "id": "66c5b2d5eabcde7890abcd12",
      "iso_639_1": "en",
      "iso_3166_1": "US",
      "key": "XyZAbCd123",
      "name": "Official Trailer",
      "site": "YouTube",
      "size": 1080,
      "type": "Trailer",
      "official": true,
      "published_at": "2025-04-20T12:00:00.000Z"
    }
  ]
}
*/ //dummy
