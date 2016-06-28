
import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var costInput: UITextField!
	@IBOutlet weak var tipPercentInput: UISegmentedControl!
	@IBOutlet weak var tipCostOutput: UITextField!
	@IBOutlet weak var totalCostOutput: UITextField!
	
	let tips: [Double] = [15, 18, 20]
	
	func updateVals() {
		
		if let text=costInput.text, cost=Double(text) {
			
			let selectedTip = tips[tipPercentInput.selectedSegmentIndex]
			let tipCost = (selectedTip/100.0)*cost
			let totalCost=tipCost+cost
			
			tipCostOutput.text="Tip: $\(tipCost)"
			totalCostOutput.text="Total: $\(totalCost)"
		}
		else {
			
			tipCostOutput.text="Tip"
			totalCostOutput.text="Total"
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tipPercentInput.removeAllSegments()
		
		for i in 0..<tips.count {
			
			tipPercentInput.insertSegmentWithTitle("\(tips[i])%", atIndex: i, animated: true)
		}
		
		tipPercentInput.selectedSegmentIndex = 0
		
		updateVals()
    }
	
	@IBAction func textTyped(sender: AnyObject) {
		
		updateVals()
	}
	
	@IBAction func tipPercentSelected(sender: AnyObject) {
		
		updateVals()
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

