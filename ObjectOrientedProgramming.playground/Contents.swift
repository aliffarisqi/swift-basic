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


//MARK: Computed Properti
struct Point{
    var x = 0.0, y = 0.0
}

struct shape{
    var origin = Point()
    var center: Point{
        get{
            return Point(x: origin.x/2, y: origin.y/2)
        }
        set(newCenter){
            origin.x = newCenter.x/2
            origin.y = newCenter.y/2
        }
    }
}

//MARK: Properti Observer
class StepCounter{
    var totalSteps: Int = 0{
        willSet(newSteps){
            print("About to set totalSteps to \(newSteps)")
        }
        didSet{
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 50

stepCounter.totalSteps = 150

stepCounter.totalSteps = 420


//MARK: Methods
class Counter{
    //attribute / properti
    var count = 0
    
    //methods
    func increment(){
        count += 1
    }
    
    //methods
    func incrementBy(amount: Int){
        count += amount
    }
    
    //methods
    func reset(){
        count = 0
    }
}

let counter = Counter()

counter.increment()
print("nilai count saat ini : \(counter.count)")
counter.incrementBy(amount: 4)
print("nilai count saat ini : \(counter.count)")
counter.reset()
print("nilai count saat ini : \(counter.count)")


// MARK: Self pada class atau struct
// digunakan untuk membedakan nama parameter dan nama properti

struct PointDua {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = PointDua(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
   print("This point is to the right of the line where x == 1.0")
}

//MARK: Modifying Value Types
struct PointTiga {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}
var somePointTiga = PointTiga(x: 1.0, y: 1.0)
somePointTiga.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePointTiga.x), \(somePointTiga.y))")

let fixedPoint = PointTiga(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0) (ERROR karena konstanta structure)

//MARK: Assigning to self Within a Mutating Method
// metode ini sama dengan sebelumnya
struct PointEmpat {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        self = PointEmpat(x: x + deltaX, y: y + deltaY)
    }
}

//MARK: Type Methods
class SomeClassSatu{
    static func someTypedFunc(){
        print("type methods")
    }
}
SomeClassSatu.someTypedFunc()

//MARK: Instance methods
class SomeClassDua{
    func someInstanceMethods(){
        print("instance methods")
    }
}

var someClassInstance = SomeClassDua()
someClassInstance.someInstanceMethods()
