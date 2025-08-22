
import SwiftUI

struct MovieView: View {

    var title: String
    var movies: [Movie]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                
            
            popularView
        }
    }

    var popularView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .center) {
                ForEach(movies) { movie in
                    NavigationLink(destination: MovieDetailsView(movie: movie)) {
                        HomeRowView(movie: movie)
                            .foregroundColor(.primary)
                    }
                }
            }.frame(maxHeight: 200)
                .background(Color.gray.opacity(0.2)) // background for LazyHStack
        }
    }
}

#Preview {
    MovieView(title: "Populars", movies: [.dummy])
}
