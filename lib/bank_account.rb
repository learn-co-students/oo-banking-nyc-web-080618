require 'pry'
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize (name)
    @name = name
    @balance = 1000
    @status = 'open'
  end


  def deposit(amt)  #add money to account
    @balance += amt
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid? #is valid with an open status and a balance greater than 0
    if self.balance > 0 && self.status == 'open'
      true
    else
      false
    end
  end
# binding.pry
  def close_account
    self.status = 'closed'
  end

end #END
