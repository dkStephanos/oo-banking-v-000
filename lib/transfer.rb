class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.valid? && @staus == "pending"
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if self.valid? && @status == "complete"
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
end
