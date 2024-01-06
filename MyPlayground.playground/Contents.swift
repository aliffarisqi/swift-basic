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

let httpError2 = (statusKode:200, description:"Not Found")
print(httpError2.description)

//opsional
var surveyAnswere :String?
surveyAnswere = "test1"
print(surveyAnswere ?? "test")
print(surveyAnswere!)

//opsional konversi
let posibleNumber = "123"
if let actualNumber = Int(posibleNumber){
    print("angka\(posibleNumber) bisa di konversi")
}else{
    print("angka \(posibleNumber) tidak bisa dikonversi")
}

//array
var someAngka = [Int]()
someAngka.append(3)
print(someAngka)
print(someAngka)

someAngka = []

var arrayMahasiswa: [String] = ["bayu", "alif"]
print(arrayMahasiswa)
arrayMahasiswa.append("farisqi")
print(arrayMahasiswa[2])
arrayMahasiswa.insert("after", at:1)
print(arrayMahasiswa)

for (index, mahasiswa) in arrayMahasiswa.enumerated(){
    print(index)
    print(mahasiswa)
}

//SET
var kalimat = Set<Character>()
kalimat.insert("s")
print(kalimat)

var riwayatFilm: Set<String> = ["avatar", "upin-ipin", "unyil"]
print(riwayatFilm)
riwayatFilm.insert("marvels")
print(riwayatFilm)

let oddDigits: Set = [1, 3, 5, 7, 9, 10]
let evenDigits: Set = [0, 2, 2, 4, 4, 6, 8, 10]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

print(oddDigits.union(evenDigits).sorted())
print(oddDigits.intersection(evenDigits).sorted())
print(oddDigits.subtracting(evenDigits).sorted())
print(oddDigits.symmetricDifference(evenDigits).sorted())

let houseAnimals: Set = ["dog", "cat"]
let farmAnimals: Set = ["cow", "chicken", "goat", "dog", "cat"]
let cityAnimals: Set = ["bird", "mouse"]

print(houseAnimals.isSubset(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAnimals))
print(farmAnimals.isDisjoint(with: cityAnimals))
