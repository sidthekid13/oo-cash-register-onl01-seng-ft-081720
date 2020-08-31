class CashRegister
    attr_accessor :total, :discount, :price, :items, :last_transaction_amount

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += (price*quantity)
        if quantity > 1
            amount = 0
            while amount < quantity
                @items << title
                amount += 1
            end
        else
            @items << title
        end
        self.last_transaction_amount = price*quantity
    end

    def apply_discount
        if @discount > 0 
            @discount = @discount/100.to_f 
            @total = @total - (@total*(@discount))
            "After the discount, the total comes to $#{total.to_i}."
        else
            "There is no discount to apply."    
        end  
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction_amount
    end

end

