require 'spec_helper'
require_relative '../../../lib/rubocop/foo_method'

RSpec.describe RuboCop::Cop::Deprecation::FooMethod do
  subject(:cop) { described_class.new }

  # it 'registers an offen for usages of #foo' do
  #   expect_offense(<<~RUBY)
  #     foo
  #     ^^^ Use `#bar` instead of `#foo`.
  #   RUBY
  # end

  it 'registers an offen for usages of #foo2' do
    expect_offense(<<~RUBY)
      class Foo
        include Bar
      end
      foo
      ^^^ Use `#bar` instead of `#foo`.
    RUBY
  end
end
