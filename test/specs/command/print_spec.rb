require_relative '../../helper'

describe Sfn::Command::Print do

  it 'should print the template only' do
    instance = Sfn::Command::Print.new(
      Smash.new(
        :ui => ui,
        :base_directory => File.join(File.dirname(__FILE__), 'sparkleformation'),
        :credentials => aws_creds,
        :file => 'lint_valid'
      ),
      []
    )
    instance.execute!
    stream.rewind
    stream.read.must_include 'AWS::S3::Bucket'
  end
end
