require 'pry'
require_relative 'bank_account.rb'
require_relative 'transfer.rb'

one = Transfer.new('someone', 'maddy', 50) ##new Transfer
user = BankAccount.new('maddy') ##new BankAccount


binding.pry
