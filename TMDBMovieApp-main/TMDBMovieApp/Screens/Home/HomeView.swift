

import SwiftUI
import Shimmer

struct HomeView: View {
    @State var viewModel = HomeViewModel()
    
    var body: some View {

        NavigationStack {
            ZStack{
           
                VStack(alignment: .leading) {
                    headerView
                    ScrollView(showsIndicators: false) {
                        
                        VStack(spacing: 8) {
                            
                            MovieView(title: "Now Playing", movies: viewModel.nowPlayingMovies)
                            
                            MovieView(title: "Populars", movies: viewModel.populars)
                            
                            MovieView(title: "Top Rated", movies: viewModel.topRatedMovies)
                            
                            MovieView(title: "Upcomings", movies: viewModel.upcomingMovies)
                            
                        }
                    }
                    
                    Spacer()
                }
                .blur(radius: viewModel.isLoading ? 3 : 0)
                
                if viewModel.isLoading {
                    ProgressView("Loading Movies...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                        
                }
                
            }
            .background(
                //LinearGradient(colors: [.blue,.black], startPoint: .leading, endPoint: .trailing)
                LinearGradient(colors: [Color.purple, Color.blue, Color.green],startPoint: .topLeading,endPoint: .bottomTrailing)
            )
            .ignoresSafeArea(edges: .bottom)
            .task {
                await viewModel.loadMovies()
            }
        }
    }
    
    

    var headerView: some View {
        VStack(alignment: .leading) {
            Text("Welcome")
                .foregroundStyle(.secondary)
                .font(.title3)
            HStack(alignment: .center) {
                Text("Sagar Rathode")
                    .font(.title)
                Spacer()
                Image("prof")
                    .frame(height: 50)
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 6)
                    .padding(5)
            }.padding(0)
            
            
            
        }.padding(10)
        
    }
  
}

#Preview {
    HomeView().preferredColorScheme(.dark)
}
