import Cocoa

var greeting = "Hello, playground"
print(greeting)

//variable and constant
let maximumLogginAttemps :Int = 10 //tidak bisa berubah
var loginAttemps :Int = 10 //bisa berubah
print(loginAttemps)

//deklarasi multi
var nama :String = "bayu", alamat :String = "danareja";
var dataDiri = nama + alamat
print(dataDiri)
print(nama+alamat)

//floating number vs double
let apple = 2.4
let banana: Double = 3.0 //64bit
let melon:Float = 5.4 //32bit

//type inference
let keliling = 12 //kompiler secara otomatis menentukan tipe data
let phi = 3.14 //swift akan memilih double dibanding float

let kelilingPhi = 12 + 3.14 // maka tipe akan menjadi double

//tuple
let httpError = (404, "Not Found")
print(httpError)
let (statusCode, statusMessage) = httpError
print(statusCode)
