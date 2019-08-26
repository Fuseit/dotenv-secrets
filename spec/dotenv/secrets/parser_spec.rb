require 'spec_helper'

RSpec.describe Dotenv::Parser do
  def env(string)
    Dotenv::Parser.call(string, true)
  end

  let(:secret_path) { 'example://path/to/secret#SECRET_KEY' }

  it "parses unquoted values" do
    expect(env("FOO=#{secret_path}")).to eql("FOO" => "bar")
  end

  it "parses values with spaces around equal sign" do
    expect(env("FOO =#{secret_path}")).to eql("FOO" => "bar")
    expect(env("FOO= #{secret_path}")).to eql("FOO" => "bar")
  end
end
