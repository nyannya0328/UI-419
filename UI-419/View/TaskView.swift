//
//  TaskView.swift
//  UI-419
//
//  Created by nyannyan0328 on 2022/01/11.
//

import SwiftUI

struct TaskView: View {
    
    @StateObject var model = TaskViewModel()
    
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        
            
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                
                
                
                
                
                Section {
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(alignment:.top,spacing: 30){
                            
                            
                            ForEach(model.currentWeek,id:\.self){day in
                                
                                VStack(spacing:10){
                                    
                                    Text(model.extractWeek(date: day, formate: "dd"))
                                        .font(.system(size: 13, weight: .bold))
                                    
                                     Text(model.extractWeek(date: day, formate: "EEE"))
                                        .font(.system(size: 13, weight: .bold))
                                    
                                    
                                    
                                }
                                .foregroundStyle(model.isToday(date: day) ? .primary : .secondary)
                                .foregroundColor(model.isToday(date: day) ? .white : .black)
                                .frame(width: 50, height: 90)
                                .background(
                                
                                    ZStack{
                                        
                                        if model.isToday(date: day){
                                            
                                            
                                                 Capsule()
                                                .fill(.black)
                                                .matchedGeometryEffect(id: "TODAYANIMATION", in: animation)
                                            
                                            
                                            
                                        }
                                        
                                        
                                        
                                    }
                                
                                
                                )
                                .contentShape(Capsule())
                                .onTapGesture {
                                    
                                    withAnimation{
                                        
                                        
                                        model.currentDay = day
                                    }
                                }
                                
                                
                                
                            }
                            
                            
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                    
                    TaskView()
                    
                    
                    
                } header: {
                    
                    HeaderView()
                    
                }

            }
            
            
        }
    }
    
    func TaskCardView(task : Task)->some View{
        
        
        HStack{
            
            VStack{
                
                Circle()
                    .fill(.black)
                    .frame(width: 15, height: 15)
            }
            
            
        }
        
        
        
    }
    func TaskView()->some View{
        
        LazyVStack(spacing:10){
            
            
            if let tasks = model.filterdTasks{
                
                
                if tasks.isEmpty{
                    
                    Text("Task Not Found")
                        .font(.largeTitle.weight(.semibold))
                        .offset(y: 100)

                    
                    
                    
                }
                
                else{
                    
                    
                    ForEach(tasks){task in
                        
                        
                        TaskCardView(task: task)
                    }
                }
                
                
            }
            else{
                
                ProgressView()
                    .offset(y: 100)
            }
        }
        .onChange(of:model.currentDay) { newValue in
            
            model.fetchTodayTask()
        }
       
    }
    
    func HeaderView()->some View{
        
        
        HStack{
            
            
            VStack(spacing:15){
                
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                
                
                Text("Today")
                    .font(.largeTitle.weight(.heavy))
                
            }
            .lLeading()
            
            
            Button {
                
            } label: {
                
                Image("pro")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            }

            

            
            
            
            
            
            
        }
        .padding()
        .background(Color.white)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}

extension View{
    
    func lLeading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .leading)
    }
    
    func lTrailing()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .trailing)
    }
    
    func lCenter()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .center)
    }
    
    
    func getSafeaArea()->UIEdgeInsets{
        
        guard let sceen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            
            return .zero
        }
        
        guard let safeArea = sceen.windows.first?.safeAreaInsets else {
            
            return .zero
        }
        
        return safeArea
    }
}
