//
//  CartItemListView.swift
//  MobileShop


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

struct CartItemListView: View {

    @ObservedObject var viewModel: CartItemListViewModel

    var body: some View {
            NavigationView {
                VStack {
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
                    Text("Total:")
                }.navigationBarTitle("Cart")
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
        ], discounts: [], total: .init(title: "Total", amount: "12"))))
    }
}
