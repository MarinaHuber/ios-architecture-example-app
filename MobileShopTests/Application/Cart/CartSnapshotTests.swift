//
//  CartSnapshotTests.swift
//  MobileShopTests


import SnapshotTesting
import XCTest
import SwiftUI
@testable import MobileShop

class CartSnapshotTests: XCTestCase {

    override func setUp() {
        super.setUp()
        SnapshotTesting.diffTool = "ksdiff"
    }

    func testSwiftUICartViewFullWithProducts() {
        let cartView = CartItemView(viewModel: CartItemListViewAdapter(content: .init(products: [
            CartProductItemViewContent(title: "Cotton T-shirt", price: "$19.99", quantity: "x2", discount: nil),
            CartProductItemViewContent(title: "Baseball cap", price: "$21.99", quantity: "x1", discount: "5% off"),
            CartProductItemViewContent(title: "Premium T-shirt", price: "$29.99", quantity: "x1", discount: "10% off"),
            CartProductItemViewContent(title: "Coupon discount", price: "", quantity: "", discount: "5% off")
        ], discounts: [], total: .init(title: "Total", amount: "$85")), payTitle: "Pay"), showPayView: true).referenceFrame()

        assertSnapshot(matching: cartView, as: .image(
            layout: .fixed(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height),
            traits: .init(userInterfaceStyle: .light)
        ))
    }
    
    func testSwiftUIConfirmAmountView() {
        let confirmView = ConfirmAmountView(viewModel: CartItemListViewAdapter(content: .init(products: [], discounts: [], total: .init(title: "Amount", amount: "$85")), payTitle: "")).referenceFrame()

        assertSnapshot(matching: confirmView, as: .image(
            layout: .fixed(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height),
            traits: .init(userInterfaceStyle: .light)
        ))
    }
}

private extension SwiftUI.View {
    func referenceFrame() -> some View {
        let referenceSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        return self.frame(width: referenceSize.width, height: referenceSize.height)
    }
}
