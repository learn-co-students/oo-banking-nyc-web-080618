class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end # end initialize

  def deposit(amount)
    @balance += amount
  end # end deposit

  def display_balance
    "Your balance is $#{@balance}."
  end # end display_balance

  def valid?
    if @balance > 0 && @status == "open"
      true
    else
      false
    end # end if @balance
  end # end valid?

  def close_account
    @status = "closed"
  end # end close_account

end # end class BankAccount
