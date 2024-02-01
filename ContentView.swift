import SwiftUI

struct ContentView: View {
    @State private var weight: String = ""
    @State private var cm: String = ""
    @State private var bmi: Double = 0.0
    @State private var height: Double = 0.0
    @State private var si: Bool = true
    
    var body: some View {
        
        VStack {
            
            Button("SI"){
                si = true
                
            }.padding()
            .foregroundColor(.white) // Set text color
                .background(Color.blue) // Set background color
                .cornerRadius(10) // Add corner radius
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2) // Add border
                )
            
            Button("Imperial"){
                si = false
            }.padding()
                .foregroundColor(.white) // Set text color
                    .background(Color.blue) // Set background color
                    .cornerRadius(10) // Add corner radius
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2) // Add border
                    )
            
            if(si){
                TextField("Enter your weight in KG", text: $weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
                
                TextField("Enter your height in cm", text: $cm)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
            }else {
                TextField("Enter your weight in lb", text: $weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
                
                TextField("Enter your height in in", text: $cm)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
            }
            
            Button("Calculate BMI") {
                
                if(si)
                {calculateSI()}else{calculateIM()}
            }
            .padding()
            
            Text("Your BMI is \(String(format: "%.2f", bmi))")
                .padding()
            
            Spacer()
        }
        .padding()
    }
    
    func calculateSI() {
        let weightValue = Double(weight) ?? 0,
        height = cmTometers(cm: Double(cm) ?? 0)
        bmi = weightValue / (height * height)
    }
    
    func calculateIM(){
        let weightValue = Double(weight) ?? 0,
        height = Double(cm) ?? 0
        bmi = (weightValue / (height * height)) * 703
    }
    
    func cmTometers(cm: Double) -> Double {
      
        let meters = cm / 100
        return meters
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
