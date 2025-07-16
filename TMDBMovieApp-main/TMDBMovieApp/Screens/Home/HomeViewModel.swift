

import Foundation

@Observable class HomeViewModel {
    
    
    var nowPlayingMovies: [Movie] = []
    var populars: [Movie] = []
    var topRatedMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    
    private let apiManager = APIManager()
    
    var isLoading: Bool = true
    
    func loadMovies() async {
        
        isLoading = true
        defer { isLoading = false }
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        await withTaskGroup(of: Void.self) { group in
            
            group.addTask { await self.NowplayingMovies() }
            group.addTask { await self.loadPopularMovies() }
            group.addTask { await self.loadTopRatedMovies() }
            group.addTask { await self.loadUpcomingMovies() }
        }
    }
    
    private func NowplayingMovies() async {
        
        do{
            let response: MovieResponseModel = try await apiManager.request(type: MovieEndPoint.nowplaying)
            self.nowPlayingMovies = response.results
        }catch{
            print(error)
        }
    }
    
    
    
    private func loadPopularMovies() async {
        do {
            let response: MovieResponseModel = try await apiManager.request(type: MovieEndPoint.popular)
            self.populars = response.results
        }catch {
            print(error)
        }
    }
    
    private func loadTopRatedMovies() async {
        do {
            let response: MovieResponseModel = try await apiManager.request(type: MovieEndPoint.topRated)
            self.topRatedMovies = response.results
        }catch {
            print(error)
        }
    }
    
    private func loadUpcomingMovies() async {
        do {
            let response: MovieResponseModel = try await apiManager.request(type: MovieEndPoint.upcoming)
            self.upcomingMovies = response.results
        }catch {
            print(error)
        }
    }
    
}
