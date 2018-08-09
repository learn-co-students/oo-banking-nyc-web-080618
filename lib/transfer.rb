class Transfer
  # your code here
  attr_reader :sender, :receiver
  attr_accessor  :status, :amount
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if sender.valid? == false || sender.balance < @amount
      @status ="rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending"

    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
