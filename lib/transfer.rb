class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  attr_reader :transaction

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if @sender.valid? == true
      if @receiver.valid?  == true
        if @sender.balance >= @amount
          true
        else
          false
        end
      else
        false
      end
    else
      false
    end
  end

  def execute_transaction
    if valid? == true
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = 'complete'
      @transaction = @amount
      @amount = 0
      
    else 
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance = @sender.balance + @transaction
      @receiver.balance = @receiver.balance - @transaction
      @status = 'reversed'
    end
  end
end
