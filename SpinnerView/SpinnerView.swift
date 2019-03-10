import UIKit

class SpinnerView: UIView {

    @IBOutlet weak var squareContainer: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        
        squareContainer.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        squareContainer.layer.cornerRadius = 12
        
        self.spinner.isHidden = true
    }
    
    func show() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.setNeedsLayout()

            self.squareContainer.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.spinner.isHidden = false
            
            self.layoutIfNeeded()
        })
        
        spinner.startAnimating()
    }
    
    func hide() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            self.setNeedsLayout()
            
            self.squareContainer.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
            self.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
            self.spinner.isHidden = true
            
            self.layoutIfNeeded()
        })

        spinner.stopAnimating()
    }
}
