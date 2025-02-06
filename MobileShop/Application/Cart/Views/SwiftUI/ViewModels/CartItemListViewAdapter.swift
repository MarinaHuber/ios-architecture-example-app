//
//  CartItemListViewAdapter.swift
//  MobileShop

import SwiftUI

extension CartViewContent {
    static var empty: Self {
        .init(products: [], discounts: [], total: .init(title: "", amount: ""))
    }
}

class CartItemListViewAdapter: ObservableObject, CartView {
    @Published var cartContent: CartViewContent = .empty
    @Published var payTitle: String = ""
    private var titleLabel: UILabel?
    private var loadingIndicator: UIActivityIndicatorView?
    private var viewController: UIViewController?

    var viewOutputs: CartViewOutputs? {
        didSet {
            viewOutputs?.onViewDidLoad()
        }
    }

    init(content: CartViewContent = .empty, payTitle: String = "", delegate: CartViewOutputs? = nil) {
        self.cartContent = cartContent
        self.payTitle = payTitle
        self.viewOutputs = delegate
    }

    func setPayButtonTitle(_ title: String) {
        self.payTitle = title
    }

    func setTitle(_ title: String) {
        titleLabel?.text = title
    }

    func setLoadingIndicatorVisibility(isHidden: Bool) {
        loadingIndicator?.isHidden = isHidden
    }

    func showAlert(title: String?, message: String?, actions: [AlertAction], onDismiss: VoidHandler?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            let alertAction = UIAlertAction(title: action.title, style: action.style, handler: { _ in action.handler?() })
            alertController.addAction(alertAction)
        }
        viewController?.present(alertController, animated: true, completion: onDismiss)
    }

    func showCartContent(_ cartContent: CartViewContent) {
        self.cartContent = cartContent
    }

}
