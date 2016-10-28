require 'block-is-array'

require_relative 'compile'



def xml &block
  XML::from_array block_is_array(&block)
end
