//
//  CartSnapshotTests.swift
//  MobileShopTests


import SnapshotTesting
import XCTest
@testable import MobileShop

class CartSnapshotTests: XCTestCase {

    func testSwiftUICartView() {
            //given
        let cartView = CartItemView(viewModel: CartItemListViewModel(content: .init(products: [
            CartProductItemViewContent(title: "Cotton T-shirt", price: "$19.99", quantity: "x2", discount: nil),
            CartProductItemViewContent(title: "Baseball cap", price: "$21.99", quantity: "x1", discount: "5% off"),
            CartProductItemViewContent(title: "Premium T-shirt", price: "$29.99", quantity: "x1", discount: "10% off"),
            CartProductItemViewContent(title: "Coupon discount", price: "", quantity: "", discount: "5% off")
        ], discounts: [], total: .init(title: "Total", amount: "$85")), payTitle: "Pay"), showPayView: true)
            //then
        assertSnapshot(matching: cartView, as: .image)
    }

    func testSwiftUIConfirmAmountView() {
        //given
        let confirmView = ConfirmAmountView(viewModel: CartItemListViewModel(content: .init(products: [], discounts: [], total: .init(title: "Amount", amount: "$85")), payTitle: ""))
        //when
        //then
        assertSnapshot(matching: confirmView, as: .image)
    }
}
