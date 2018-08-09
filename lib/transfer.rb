require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end # end initialize

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end # end if @sender.valid?
  end # end valid?

  def sender_has_enough_money?
    if @sender.balance >= @amount
      true
    else
      false
    end # end @sender.balance
  end # end sender_has_enough_money?

  def execute_transaction
    if valid? && @status != "complete" && sender_has_enough_money?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end # end if valid?
  end # end execute_transaction

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end # end if @status
  end # end reverse_transfer

end # end class Transfer

# bob = BankAccount.new("Bob")
# bob.balance = 0
# jack = BankAccount.new("Jack")
# transfer = Transfer.new(bob, jack, 50)
#
# binding.pry
