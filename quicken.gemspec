# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{quicken}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Lopes"]
  s.date = %q{2010-05-27}
  s.description = %q{QIF (Quicken Interchange Format) parser}
  s.email = %q{danielvlopes@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/quicken.rb",
     "lib/quicken/account.rb",
     "lib/quicken/foundation.rb",
     "lib/quicken/parser.rb",
     "lib/quicken/spec.rb",
     "lib/quicken/transaction.rb",
     "quicken.gemspec",
     "spec/fixtures/bco_real.qif",
     "spec/fixtures/default.qif",
     "spec/fixtures/ms_money.qif",
     "spec/quicken/account_spec.rb",
     "spec/quicken/foundation_spec.rb",
     "spec/quicken/parser_spec.rb",
     "spec/quicken/spec_spec.rb",
     "spec/quicken/transaction_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/support/macros/foundation_macro.rb",
     "spec/support/matchers/money_matcher.rb"
  ]
  s.homepage = %q{http://github.com/danielvlopes/quicken}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{simple QIF parser}
  s.test_files = [
    "spec/quicken/account_spec.rb",
     "spec/quicken/foundation_spec.rb",
     "spec/quicken/parser_spec.rb",
     "spec/quicken/spec_spec.rb",
     "spec/quicken/transaction_spec.rb",
     "spec/spec_helper.rb",
     "spec/support/macros/foundation_macro.rb",
     "spec/support/matchers/money_matcher.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
  end
end

