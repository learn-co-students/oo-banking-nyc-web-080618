class Transfer

  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @count = 0
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    if @status == "pending"
      if valid?
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
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
