//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://jessesquires.com/JSQDataSourcesKit
//
//
//  GitHub
//  https://github.com/jessesquires/JSQDataSourcesKit
//
//
//  License
//  Copyright © 2015 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import UIKit

/**
 A `TitledCollectionReusableView` is a `UICollectionReusableView` subclass with a single `UILabel`
 intended for use as an analog to a `UITableView` header title (via `tableView(_:titleForHeaderInSection:)`)
 when using a `CollectionViewFetchedResultsDelegateProvider`.

 These views can be created via a `TitledCollectionReusableViewFactory`.
 */
public final class TitledCollectionReusableView: UICollectionReusableView {

    // MARK: Properties

    /// The label of the reusable view.
    public private(set) var label: UILabel

    /// The vertical layout insets for the label. The default value is 8.
    public var verticalInset = CGFloat(8) {
        didSet {
            setNeedsLayout()
        }
    }

    /// The horizontal layout insets for the label. The default value is 8.
    public var horizontalInset = CGFloat(8) {
        didSet {
            setNeedsLayout()
        }
    }

    /// :nodoc:
    public override var backgroundColor: UIColor? {
        get {
            return super.backgroundColor
        }
        set {
            super.backgroundColor = newValue
            label.backgroundColor = newValue
        }
    }


    // MARK: Class properties

    /// The default string used to identify instances of `TitledCollectionReusableView`.
    public class var identifier: String {
        get {
            return String(TitledCollectionReusableView.self)
        }
    }

    /// :nodoc:
    override public init(frame: CGRect) {
        label = UILabel()
        super.init(frame: frame)
        addSubview(label)
    }

    /// :nodoc:
    required public init?(coder aDecoder: NSCoder) {
        label = UILabel()
        super.init(coder: aDecoder)
        addSubview(label)
    }

    /// :nodoc:
    override public func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        label.attributedText = nil
    }

    /// :nodoc:
    public override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRectInset(bounds, horizontalInset, verticalInset)
    }
}
