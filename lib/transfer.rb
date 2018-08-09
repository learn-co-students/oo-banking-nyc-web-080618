require "pry"

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount || valid? == false
     @status = "rejected"
     return "Transaction rejected. Please check your account balance."
      elsif @status != "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end


  end
end
