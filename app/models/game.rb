class Game < ActiveRecord::Base
  attr_accessible :guess, :lower_bound, :upper_bound, :answer, :ub_set, :lb_set
  validates :guess, :answer, :presence => true

  before_validation :set_defaults_if_necessary
  
  
  
  def set_defaults_if_necessary
    if self.lb_set == nil
      self.lb_set = false
    end
    if self.ub_set == nil
      self.ub_set = false
    end
    if self.guess == nil
      self.guess = 0
    end
    if self.answer == nil
      self.answer = 0
    end
  end
  
  def answered?
    (self.upper_bound == self.lower_bound)&&!(self.ub_set == false && self.lb_set == false)
  end
  
  def answered(new_guess)
    if (new_guess == self.upper_bound)||(new_guess == self.lower_bound)
      -1
    else
      0
    end
  end
  
  def update_lower
    temp_guess = self.guess
    if !(self.answered?)
      if self.lb_set == false
        if self.guess.to_i == 0
          temp_guess = -1
        else
          temp_guess = 2*self.guess.to_i
        end
      else
        temp_guess = (temp_guess + self.lower_bound)/2
      end
    end
    temp_guess
  end
  
  def update_higher
    temp_guess = self.guess
    if !(self.answered?)
      if self.ub_set == false
        if self.guess.to_i == 0
          temp_guess = 1
        else
          temp_guess = 2*self.guess.to_i
        end
      else
  	temp_guess = (self.upper_bound + temp_guess)/2
      end
    end
    temp_guess
  end
  
  def safe_new_bound
    safe_bound = 0
    if !(self.guess.to_i == 0)
      safe_bound = self.guess   
    end
    safe_bound
  end
end
