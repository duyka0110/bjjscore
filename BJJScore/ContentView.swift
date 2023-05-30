//
//  ContentView.swift
//  BJJScore
//
//  Created by Khanh on 26/05/2023.
//

import SwiftUI

///Constants
let backgroundColor = Color(.darkGray)
let textColor = Color(.white)
//Points per stat
let ptsTakedown = 2
let ptsSweep = 2
let ptsKneeOnBelly = 2
let ptsGuardPass = 3
let ptsMount = 4
let ptsBack = 4

//Player class
//Store data like name, points
class Player: ObservableObject {
    ///Variables
    var name = ""
    var image: String
    var pointImage: String
    var points = 0
    @Published var submission = ""
    @Published var takedown = 0
    @Published var sweep = 0
    @Published var kneeOnBelly = 0
    @Published var guardPass = 0
    @Published var mount = 0
    @Published var back = 0
    
    ///Functions
    //Initate player
    init(name: String, image: String, pointImage: String) {
        self.name = name
        self.image = image
        self.pointImage = pointImage
        self.points = 0
        self.submission = ""
        self.takedown = 0
        self.sweep = 0
        self.kneeOnBelly = 0
        self.guardPass = 0
        self.mount = 0
        self.back = 0
    }
    //Increase amount of moves
    func incAmount(amount: Int) -> Int{
        return amount + 1
    }
    
    //Calculate points
    func totalPoints() -> Int{
        self.points =
        takedown * ptsTakedown
        + sweep * ptsSweep
        + kneeOnBelly * ptsKneeOnBelly
        + guardPass * ptsGuardPass
        + mount * ptsMount
        + back * ptsBack
        
        return self.points
    }
}

//Info UI
//Read-only
class InfoUI {
    ///Variables
    var image: Image
    var info: String
    
    ///Functions
    init(image: Image, info: String) {
        self.image = image
        self.info = info
    }
}

//Input UI
//Used to write text in it
class InputUI {
    ///Variables
    ///Functions
}

struct ContentView: View {
    @StateObject var redPlayer = Player.init(name: "RED", image: "red", pointImage: "point_red")
    @StateObject var bluePlayer = Player.init(name: "BLUE", image: "blue", pointImage: "point_blue")
    
    @State private var nameDisplayed: String = "WHO"
    
    var body: some View {
        ZStack{
            //background
            backgroundColor
                .ignoresSafeArea()
            
            //UI elements
            VStack (spacing: 32){
                /*
                //Header
                HStack{
                    Text("\(nameDisplayed) WON")
                        .font(.system(size: 80))
                        .foregroundColor(textColor)
                        .onSubmit() {
                            nameDisplayed = nameToDisplay()
                        }
                        
                }
                */
                
                //Points
                HStack{
                    ZStack{
                        Image(redPlayer.pointImage)
                        Text(String(redPlayer.totalPoints()))
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                    }
                    
                    Spacer()
                    Text("Points")
                        .foregroundColor(textColor)
                    Spacer()
                    
                    ZStack{
                        Image(bluePlayer.pointImage)
                        Text(String(bluePlayer.totalPoints()))
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                    }
                }
                
                //Submission
                HStack{
                    Button {
                        
                    } label: {
                        Image(redPlayer.image)
                    }
                    
                    Spacer()
                    Text("Submission")
                        .foregroundColor(textColor)
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(bluePlayer.image)
                    }
                }
                
                VStack(spacing: 8){
                    //Takedown
                    HStack{
                        Button {
                            addOne(arg: &redPlayer.takedown)
                        } label: {
                            ZStack{
                                Image(redPlayer.image)
                                Text(String(redPlayer.takedown))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Spacer()
                        Text("Takedown")
                            .foregroundColor(textColor)
                        Spacer()
                        
                        Button {
                            addOne(arg: &bluePlayer.takedown)
                        } label: {
                            ZStack{
                                Image(bluePlayer.image)
                                Text(String(bluePlayer.takedown))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                    
                    //Sweep
                    HStack{
                        Button {
                            addOne(arg: &redPlayer.sweep)
                        } label: {
                            ZStack{
                                Image(redPlayer.image)
                                Text(String(redPlayer.sweep))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Spacer()
                        Text("Sweep")
                            .foregroundColor(textColor)
                        Spacer()
                        
                        Button {
                            addOne(arg: &bluePlayer.sweep)
                        } label: {
                            ZStack{
                                Image(bluePlayer.image)
                                Text(String(bluePlayer.sweep))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                    
                    //Knee-on-belly
                    HStack{
                        Button {
                            addOne(arg: &redPlayer.kneeOnBelly)
                        } label: {
                            ZStack{
                                Image(redPlayer.image)
                                Text(String(redPlayer.kneeOnBelly))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Spacer()
                        Text("Knee-on-belly")
                            .foregroundColor(textColor)
                        Spacer()
                        
                        Button {
                            addOne(arg: &bluePlayer.kneeOnBelly)
                        } label: {
                            ZStack{
                                Image(bluePlayer.image)
                                Text(String(bluePlayer.kneeOnBelly))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                    
                    //Guard pass
                    HStack{
                        Button {
                            addOne(arg: &redPlayer.guardPass)
                        } label: {
                            ZStack{
                                Image(redPlayer.image)
                                Text(String(redPlayer.guardPass))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Spacer()
                        Text("Guard pass")
                            .foregroundColor(textColor)
                        Spacer()
                        
                        Button {
                            addOne(arg: &bluePlayer.guardPass)
                        } label: {
                            ZStack{
                                Image(bluePlayer.image)
                                Text(String(bluePlayer.guardPass))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                    
                    //Mount
                    HStack{
                        Button {
                            addOne(arg: &redPlayer.mount)
                        } label: {
                            ZStack{
                                Image(redPlayer.image)
                                Text(String(redPlayer.mount))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Spacer()
                        Text("Mount")
                            .foregroundColor(textColor)
                        Spacer()
                        
                        Button {
                            addOne(arg: &bluePlayer.mount)
                        } label: {
                            ZStack{
                                Image(bluePlayer.image)
                                Text(String(bluePlayer.mount))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                    
                    //Back
                    HStack{
                        Button {
                            addOne(arg: &redPlayer.back)
                        } label: {
                            ZStack{
                                Image(redPlayer.image)
                                Text(String(redPlayer.back))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Spacer()
                        Text("Back")
                            .foregroundColor(textColor)
                        Spacer()
                        
                        Button {
                            addOne(arg: &bluePlayer.back)
                        } label: {
                            ZStack{
                                Image(bluePlayer.image)
                                Text(String(bluePlayer.back))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                }
                
                Spacer()
                //Save/export btn
                Button {
                    
                } label: {
                    ZStack {
                        Image("button_big")
                        Text("Export")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    }
                }

            }
        }
    }
    //Select name to display
    func nameToDisplay() -> String {
        nameDisplayed = redPlayer.points > bluePlayer.points ? redPlayer.name : bluePlayer.name
        return nameDisplayed
    }
    
    //Add 1
    func addOne(arg: inout Int) {
        arg += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
