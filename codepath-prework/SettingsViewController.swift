import UIKit

// protocol used for sending data back
protocol UpdateTipsDelegate: AnyObject {
    func tipUpdate(tip1: String, tip2: String, tip3: String)
}

class SettingsViewController: UIViewController {

    var tip1: Double = 0.0
    var tip2: Double = 0.0
    var tip3: Double = 0.0
    
    weak var delegate: UpdateTipsDelegate?
    
    @IBOutlet weak var tip1Text: UITextField!
    @IBOutlet weak var tip2Text: UITextField!
    @IBOutlet weak var tip3Text: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // get the data from the main view controller and display the tips
        tip1Text.text = String(tip1)
        tip2Text.text = String(tip2)
        tip3Text.text = String(tip3)
    }
    
    
    @IBAction func saveData(_ sender: Any) {
        let tip1 = tip1Text.text ?? ""
        let tip2 = tip2Text.text ?? ""
        let tip3 = tip3Text.text ?? ""
        delegate?.tipUpdate(tip1: tip1, tip2: tip2, tip3: tip3)
        // go back to the previous vc
        navigationController!.popViewController(animated: true)
    }
    
}
