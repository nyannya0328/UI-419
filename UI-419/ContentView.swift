//
//  ContentView.swift
//  UI-419
//
//  Created by nyannyan0328 on 2022/01/11.
//

import SwiftUI

struct ContentView: View {
    
  
    var body: some View {
       
        TaskView()
       
    
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UINavigationController{
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationBar.largeTitleTextAttributes = [.foregroundColor:UIColor.green]
        navigationBar.titleTextAttributes = [.foregroundColor:UIColor.green]
        
        
    }
}
