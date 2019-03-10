import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showSpinner(_ sender: Any) {
        
        spinnerView.show()
        // make some network call
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.spinnerView.hide()
        }
    }
    
}

extension UIViewController {
    var spinnerView: SpinnerView {
        let spinner: SpinnerView = SpinnerView.fromNib()
        self.view.addSubview(spinner)
        self.view.bringSubviewToFront(spinner)
        
        return spinner
    }
}
