import Cocoa

//MARK: Define resolution vs class
struct Resolution{
    var width = 0
    var heigth = 0
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
