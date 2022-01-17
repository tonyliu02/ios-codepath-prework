import UIKit

class ViewController: UIViewController, UpdateTipsDelegate {
    

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tipPercentages = [0.15, 0.18, 0.2]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Tip Calculator"
        
        
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    // sending data forward
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SettingsViewController {
            let settingsVC = segue.destination as! SettingsViewController
            
            settingsVC.tip1 = tipPercentages[0]
            settingsVC.tip2 = tipPercentages[1]
            settingsVC.tip3 = tipPercentages[2]
            
            
            settingsVC.delegate = self
        }
    }

    func tipUpdate(tip1: String, tip2: String, tip3: String) {
        tipPercentages[0] = Double(tip1) ?? tipPercentages[0]
        tipPercentages[1] = Double(tip2) ?? tipPercentages[1]
        tipPercentages[2] = Double(tip3) ?? tipPercentages[2]
        
    }
}

