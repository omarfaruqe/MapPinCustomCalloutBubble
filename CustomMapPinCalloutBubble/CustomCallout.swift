import Foundation

import MapKit

class CustomCallout: UIView {
    var times:Int = 0

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func rightAction(sender: UIButton) {
    }
    
    @IBAction func leftAction(sender: UIButton) {
    }
    
    @IBAction func editAction(sender: UIButton) {
        
        times++
        titleLabel.text = "Title: \(times)"
        descriptionLabel.text = "Description: \(times)"
        timeLabel.text = "Time: \(times)"
        var imageName:String = "id\(times % 4)"
        imageView.image = UIImage(named: imageName)
    }
    
    
    override func hitTest(var point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let viewPoint = superview?.convertPoint(point, toView: self) ?? point
        
        let isInsideView = pointInside(viewPoint, withEvent: event)
        
        var view = super.hitTest(viewPoint, withEvent: event)
        
        return view
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return CGRectContainsPoint(bounds, point)
    }
}
