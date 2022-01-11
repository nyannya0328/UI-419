//
//  Home.swift
//  UI-419
//
//  Created by nyannyan0328 on 2022/01/11.
//

import SwiftUI

struct Home: View {
    let column = Array(repeating: GridItem(.flexible(),spacing: 5), count: 3)
    
    @State var count : Int = 50
    
    @Environment(\.openURL) var openURl
    
    @State var showAlert : Bool = false
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                
                
              
                Button("Apple"){
                    
                    
                    showAlert.toggle()
                    
                   
            
                    
                    
                    
                }
            
                
                LazyVGrid(columns:column,spacing: 10){
                    
                    
            
                    
                   
                        
                        
                            
                    ForEach(1...count,id:\.self){index in
                                
                                
                                
                                    
                                    Color.red
                        
                               
                                .frame(height: 150)
                                .overlay(
                                
                                
                                Text("\(index)")
                                    .font(.largeTitle)
                                
                                )
                            }
                            
                            
                }
               
            }
            .padding()
            .navigationTitle("LazyV Grid")
            .alert("OpenURl?", isPresented: $showAlert) {
                
                
                Button("Year!"){
                    
                    openURl(URL(string: "https://www.apple.com")!)
                }
                
                Button("No",role: .cancel){
                    
                    
                }
                
                
                
            } message: {
                
                
                Text("Open")
            }


            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
