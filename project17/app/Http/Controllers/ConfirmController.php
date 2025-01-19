<?php

namespace App\Http\Controllers;

use App\Http\ProductTrait;
use App\Models\Cart;
use App\Models\Confirm;
use App\Models\Product;

class ConfirmController extends Controller
{
    use ProductTrait;







    public function addToConfirm() {
        $user = auth()->user();
        $cart = Cart::where('is_visible', true)->where('user_id', $user->id);
        if($cart->get()->isEmpty()){
            return response('cart is empty', 400);
        }
        $price = $this->getTotalPrice();
        $confirm = Confirm::create([
            'user_id'=>$user->id,
            'user_location'=>$user->user_location,
            'price'=>$price,
            'card_password'=>request()->card_password,
            'status'=>'pending',
            'card_number'=>request()->card_number
        ])->id;
        $cart->update([
            'confirm_id'=>$confirm,
                'is_visible'=>false
        ]);
        $message = "confirmed successfully \n the totla price is:\n $price $";
        $this->sendSms($user->user_phone, $message);
        return response('confirmed successfully', 200);
    }






    public function cancelOrder() {
        $confirm = Confirm::find(request()->confirm_id);
        if ($confirm->status == 'pending'){
            $confirm->update([
                'status'=>'canceled'
            ]);
            $carts = $confirm->carts();
            foreach ($carts as $cart) {
                $product = Product::find($cart->product_id);
                $product->update([
                    'count'=>$cart->count + $product->count
                ]);
            }
        }
        else {
            return response("can't cancel the order", 400);
        }
        $this->sendSms(auth()->user()->user_phone, 'canceld order successfully');
        return response('canceled successfully', 200);
    }








    public function getOrderStatus() {
        $orders = Confirm::where('user_id', auth()->user()->id)->get(['id', 'status', 'created_at', 'price', 'user_location']);

        $temp = [];
        for ($j=0; $j < $orders->count(); $j++) {
            $products = Confirm::find($orders[$j]->id)->carts();
            $temp = array();
        for ($i=0; $i < $products->count(); $i++) {
            $product = Cart::find($products[$i]->id)->products();
            $product['count'] = $products[$i]->count;
            array_push($temp, $product);
        }
        $orders[$j]['product_details'] = $temp;
    }
        return response($orders, 200);
    }


    public function getUserOrders() {
        $orders = Confirm::where('user_id', auth()->user()->id)->where('status', 'pending')->get(['id', 'status', 'created_at', 'price', 'user_location']);
        for ($j=0; $j < $orders->count(); $j++) {
            $products = Confirm::find($orders[$j]->id)->carts();
            $temp = array();
        for ($i=0; $i < $products->count(); $i++) {
            $product = Cart::find($products[$i]->id)->products();
            $product['count'] = $products[$i]->count;
            array_push($temp, $product);
        }
        $orders[$j]['product_details'] = $temp;
    }
        return response($orders, 200);
}
}
