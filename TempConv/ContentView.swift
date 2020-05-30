//
//  ContentView.swift
//  TempConv
//
//  Created by Kamil on 30/05/2020.
//  Copyright © 2020 Kamil. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var temperatures = ["Celcius", "Farenheit", "Kelvin"]
    
    @State private var typedTemp = "0"
    
    @State private var selectedTemp = 0
    @State private var destinationTemp = 0
    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    Picker(selection: $selectedTemp, label: Text("")) {
                        ForEach(0..<3){
                            Text("\(self.temperatures[$0])")
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $typedTemp)
                }
                
            Section{
                Picker(selection: $destinationTemp, label: Text("")) {
                    ForEach(0..<3){
                        Text("\(self.temperatures[$0])")
                    }
                    
                }
                .pickerStyle(SegmentedPickerStyle())
            }
                
                Section(header:Text("Output")){
                Text("\(convert(convertFrom: selectedTemp, convertTo: destinationTemp, typedTemperature: typedTemp))")
            }
                
                
            }
                
            .navigationBarTitle(Text("Convert Temperature"))
        }
    }
    
    //
    //Functions
    //
    
    func convert(convertFrom: Int, convertTo: Int, typedTemperature: String) -> String {
        
        let temp = Double(typedTemperature) ?? 0
        let result: Double
        
        switch convertFrom {
        case 0:
            switch convertTo {
            case 1:
                result = temp*1.8+32
            case 2:
                result = temp+273.15
            default:
                result = temp
            }
        case 1:
            switch convertTo {
            case 0:
                result = (temp-32)*5/9
            case 2:
                result = (temp+459.67)*5/9
            default:
                result = temp
            }
        case 2:
            switch convertTo {
            case 0:
                result = temp-273.15
            case 1:
                result = temp*9/5-459.67
            default:
                result = temp
            }
        default:
            result = temp
        }
        
        let resultRounded = (result*10000).rounded()/10000
        return String(resultRounded)
        
}
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
