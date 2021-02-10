require 'rspec'

describe '#Test' do

  describe('#hello_world') do
    it("says Hello World!") do
      test = Test.new()
      expect(test.hello_world()).to(eq("Hello world!"))
    end
  end
end