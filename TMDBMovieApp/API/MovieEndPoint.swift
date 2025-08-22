
import Foundation

enum MovieEndPoint {
   
    case nowplaying
    case popular
    case topRated
    case upcoming
    case credits(movieID: Int)
    case search(name: String)
    case videos(movieID: Int)
}

extension MovieEndPoint: EndPointType {

    private var apiKey: String {
        "3291823cbbff9e5dc387efae4b7b5732" //API KEY
        
        //eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMjkxODIzY2JiZmY5ZTVkYzM4N2VmYWU0YjdiNTczMiIsIm5iZiI6MTc1MjA1NjAxMS4xODU5OTk5LCJzdWIiOiI2ODZlNDBjYmI1ZWFiZmM0MjE5YTRjNWMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.sIiO54EpuXeeyOUdmJqiMa-NXkvghS_jqBpol4NEshU
        
        //API read access Token
    }

    var url: URL? {
        switch self {
        case .search:
            URL(string: baseURL + path + "&api_key=\(apiKey)")
        
        default:
            URL(string: baseURL + path + "?api_key=\(apiKey)")
        }
    }
   

    var path: String {
        switch self {
            
        case .nowplaying:
            return "now_playing"
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        case .upcoming:
            return "upcoming"
        case .credits(let id):
            return "\(id)" + "/credits"
        case .videos(let id): 
            return "\(id)/videos"
        case .search(let name):
            return "query=\(name)"
        }
    }

    var baseURL: String {
        switch self {
        case .search:
            return "https://api.themoviedb.org/3/search/movie?"
        default:
            return "https://api.themoviedb.org/3/movie/"
        }
    }

    var body: Encodable? {
        nil
    }

    var headers: [String : String]? {
        APIManager.commonHeaders
    }

    var method: HTTPMethod {
        .get
    }
    
    
    

}
