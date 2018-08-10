require 'pry'
class Transfer
  attr_accessor :amount, :status
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid? #check receiver and sender accounts are valid
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction # can only transfer 1x
    if @sender.balance > @amount && @status == 'pending'
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    else

    end
  end



end #END
