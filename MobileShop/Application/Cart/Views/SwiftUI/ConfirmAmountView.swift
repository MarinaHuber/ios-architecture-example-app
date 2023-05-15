//
//  ConfirmAmountView.swift
//  MobileShop

import SwiftUI

struct ConfirmAmountView: View {
    @ObservedObject var viewModel: CartItemListViewAdapter

    var body: some View {
        VStack {
            HStack {
                Text("Amount: ")
                Text(viewModel.cartContent.total.amount).bold()
            }
            Text("Your credit card will be charged after confirmation")
                .padding()
                .multilineTextAlignment(.center)
            Button {

            } label: {
                Text("Confirm payment")
                    .padding(20)
            }
        }
    }
}

struct ConfirmAmountView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmAmountView(viewModel: CartItemListViewAdapter(content: .init(products: [], discounts: [], total: .init(title: "Total", amount: "$82")), payTitle: ""))
    }
}
