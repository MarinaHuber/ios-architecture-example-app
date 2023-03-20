//
//  CartItemListViewModel.swift
//  MobileShop
//
//  Created by Marina Huber on 20.03.2023..
//

import SwiftUI

class CartItemListViewModel: ObservableObject, CartView {
    @Published var cartContent: CartViewContent
    @Published var payTitle: String = "Pay"

    var delegate: CartViewOutputs?

    init(content: CartViewContent, payTitle: String) {
        self.cartContent = content
        self.payTitle = payTitle
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
