//
//  CartItemView.swift
//  MobileShop
//
//  Created by Marina Huber on 20.03.2023..
//

import SwiftUI

struct CartItemView: View {

    @ObservedObject var viewModel: CartItemListViewModel

    var body: some View {
        NavigationView {
            VStack {
                CartItemListView(viewModel: viewModel)
                HStack {
                    Text("Total:").bold()
                    Text("$25")
                }
            }.navigationBarTitle("Cart")
                .toolbar {
                    Button("Pay") {
                      //show confirm amount view
                    }
                }
        }
        .onAppear(perform: {
            self.viewModel.delegate?.onViewDidLoad()
        })
    }
}
struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {

        CartItemView(viewModel: CartItemListViewModel(content: .init(products: [
            CartProductItemViewContent(title: "Cotton T-shirt", price: "$19.99", quantity: "x2", discount: nil),
            CartProductItemViewContent(title: "Baseball cap", price: "$21.99", quantity: "x1", discount: "5% off"),
            CartProductItemViewContent(title: "Premium T-shirt", price: "$29.99", quantity: "x1", discount: "10% off"),
            CartProductItemViewContent(title: "Coupon discount", price: "", quantity: "", discount: "5% off")
        ], discounts: [], total: .init(title: "Total", amount: "12"))))
    }
}

