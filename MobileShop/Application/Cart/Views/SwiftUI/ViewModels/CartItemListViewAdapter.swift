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
            // TODO title: "Cart"
    }

    func setLoadingIndicatorVisibility(isHidden: Bool) {
            // TODO
    }

    func showAlert(title: String?, message: String?, actions: [AlertAction], onDismiss: VoidHandler?) {
            // TODO
    }

    func showCartContent(_ cartContent: CartViewContent) {
        self.cartContent = cartContent
    }

}
