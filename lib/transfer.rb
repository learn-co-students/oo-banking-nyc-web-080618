class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender,receiver,amount)
    @status = 'pending'
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if sender.valid? == false || sender.balance < @amount
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    elsif @status == 'pending'
      sender.balance -= @amount
      receiver.balance += @amount
      @status = 'complete'
    end
  end

  def reverse_transfer
    if @status == 'complete'
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
