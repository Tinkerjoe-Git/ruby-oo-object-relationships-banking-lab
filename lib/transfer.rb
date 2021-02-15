require 'pry'
class Transfer
  attr_accessor :bank_account, :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if valid? && sender.balance > @amount && @status=="pending"
      @sender.balance-=@amount
      @receiver.deposit(@amount)
      @status="complete"
    else
      @status="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status=="complete"
      @receiver.balance-=@amount
      @sender.deposit(@amount)
      @status="reversed"
    end
  end







end
