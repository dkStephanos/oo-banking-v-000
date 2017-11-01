class BankAccount
  attr_accessor :balance, :status, :name

  def initialize(name)
    @balance = 1000
    @status = "open"
    @name = name
  end

  def name=(name)
    raise ArgumentError.new("Can't change the name of a bank account!")
  end

end
