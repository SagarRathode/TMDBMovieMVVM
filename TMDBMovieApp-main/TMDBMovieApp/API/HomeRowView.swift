
import SwiftUI
import Kingfisher

struct HomeRowView: View {
    let movie: Movie

    var body: some View {
        VStack {
            KFImage(movie.backdropPath?.imageURL)
                .resizable()
                .scaledToFill()
                .scaleEffect(1.1)
                .frame(width: 120, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
            Text(movie.originalTitle)
                .font(.headline)
                .lineLimit(2)
                .frame(width: 130)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
    }

}

#Preview {
    HomeRowView(movie: .dummy)
}
