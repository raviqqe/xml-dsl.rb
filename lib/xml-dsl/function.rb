require 'block-is-array'

require_relative 'compile'



def xml format: true, &block
  XML::from_array block_is_array(&block), format: format
end
