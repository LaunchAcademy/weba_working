require 'rails_helper'

describe AudioUploader do
  include CarrierWave::Test::Matchers

  let(:widget) { Widget.new }
  let(:uploader) { AudioUploader.new(widget, :audio) }

  let(:path_to_file) do
    Rails.root.join('spec/fixtures/sample.webm')
  end

  it 'changes the weba to an mp3' do
    uploader.class.enable_processing = true
    File.open(path_to_file) { |f| uploader.store!(f) }

    expect(uploader.file).to_not be_nil
  end

end
