//
//import Foundation
//
//@Observable class MovieDetailsViewModel {
//    
//    var casts: [CastModel] = []
//    private let manager = APIManager()
//    
//    func loadCasts(id: Int) async {
//        do {
//            let response: CastResponseModel = try await manager.request(type: MovieEndPoint.credits(movieID: id))
//            self.casts = Array(response.cast.prefix(10))
//            
//        }catch {
//            print(error)
//        }
//    }
//
//    
//    
//}
//  
//



import Foundation

@Observable
class MovieDetailsViewModel {
    
    var casts: [CastModel] = []
    var summary: String? = nil
    var isSummarizing: Bool = false
    var trailerURL: URL? = nil
    
    private let manager = APIManager()
    
    /// ✅ Fetch Casts
    func loadCasts(id: Int) async {
        do {
            let response: CastResponseModel = try await manager.request(type: MovieEndPoint.credits(movieID: id))
            self.casts = Array(response.cast.prefix(10))
        } catch {
            print("Failed to load casts: \(error)")
        }
    }
    
    
    
    /// ✅ Fetch Trailer (YouTube link)
        
            func loadTrailer(id: Int) async -> URL? {
                do {
                    let response: VideoResponse = try await manager.request(
                        type: MovieEndPoint.videos(movieID: id)
                    )
                    
                    if let trailer = response.results.first(where: { $0.type == "Trailer" && $0.site == "YouTube" }) {
                        return URL(string: "https://www.youtube.com/embed/\(trailer.key)")
                    }
                } catch {
                    print("Failed to load trailer: \(error)")
                }
                return nil
            }

      
    
    /// ✅ Simple Offline Summarizer (English Only)
    
    func summarizeText(_ text: String) async {
            isSummarizing = true
            summary = nil
            
            do {
                let aiSummary = try await SummarizerService.summarizeWithAI(text: text)
                summary = aiSummary
                
                //summary = text
            } catch {
                print("AI Summary failed: \(error)")
                summary = "Summary unavailable."
            }
            
            isSummarizing = false
        }
}


