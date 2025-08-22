//
//
//import SwiftUI
//import Kingfisher
//
//struct MovieDetailsView: View {
//    @State var viewModel = MovieDetailsViewModel()
//    let movie: Movie
//
//    var body: some View {
//        GeometryReader { geometry in
//            VStack(spacing: 0) {
//                ZStack {
//                    KFImage(movie.backdropPath?.imageURL)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(
//                            width: geometry.size.width,
//                            height: geometry.size.height * 0.4
//                        )
//                        .clipped()
//
//                    VStack {
//                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                            VStack(spacing: 8) {
//                                Image(systemName: "play.circle")
//                                    .resizable()
//                                    .fontWeight(.light)
//                                    .frame(width: 80, height: 80, alignment: .center)
//                                    .foregroundColor(.white)
//                                Text("Play trailer")
//                                    .foregroundStyle(.white)
//                                    .font(.headline)
//                            }
//                        })
//
//                    }
//
//                }
//
//                Spacer()
//
//                ScrollView(showsIndicators: false) {
//                    VStack(alignment: .leading, spacing: 16) {
//                        Text(movie.originalTitle)
//                            .font(.title)
//
//                        HStack(spacing: 16) {
//                            Text("18+")
//                                .font(.caption)
//                                .padding(8)
//                                .padding(.horizontal, 8)
//                                .background(Capsule().stroke())
//
//
//                            HStack(spacing: 16) {
//                                Text("3h 12m")
//                                    .font(.subheadline)
//
//                                Image(systemName: "circle.fill")
//                                    .resizable()
//                                    .frame(width: 5, height: 5)
//
//                                Text(movie.releaseDate)
//                                    .font(.subheadline)
//                            }
//                            .foregroundStyle(.secondary)
//
//                            Spacer()
//                        }
//
//                        HStack(spacing: 8) {
//                            VStack(spacing: 5) {
//                                Image(systemName: "square.and.arrow.down")
//                                Text("Download")
//                                    .font(.footnote)
//                            }
//
//                            Spacer()
//
//                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                                Text("Play Now")
//                                    .frame(height: 44)
//                                    .frame(maxWidth: .infinity)
//                                    .tint(.white)
//                                    .font(.headline)
//                                    .background(.blue)
//                                    .clipShape(.capsule)
//                            })
//                        }
//
//                        Text(movie.overview)
//                            .foregroundStyle(.secondary)
//                            .font(.title3)
//                            .lineLimit(4)
//                            .foregroundColor(.black)
//
//                        Spacer()
//
//                        Text("Cast")
//                            .font(.title3)
//                        ScrollView(.horizontal, showsIndicators: false, content: {
//                            LazyHStack(alignment: .top,content: {
//                                ForEach(viewModel.casts) { cast in
//                                    VStack {
//                                        KFImage(cast.imageURL?.imageURL)
//                                            .resizable()
//                                            .scaledToFit()
//                                            .scaleEffect(1)
//                                            .frame(width: 80, height: 80)
//                                            .clipShape(RoundedRectangle(cornerRadius: 8))
//                                            .clipped()
//                                        Text(cast.name)
//                                    }
//                                    .frame(width: 80)
//                                }
//                            })
//                        })
//
//                        Spacer()
//                    }
//                    .padding()
//                    .frame(
//                        width: geometry.size.width,
//                        height: geometry.size.height * 0.6
//                    )
//                }
//            }
//            .task {
//                await viewModel.loadCasts(id: movie.id)
//            }
//        }
//        .background(
//            LinearGradient(colors: [.blue, .gray.opacity(0.7),.gray], startPoint: .leading, endPoint: .trailing)
//        )
//        .toolbarRole(.editor)
//        .ignoresSafeArea()
//    }
//
//}
//
//#Preview {
//    MovieDetailsView(movie: .dummy)
//}



import SwiftUI
import Kingfisher
import AVKit

struct MovieDetailsView: View {
    @State var viewModel = MovieDetailsViewModel()
    @State private var showTrailer = false
    let movie: Movie
    
    var body: some View{
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // Backdrop Image
                ZStack {
                    KFImage(movie.backdropPath?.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                        .clipped()
                    
                    VStack {
                        Button(action: {
                            Task {
                                if let url = await viewModel.loadTrailer(id: movie.id) {
                                    viewModel.trailerURL = url
                                    showTrailer = true
                                
                                }
                            }
                        }, label: {
                            VStack(spacing: 8) {
                                Image(systemName: "play.circle")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.white)
                                Text("Play trailer")
                                    .foregroundStyle(.white)
                                    .font(.headline)
                            }
                        })
                    }
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text(movie.originalTitle)
                            .font(.title)
                        
                        // Original Overview
                        Text(movie.overview)
                            .foregroundStyle(.secondary)
                            .font(.title3)
                            .lineLimit(4)
                        
                        
                        //  Summarize Button
                        Button(action: {
                            Task {
                                await viewModel.summarizeText(movie.overview)
                            }
                        }) {
                            if viewModel.isSummarizing {
                                ProgressView("")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .background(.gray.opacity(0.4))
                                    .clipShape(.capsule)
                            } else {
                                Text("Summarize")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .tint(.white)
                                    .font(.headline)
                                    .background(.green)
                                    .clipShape(.capsule)
                            }
                        }
                        .disabled(viewModel.isSummarizing)


                        // AI Summary Section
                        if let summary = viewModel.summary {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("AI Summary:")
                                    .font(.headline)
                                Text(summary)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.top)
                            .transition(.opacity.combined(with: .slide))
                        }

          
                        //  Cast Section
                        Text("Cast")
                            .font(.title3)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                ForEach(viewModel.casts) { cast in
                                    VStack {
                                        KFImage(cast.imageURL?.imageURL)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                        Text(cast.name)
                                            .font(.caption)
                                            .frame(width: 80)
                                            .multilineTextAlignment(.center)
                                    }
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                    .padding()
                    
                }
            }
            .task {
                await viewModel.loadCasts(id: movie.id)
            }
        }
        .background(
            LinearGradient(colors: [.blue, .gray.opacity(0.7), .gray], startPoint: .leading, endPoint: .trailing)
        )
        .ignoresSafeArea()
        
        
        // Trailer Presentation
        .sheet(isPresented: $showTrailer) {
            if let trailerURL = viewModel.trailerURL {
                VideoPlayer(player: AVPlayer(url: trailerURL))
                    .ignoresSafeArea()
            }
        }
        
    }
}

#Preview {
    MovieDetailsView(movie: .dummy)
}
