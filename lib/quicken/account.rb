module Quicken
  class Account < Foundation
    accessors_for_spec Quicken::Spec::ACCOUNT

    def ==(another)
      self.number == another.number &&
      self.type == another.type
    end
    
  end
end