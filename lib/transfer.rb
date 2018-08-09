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
    @sender.valid? && @receiver.valid? && (@sender.balance >= @amount)
  end

  def execute_transaction
    if @count == 0
      if valid?
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
        @count += 1
      else
        @status = "rejected"
        @count += 1
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
