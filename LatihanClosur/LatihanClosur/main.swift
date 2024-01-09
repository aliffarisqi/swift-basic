//
//  main.swift
//  LatihanClosur
//
//  Created by Bayu Alif Farisqi on 09/01/24.
//

import Foundation

// MARK: mendapatkan nilai string dari input pengguna
func getInput(message :String)-> String? {
    print(message, terminator: ":")
    return readLine()
}

// MARK: mendapatkan nilai integer dari input pengguna
func getInputInt(message: String)-> Int? {
    if let inputString = getInput(message: message) {
        return Int(inputString)
    }else{
        return nil
    }
}

// MARK: menampung variable kecepatan
var speedTotal = 0

// MARK: Closur untuk mendapatkan kecepatan
func makeIncrementer(forIncrement amount : Int)->()-> Int {
    func incrementer()-> Int{
        speedTotal += amount
        return speedTotal
    }
    return incrementer
}

// MARK: Closur untuk mengurangi kecepatan
func makeDecrementer(forDecrementer amount :Int)-> () -> Int {
    func decrementer()-> Int{
        speedTotal -= amount
        return speedTotal
    }
    return decrementer
}

// MARK: menentukan nilai penambahan dan nilai pengurangan

let incrementByTen = makeIncrementer(forIncrement: 10)
let decrementByTen = makeDecrementer(forDecrementer: 10)


// MARK: Menyalakan mesin motor listrik
func turnOnEngine() {
    print("Hidupkan mesin.........")
    print("Selamat datang di Motor Listrik Dicoding")
    print("Brem brem brem brem")
}
// MARK: Mematikan mesin motor listrik
func turnOffEngine() {
    print("Ciiiiiiiitttttt......")
    print("Motor berhenti!!!!")
}
func showSpeed() {
    print("Kecepatan saat ini : \(speedTotal)")
    print("Ngeeeeengggggggg")
}

func action(){
    print("----------------------------------------")
    print("Ayo beraksi:")
    print("[1] Tambahkan kecepatan")
    print("[2] Kurangi kecepatan")
    print("[3] Matikan mesin")
    if let state = getInputInt(message: "masukan aksi anda"){
        switch state{
        case 1:
            speedTotal = incrementByTen()
            showSpeed()
            action()
        case 2:
            if speedTotal > 0 {
                speedTotal = decrementByTen()
                showSpeed()
                action()
            } else {
                turnOffEngine()
                break
            }
        case 3:
            turnOffEngine()
            break
            default:
            break
        }
    }else {
        print("Input tidak valid")
    }
}


// MARK: Memulai program
turnOnEngine()
action()
