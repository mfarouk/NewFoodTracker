//
//  RatingControl.swift
//  NewFoodTracker
//
//  Created by Farouk Talatini on 9/22/19.
//  Copyright © 2019 Farouk Talatini. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    
    
    //MARK: Private Methods
    private func setupButtons() {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        /*
         disables the button’s automatically generated constraints.
         */
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        /*
         The lines starting with button.heightAnchor and button.widthAnchor create the constraints that define the button’s height and width. Each line performs the following steps:
         
         The button’s heightAnchor and widthAnchor properties give access to layout anchors. You use layout anchors to create constraints—in this case, constraints that define the view’s height and width, respectively.
         
         The anchor’s constraint(equalToConstant:) method returns a constraint that defines a constant height or width for the view.
         
         The constraint’s isActive property activates or deactivates the constraint. When you set this property to true, the system adds the constraint to the correct view, and activates it.
         
         Together, these lines define the button as a fixed-size object in your layout (44 point x 44 point).
         */
        // Add the button to the stack
        addArrangedSubview(button)
        
        // Setup the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        /*
         The target is self, which refers to the current instance of the enclosing class. In this case, it refers to the RatingControl object that is setting up the buttons.
         
         The #selector expression returns the Selector value for the provided method. A selector is an opaque value that identifies the method. Older APIs used selectors to dynamically invoke methods at runtime. While newer APIs have largely replaced selectors with blocks, many methods—like performSelector(_:) and addTarget(_:action:forControlEvents:)—still take selectors as arguments. In this example, the #selector(RatingControl.ratingButtonTapped(_:)) expression returns the selector for your ratingButtonTapped(_:) action method. This lets the system call your action method when the button is tapped.
         
         The UIControlEvents option set defines a number of events that controls can respond to. Typically buttons respond to the .touchUpInside event. This occurs when the user touches the button, and then lifts their finger while the finger is still within the button’s bounds. This event has an advantage over .touchDown, because the user can cancel the event by dragging their finger outside the button before lifting it.
         
         Note that because you’re not using Interface Builder, you don’t need to define your action method with the IBAction attribute; you just define the action like any other method. You can use a method that takes no arguments, that takes a single sender argument, or that takes both a sender and an event argument.
         */
    }
    
}
