//
//  CartItemListViewModel.swift
//  MobileShop
//
//  Created by Marina Huber on 20.03.2023..
//

import SwiftUI

class CartItemListViewModel: ObservableObject, CartView {
    @Published var cartContent: CartViewContent

    var delegate: CartViewOutputs?

    init(content: CartViewContent) {
        self.cartContent = content
    }
    func setPayButtonTitle(_ title: String) {
            //  1. TODO
            //  2. snapshot testing dodati, uspredjivanje testa
    }

    func setTitle(_ title: String) {
            // TODO
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
