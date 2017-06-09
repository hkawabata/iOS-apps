//: Playground - noun: a place where people can play

import UIKit


/* 変数 */
var strVar = "Hello, playground"
strVar = "rewrited"
strVar


/* 定数 */
let strLet = "Hello" + " " + "world!"
// strLet = "rewrited"  // これはエラー
let a = 7
let b = 4
a + b
a - b
a * b
a / b
a % b
print(strVar)


/* 型変換 */
String(a + b)
Int("2")
Int("2.0")
Float("2")
Float("2.0")


/* 文字列に変数埋め込み */
"a = \(a), b = \(b) => a + b = \(a + b)"


/* 型アノテーション */
var x: Int = 3
var y: Float = 3
x/2
y/2


/* 配列 */
var arrVar: [String] = [String]()
arrVar.append("hoge")
arrVar.append("fuga")
arrVar[1]
arrVar[0] = "hogehoge"
arrVar
let arrLet: [String] = [String]()
//arrLet.append("foo")  // これはエラー
let arrLet2 = ["foo", "bar"]


/* 辞書 */
var dic: [String:Int] = [String:Int]()
dic["a"] = 0
dic
dic["a"] = 1
dic["b"] = 2
dic["c"] = 3
dic
var dic2: [String:Int] = ["a":1, "b":2, "c":3]


/* Option */
var strOpt: String?
print(strOpt)
strOpt = "こんにちは"
print(strOpt)
// Option のアンラップ (if let 文)
if let strOpt = strOpt {
    print(strOpt)
}
// このようにアンラップ後の変数に別名をつけても良いが、間違えてアンラップ前の変数を使ってしまうなど、バグにつながるので同じにした方が良い
if let strOptUnwrapped = strOpt {
    print(strOptUnwrapped)
}
// 変数の値を使わないときは _ が使える
if let _ = strOpt {
    print("str_opt is not nil")
}


/* 関数 */
// 引数あり・戻り値ありの関数
func func1(argStr: String) -> String {
    return "__\(argStr)__"
}
func1(argStr: "hoge")
func1(argStr: "fuga")
// 引数なし・戻り値なしの関数
func func2() {
    var v1 = func1(argStr: "hoge")
    var v2 = func1(argStr: "fuga")
    print(v1 + v2)
}
func2()
// 引数に別名をつける（何度も長い引数名を書いたりしなくて済む）
func func3(argIntOfFunction3 argInt: Int) {
    print("argument of func3: \(argInt)")
}
func3(argIntOfFunction3: 12345)
// 呼び出し時に引数名を書かなくても良いようにする
func func4(_ argInt: Int) {
    print("argument of func4: \(argInt)")
}
func4(23456)


/* エラーを投げる・ハンドルする */
enum MyError: Error {
    case HogeFugaMinus
    case HogeFugaZero
}
func errorThrowFunc(_ argInt: Int) throws {
    if argInt < 0 {
        throw MyError.HogeFugaMinus
    } else if argInt == 0 {
        throw MyError.HogeFugaZero
    }
}
do {
    defer {
        // 処理終了時に必ず行いたい処理（あれば）
        // catch 句の前に実行される
        print("必ず行われる処理です")
    }
    try errorThrowFunc(0)
    try errorThrowFunc(-100)
    print("正常終了")
} catch MyError.HogeFugaMinus {
    print("エラー: 負の値です")
} catch MyError.HogeFugaZero {
    print("エラー: ゼロです")
}


/* 既存クラス */
var radio = UISwitch()
radio.isOn
radio.setOn(true, animated: true)
radio
radio.isOn


/* 自作クラス */
class MyClass {
    let strField: String
    let intField: Int
    
    // 引数なしイニシャライザ（コンストラクタ）
    init() {
        self.strField = "empty"
        self.intField = 0
    }
    // 引数ありイニシャライザ（コンストラクタ）
    init(_ str: String, _ int: Int) {
        self.strField = str
        self.intField = int
    }
    
    func printInfo() {
        print("str: \(strField), int: \(intField)")
    }
}
let myClass1 = MyClass()
let myClass2 = MyClass("myClass", 123)
myClass1.printInfo()
myClass2.printInfo()


/* クラスの継承 */
class MyClassChild: MyClass {
    let boolField: Bool
    
    init(_ str: String, _ int: Int, _ bool: Bool) {
        // 継承後追加されたフィールドは、super.init() を呼ぶ前に初期化しないとダメっぽい
        self.boolField = bool
        super.init(str, int)
    }
    
    override func printInfo() {
        print("str: \(strField), int: \(intField), bool: \(boolField)")
    }
}
let myClassChild = MyClassChild("myClassChild", 234, true)
myClassChild.printInfo()


/* 構造体 */
// だいたいクラスと同じだが、継承ができないこと、渡されるときに参照渡しではなくコピーした値渡しであることが特徴
struct MyStruct {
    let strField: String
    let intField: Int
    
    init(_ str: String, _ int: Int) {
        self.strField = str
        self.intField = int
    }
    
    func printInfo() {
        print("str: \(strField), int: \(intField)")
    }
}
let myStruct1 = MyStruct("myStruct", 123)
myStruct1.printInfo()


/* タプル */
let tuple: (Int, String) = (1, "a")
print(tuple)
let (tupleElem1, tupleElem2): (Int, String) = (12345, "abcde")
print(tupleElem1)
print(tupleElem2)



/* 制御文 */
// for-in
for i in 0...3 {
    print(i)
}
for i in 0..<3 {
    print(i)
}
for _ in 0...3 {
    print("hoge")
}
let fruits = ["apple", "orange", "peach"]
for elem in fruits {
    print(elem)
}
let scores = ["a":70, "b":80, "c":100]
for (student, score) in scores {
    print("\(student): \(score)")
}

// for-in-enumerated
for (i, elem) in fruits.enumerated() {
    print("\(i): \(elem)")
}
for (i, elem) in scores.enumerated() {
    print("\(i): \(elem)")
}
for (i, elem) in scores.enumerated() {
    print("\(i): \(elem.key), \(elem.value)")
}

// switch
let c = "b"
switch c {
    case "a":
        print("apple")
    case "b":
        print("bread")
    default:
        print("not matched")
}
let score = 75
switch score {
    case 0...99:
        print("not perfect")
    case 100:
        print("perfect!")
    default:
        print("impossible!")
}
enum Fruit {
    case Apple
    case Orrange
}
let fruit = Fruit.Orrange
switch fruit {
    case .Apple:
        print("Apple")
    case .Orrange:
        print("Orrange")
    default:
        print("invalid")
}

// while
var cnt = 0
while cnt < 3 {
    print(cnt)
    cnt += 1
}