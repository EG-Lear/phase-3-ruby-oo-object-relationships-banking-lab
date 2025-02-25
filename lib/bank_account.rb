class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(money)
    @balance = @balance + money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @status == 'open'
      if @balance > 0
        true 
      else
        false
      end
    else 
      false
    end
  end

  def close_account
    @status = 'closed'
  end
  
end
