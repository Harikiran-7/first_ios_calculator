import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var t1: UITextField!
    
    enum Operation {
        case none
        case addition
        case subtraction
        case multiplication
        case division
    }
    @IBOutlet weak var t2: UITextField!
    @IBOutlet weak var t3: UITextField!
    
    
    var prev: Int = 0
    var currentOperation: Operation = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var str:String=""
    @IBAction func b0(_ sender: UIButton) {
        appendDigit("0")
        str = str+"0"
    }

    @IBAction func b1(_ sender: UIButton) {
        appendDigit("1")
        str = str+"1"
    }
    
    @IBAction func b2(_ sender: UIButton) {
        appendDigit("2")
        str = str+"2"
    }
    
    @IBAction func b3(_ sender: UIButton) {
        appendDigit("3")
        str = str+"3"
    }
    
    @IBAction func b4(_ sender: UIButton) {
        appendDigit("4")
        str = str+"4"
    }
    
    @IBAction func b5(_ sender: UIButton) {
        appendDigit("5")
        str = str+"5"
    }
    
    @IBAction func b6(_ sender: UIButton) {
        appendDigit("6")
        str = str+"6"
    }
    
    @IBAction func b7(_ sender: UIButton) {
        appendDigit("7")
        str = str+"7"
    }
    
    @IBAction func b8(_ sender: UIButton) {
        appendDigit("8")
        str = str+"8"
    }
    
    @IBAction func b9(_ sender: UIButton) {
        appendDigit("9")
        str = str+"9"
    }

    @IBAction func plus(_ sender: UIButton) {
        setCurrentOperation(.addition)
        str = str+"+"
    }
    
    @IBAction func sub(_ sender: UIButton) {
        setCurrentOperation(.subtraction)
        str = str+"-"
    }
    
    @IBAction func mul(_ sender: UIButton) {
        setCurrentOperation(.multiplication)
        str = str+"*"
    }
    
    @IBAction func div(_ sender: UIButton) {
        setCurrentOperation(.division)
        str = str+"/"
    }
    
    @IBAction func clear(_ sender: UIButton) {
        t1.text = ""
        prev = 0
        currentOperation = .none
    }
    @IBAction func check(_ sender: UIButton) {
        t3.text = str
    }
    
    @IBAction func erase(_ sender: UIButton) {
        t3.text=""
        str=""
    }
    
    
    @IBAction func equal(_ sender: UIButton) {
        if let text = t1.text, let currentValue = Int(text) {
            var result = prev
            
            switch currentOperation {
            case .addition:
                result += currentValue
            case .subtraction:
                result -= currentValue
            case .multiplication:
                result *= currentValue
            case .division:
                // Avoid divide by zero error
                result = currentValue != 0 ? result / currentValue : 0
            case .none:
                break
            }
            
            t1.text = String(result)
            prev = result
            currentOperation = .none
        }
    }

    // Helper Functions
    private func appendDigit(_ digit: String) {
        if let text = t1.text {
            t1.text = text + digit
        }
    }
    
    private func setCurrentOperation(_ operation: Operation) {
        if let text = t1.text, let intValue = Int(text) {
            prev = intValue
            t1.text = ""
            currentOperation = operation
        }
    }
}

