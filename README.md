# P1_WeSplit
###### Day 16
  - Create a form using ```Form {.  }```
  - Adding Navigation Bar using  ```NavigationView {}```
  - Modify program state using @State which lives in the heap after the view gets destroyed.  
  - Apple recommends we use private with @State because usually it's tied to one view.
  - Binding state to user interface controls : Need to use 2 way binding like  
      ```@State private var name = "" ``` and then ```TextField("Enter your name", text: $name)``` $means two way binding.
###### Day 17
  - Locale : a massive struct built into iOS that is responsible for storing all the user's region settings.  
    ```.currency(code: Locale.current.currencyCode ?? "USD"))```
  - Hiding the keyboard 
    ```@FocusState private var amountIsFocused : Bool``` : This is exactly like @State but made specially for to handle input focus in the UI.
    ```.focused($amountIsFocused)```
