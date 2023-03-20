//
//  CartItemListView.swift
//  MobileShop


import SwiftUI

struct CartItemListView: View {

    @ObservedObject var viewModel: CartItemListViewModel

    var body: some View {

        List(viewModel.cartContent.products, id: \.title) { product in
            HStack {
                Text(product.title)
                Spacer()
                VStack(alignment: .trailing) {
                    Text(product.price)
                    Text(product.quantity)
                    Text(product.discount ?? "")
                }
            }
        }
        .onAppear(perform: {
            self.viewModel.delegate?.onViewDidLoad()
        })
    }
}
struct CartItemListView_Previews: PreviewProvider {
    static var previews: some View {

        CartItemListView(viewModel: CartItemListViewModel(content: .init(products: [
            CartProductItemViewContent(title: "Cotton T-shirt", price: "$19.99", quantity: "x2", discount: nil),
            CartProductItemViewContent(title: "Baseball cap", price: "$21.99", quantity: "x1", discount: "5% off"),
            CartProductItemViewContent(title: "Premium T-shirt", price: "$29.99", quantity: "x1", discount: "10% off"),
            CartProductItemViewContent(title: "Coupon discount", price: "", quantity: "", discount: "5% off")
        ], discounts: [], total: .init(title: "Total", amount: "12")), payTitle: "Pay"))
    }
}
