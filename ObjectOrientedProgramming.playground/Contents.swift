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


