import UIKit

class ViewController: UIViewController, UpdateTipsDelegate {
    

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    var tipPercentages = [0.15, 0.18, 0.2]
    var selectedPercentageIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tip Calculator"
        
        
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        selectedPercentageIndex = tipControl.selectedSegmentIndex
        let tip = bill * tipPercentages[selectedPercentageIndex]
        
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onValueChanged(_ sender: UITextField) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tip = bill * tipPercentages[selectedPercentageIndex]

        let total = bill + tip

        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
//    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
//        super.pressesBegan(presses, with: event)
//
//        let bill = Double(billAmountTextField.text!) ?? 0
//
//        let tip = bill * tipPercentages[selectedPercentageIndex]
//
//        let total = bill + tip
//
//        tipAmountLabel.text = String(format: "$%.2f", tip)
//        totalLabel.text = String(format: "$%.2f", total)
//    }
    
    
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

    // get the updated tips from the settings and update tipsPercentages array
    func tipUpdate(tip1: String, tip2: String, tip3: String) {
        tipPercentages[0] = Double(tip1) ?? tipPercentages[0]
        tipPercentages[1] = Double(tip2) ?? tipPercentages[1]
        tipPercentages[2] = Double(tip3) ?? tipPercentages[2]
        
        // change the label text on the segmented control
        tipControl.setTitle(String(tipPercentages[0]), forSegmentAt: 0)
        tipControl.setTitle(String(tipPercentages[1]), forSegmentAt: 1)
        tipControl.setTitle(String(tipPercentages[2]), forSegmentAt: 2)
    }
}

