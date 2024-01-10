import Cocoa

//MARK: Define resolution vs class
struct Resolution{
    var width = 0
    var height = 0
}
class videoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}

//MARK: Instance
let someResulution = Resolution()
let someVideoMode = videoMode()

print("Width dari struct \(someResulution.width)")
print("Width dari struct \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280

//MARK: Struct merupakan type values artinya
let hd = Resolution(width: 640, height: 480)
var cinema = hd //maka ini akan mencopy hd tanpa mereference nantinya

cinema.width = 120

print("width vga : \(hd.width)")
print("width cinema : \(cinema.width)")

//MARK: Sedangkan class merupakan tipe data reference
let tenEighty = videoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty //not copy but also reference class videomode
alsoTenEighty.frameRate = 30.0

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

print("tenEight: \(tenEighty.frameRate)")
print("alsoTenEight: \(alsoTenEighty.frameRate)")


// MARK: Properti (stored & computed)
// Stored Properti
struct FixedLengthRange{
    var firstValue: Int //Variable stored properti
    let length: Int //Constanta stored properti
}

//Stored variable structure instance
var rangeOfThereeItems = FixedLengthRange(firstValue: 0, length: 40)
print("jangkauan tersebut memiliki nilai : \(rangeOfThereeItems)")

rangeOfThereeItems.firstValue = 5
print("sekarang jangkauannya adalah : \(rangeOfThereeItems)")

//Stored constant structure instance
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 2 (ini error walaupun firstValue var, karena instance let
// hal ini karena struct merupakan value type, berbeda dengan kelas

//lazy stored properti
class DataImporter{
    var filename = "data.txt"
}
class DataManager{
    lazy var importer = DataImporter()
    var data = [String]()
}
let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")

print(manager.importer.filename)
// instance DataImporter untuk properti importer kini telah dibuat
// Menyetak "data.txt"



