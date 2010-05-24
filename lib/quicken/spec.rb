module Quicken
  module Spec
    ACCOUNT = {
      :number => /^N(.+)/,
      :type   => /^T(.+)/
    }

    TRANSACTION = {
      :number                     => /^N(.+)/,
      :amount                     => /^T(.+)/,
      :date                       => /^D(.+)/,
      :memo                       => /^M(.+)/,
      :cleared                    => /^C(.+)/,
      :payee                      => /^P(.+)/,
      :address                    => /^A(.+)/,
      :category                   => /^L(.+)/,
      :flag                       => /^F(.+)/,
      :investment                 => /^N(.+)/,
      :investment_security        => /^Y(.+)/,
      :investment_price           => /^I(.+)/,
      :investment_shares_quantity => /^Q(.+)/,
      :investment_commission      => /^O(.+)/,
      :split_category             => /^S(.+)/,
      :split_memo                 => /^E(.+)/,
      :split_percentage           => /^\%(.+)/,
      :split_or_investment_amount => /^\$(.+)/
    }

  end
end