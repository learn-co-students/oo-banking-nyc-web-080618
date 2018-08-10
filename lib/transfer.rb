class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status, :count
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    @count = 0
  end

  def self.transfer(sender, receiver, amount)

  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
end

   def execute_transaction
      if sender.balance < amount
         @status = "rejected"
         "Transaction rejected. Please check your account balance."
      elsif @count == 0
       sender.balance -= amount
       receiver.balance += amount
       @status = "complete"
       @count += 1
      elsif @count >= 1
       return
     end
   end

  def reverse_transfer
    if @count >= 1
    sender.balance += amount
    receiver.balance -= amount
    @status = "reversed"
    elsif count == 0
      return
    end
  end

end
