//
//  MainView.swift
//  UI-419
//
//  Created by nyannyan0328 on 2022/01/11.
//

import SwiftUI

struct MainView: View {
    
    @State var currentTab : Tab = .Home
    
    
    @Namespace var animation
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack{
            
            
            TabView(selection:$currentTab){
                
                
                Home()
                    .tag(Tab.Home)
                
                
                Text("B")
                    .tag(Tab.Search)
                
                Text("C")
                    .tag(Tab.Setting)
                
                
                Text("D")
                    .tag(Tab.Person)
                
                
                
            
            }
         
            HStack(spacing:0){
                
                ForEach(Tab.allCases,id:\.self){image in
                    
                  
                        
                        
                    VStack{
                        
                        Image(systemName: image.rawValue)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .frame(maxWidth:.infinity)
                        
                        
                        ZStack{
                            
                            if currentTab == image{
                                
                                
                                Capsule()
                                    .fill(.purple)
                                    .frame(width:68,height:8)
                                    .matchedGeometryEffect(id: "TABANIMATION", in: animation)
                              
                                
                            }
                            
                            else{
                                
                                Capsule()
                                    .fill(Color.clear)
                                    .frame(width:68,height:8)
                            }
                            
                            
                        
                            
                            
                            
                            
                            
                            
                            
                        }
                    }
                    .onTapGesture {
                        
                        withAnimation{
                            
                            currentTab = image
                        }
                    }
                    

                       
                }
                
                
                
                
            }
          
            
            
           
            
            
        }
       
    }
    
 
   
        
        
      
        
        
        
        
   
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Tab : String,CaseIterable{
    
    case Home = "house.fill"
    case Search = "magnifyingglass"
    case Setting = "gearshape.2"
    case Person = "person"
    
}
