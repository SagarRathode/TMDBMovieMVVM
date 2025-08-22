//
//  SummarizerService.swift
//  TMDBMovieApp
//
//  Created by Sagar Rathode   on 29/07/25.
//

//import Foundation
//
//struct SummarizerService {
//    /// Offline summarization logic
//    static func summarize(text: String) -> String {
//        let sentences = text.split(separator: ".")
//
//        if sentences.count > 2 {
//            return "AI Summary: " + sentences.prefix(2).joined(separator: ". ") + "."
//        } else {
//            return "AI Summary: " + text
//        }
//    }
//}



//
//  SummarizerService.swift
//  TMDBMovieApp
//
//  Created by Sagar Rathode on 29/07/25.
//

import Foundation

let apiKey = "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" // store securely in Keychain/Config

struct SummarizerService {
    struct Response: Decodable {
        struct Choice: Decodable {
            struct Message: Decodable {
                let role: String
                let content: String
            }
            let message: Message
        }
        let choices: [Choice]
    }
    
    static func summarizeWithAI(text: String) async throws -> String {
        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        
        
        

        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        //request.setValue("Bearer \(ProcessInfo.processInfo.environment["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"] ?? "")",forHTTPHeaderField: "Authorization")
        
        let body: [String: Any] = [
            "model": "gpt-4o-mini",
            "messages": [
                ["role": "system", "content": "Summarize the following movie description in 2–3 sentences."],
                ["role": "user", "content": text]
            ],
            "temperature": 0.7
        ]
        
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        // 👇 Debug log to see raw JSON
        if let raw = String(data: data, encoding: .utf8) {
            print("🔍 Raw Response: \(raw)")
        }
        
        // Decode properly
        let decoded = try JSONDecoder().decode(Response.self, from: data)
        print(decoded)
        return decoded.choices.first?.message.content
            .trimmingCharacters(in: .whitespacesAndNewlines)
            ?? "Summary not available."
    }
}
