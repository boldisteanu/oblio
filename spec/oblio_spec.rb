# frozen_string_literal: true

RSpec.describe Oblio do
  it "has a version number" do
    expect(Oblio::VERSION).not_to be nil
  end

  it "reads API key from environment variable" do
    expect(ENV['OBLIO_API_KEY']).not_to be nil
  end
end
