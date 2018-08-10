class Transfer

  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance < @amount || @sender.valid? == false || @receiver.valid? == false
        @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending" && @sender.valid? && @receiver.valid?
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  end
  end

  def reverse_transfer
    if @status == "complete"
    @sender.balance += @amount
    @receiver.balance -= @amount
  end
  @status = "reversed"
  end

end #end of class
