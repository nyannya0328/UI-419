//
//  TaskViewModel.swift
//  UI-419
//
//  Created by nyannyan0328 on 2022/01/11.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    
    @Published var storedTask : [Task] = [
    
    
        
        Task(taskTitle: "Meeting", taskDescription: "Discuss team task for the day", taskDate: .init(timeIntervalSince1970: 1641645497)),
        Task(taskTitle: "Icon set", taskDescription: "Edit icons for team task for next week", taskDate: .init(timeIntervalSince1970: 1641649097)),
        Task(taskTitle: "Prototype", taskDescription: "Make and send prototype", taskDate: .init(timeIntervalSince1970: 1641652697)),
        Task(taskTitle: "Check asset", taskDescription: "Start checking the assets", taskDate: .init(timeIntervalSince1970: 1641656297)),
        Task(taskTitle: "Team party", taskDescription: "Make fun with team mates", taskDate: .init(timeIntervalSince1970: 1641661897)),
        Task(taskTitle: "Client Meeting", taskDescription: "Explain project to clinet", taskDate: .init(timeIntervalSince1970: 1641641897)),
        Task(taskTitle: "Next Project", taskDescription: "Discuss next project with team", taskDate: .init(timeIntervalSince1970: 1641677897)),
        Task(taskTitle: "App Proposal", taskDescription: "Meet client for next App Proposal", taskDate: .init(timeIntervalSince1970: 1641681497)),
        Task(taskTitle: "Client Meeting", taskDescription: "Explain project to clinet", taskDate: .init(timeIntervalSince1970: 1641641897)),
        Task(taskTitle: "Next Project", taskDescription: "Discuss next project with team", taskDate: .init(timeIntervalSince1970: 1641677897)),
        Task(taskTitle: "App Proposal", taskDescription: "Meet client for next App Proposal", taskDate: .init(timeIntervalSince1970: 1641681497)),
    
        Task(taskTitle: "Client Meeting", taskDescription: "Explain project to clinet", taskDate: .init(timeIntervalSince1970: 1641641897)),
        Task(taskTitle: "Next Project", taskDescription: "Discuss next project with team", taskDate: .init(timeIntervalSince1970: 1641677897)),
        Task(taskTitle: "App Proposal", taskDescription: "Meet client for next App Proposal", taskDate: .init(timeIntervalSince1970: 1641681497)),
    
    
    
    ]
    
    
    @Published var currentWeek : [Date] = []
    
    @Published var currentDay : Date = Date()
    
    @Published var filterdTasks : [Task]?
  
    
    init() {
        
        fetchCurrent()
        
        fetchTodayTask()
        
    }
    
    func fetchTodayTask(){
        
        DispatchQueue.global(qos: .userInteractive).async{
            
            
            
            let calender = Calendar.current
            
            let filterd = self.storedTask.filter {
                calender.isDate($0.taskDate, inSameDayAs: self.currentDay)
            }
                .sorted { task1, task2 in
                    
                    return task1.taskDate < task2.taskDate
                    
                }
            
            
            DispatchQueue.main.async {
                withAnimation{
                    
                    self.filterdTasks = filterd
                }
                
                
            }
            
            
        }
        
        
        
        
    }
    
    
    
    func fetchCurrent(){
        
        
        let calender = Calendar.current
        
        let today = Date()
        
        
        let week = calender.dateInterval(of: .weekOfMonth, for: today)
        
        
        guard let firstWeek = week?.start else{return}
        
        
        
        (0..<6).forEach { day in
            
            
            if let week = calender.date(byAdding: .day, value: day, to: firstWeek){
                
                
                currentWeek.append(week)
            }
        }
        
        
        
        
    }
    
    func extractWeek(date : Date,formate : String)->String{
        
        let formatted = DateFormatter()
        
        formatted.dateFormat = formate
        
        return formatted.string(from: date)
        
        
    }
    
    func isToday(date : Date)->Bool{
        
        
        let calender = Calendar.current
        
        return calender.isDate(currentDay, inSameDayAs: date)
        
        
    }
    
    
}

