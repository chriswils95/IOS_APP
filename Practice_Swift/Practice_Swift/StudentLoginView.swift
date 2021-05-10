//
//  StudentLoginView.swift
//  Practice_Swift
//
//  Created by Christopher Wilson on 6/28/20.
//  Copyright © 2020 Christopher Wilson. All rights reserved.
//

import SwiftUI



`   var is_user:Int = 0
let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let URL_SAVE_TEAM = "http://localhost:8010"
let requestURL = URL(string: URL_SAVE_TEAM)!


var request = URLRequest(url: requestURL)


var connection:String = ""

struct StudentLoginView: View {
    @Environment(\.presentationMode) var presentation
    @State var username: String = ""
    @State var password: String = ""
    @State var check_user:Int = 0
   var body: some View {
        
    VStack(){
            WelcomeText()
            UserImage()
            TextField("Username", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button(action: {
                 login_user(username: self.username, password: self.password)
                self.check_user = is_user
                if(self.check_user == 1){
                   print("successful login")
                }
                else if(self.check_user == 2) {
                   print("unsuccessful login")
                }
            }) {
               LoginButtonContent()
            }
        }
        .padding()
    }
}


func send_request_to_database(username: String, password: String){
      // Prepare URL
     let url = URL(string: "http://localhost:8010")
     guard let requestUrl = url else { fatalError() }
     // Prepare URL Request Object
     var request = URLRequest(url: requestUrl)
     request.httpMethod = "POST"
      
     // HTTP Request Parameters which will be sent in HTTP Request Body
     let postString = "username="+username+"&password="+password;

     // Set HTTP Request Body
     request.httpBody = postString.data(using: String.Encoding.utf8);

     // Perform HTTP Request
     let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
             
             // Check for Error
             if let error = error {
                 print("Error took place \(error)")
                 return
             }
      
             // Convert HTTP Response Data to a String
             if let data = data, let dataString = String(data: data, encoding: .utf8) {
                let arr = dataString.components(separatedBy: ":")
                var return_password = arr[1].replacingOccurrences(of: "}", with: "")
                return_password = return_password.replacingOccurrences(of: "\"", with: "")

                if(return_password == password){
                 print("Response data string:\n \(dataString)")
                    is_user = 1
                }
                else {
                    print("in here")
                    is_user = 2
                }
             }
     }
     task.resume()
}


func login_user(username: String, password: String) {
    request.httpMethod = "POST"
    send_request_to_database(username: username, password: password)
}




struct WelcomeText : View {
    var body: some View {
        return Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage : View {
    var body: some View {
        return Image("badge")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct StudentLoginView_Previews: PreviewProvider {
    static var previews: some View {
        StudentLoginView()
    }
}
