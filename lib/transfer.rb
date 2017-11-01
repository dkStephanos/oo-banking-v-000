class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return true unless sender.valid? || receiver.valid?
  end

  def execute_transaction
    if self.valid? && @staus = "pending"
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "succesful"
    end
  end

  def reverse_transfer
    if self.valid? && @status = "succesful"
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
end
