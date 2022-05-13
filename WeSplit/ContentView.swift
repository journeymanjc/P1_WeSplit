//
//  ContentView.swift
//  WeSplit
//
//  Created by Jae Cho on 1/29/22.
//
//Completed
import SwiftUI

struct ContentView: View {
	
	@FocusState private var amountIsFocused: Bool
	@State private var checkAmount = 0.0
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 20
	
	let tipPercentages = [10,15,25,0]
	
	var peopleCount: Double{
		Double(numberOfPeople + 2)
	}
	var tipSelection: Double{
		Double(tipPercentage)
	}
	var tipValue: Double{
		checkAmount / 100 * tipSelection
	}

	
	var totalPerPerson: Double{
		//Calculate the total per person here.
		let amountPerPerson = grandTotal / peopleCount
		return amountPerPerson
	}
	
	var grandTotal: Double{
		return  checkAmount + tipValue
	}
	
	private var currencyFormatToUse: FloatingPointFormatStyle<Double>.Currency{
		return FloatingPointFormatStyle<Double>.Currency.currency(code: Locale.current.currencyCode ?? "USD")
		
		//return Currency(code: Locale.current.currencyCode ?? "USD")
	}
	
//	private var currencyFormatToUse: FloatingPointFormatStyle<Double>.Currency {
//		if Locale.current.currencyCode {
//			return
//		}
//		else{
//			return "USD"
//		}
//	}
	
	  
    var body: some View {
		 NavigationView{
			 Form{
				 Section{
					 TextField("Amount", value:$checkAmount, format: currencyFormatToUse)
						 .keyboardType(.decimalPad)
						 .focused($amountIsFocused)
					 
					 Picker("Number of people",selection: $numberOfPeople){
						 ForEach(2..<100){
							 Text("\($0) people")
						 }
					 }
				 }
				 
				 Section{
					 //TextField("Grand Total", )
					 Text("Grand Total : \(grandTotal.rounded())")
				 }
				 .foregroundColor(tipPercentage == 0 ? .red : .black)
				 
				 Section{
					 Text(totalPerPerson, format: currencyFormatToUse)
						 
				 } header: {
					 Text("Amount per person")
				 }
				 
				 Section{
					 Picker("Tip Percentage", selection: $tipPercentage){
						 ForEach(0..<101){
							 Text($0,format: .percent)
						 }
					 }
					 //.pickerStyle(.segmented)
					 .pickerStyle(.automatic)
				 } header: {
					 Text("How much tip do you want to leave?")
				 }
			 }
			 .navigationTitle("WeSplit")
			 .toolbar {
				 ToolbarItemGroup(placement: .keyboard) {
					 Spacer()
					 Button("Done"){
						 amountIsFocused = false
					 }
				 }
			 }
		 }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			 .previewDevice("iPhone 13 Mini")
    }
}
