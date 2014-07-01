# Fix this problem:
#
# https://github.com/svenfuchs/i18n/blob/v0.6.9/lib/i18n/core_ext/hash.rb
# https://github.com/RiotGames/buff-extensions/blob/master/lib/buff/extensions/hash/slice.rb
class Hash
  def slice(*keys)
    keys.map! { |key| convert_key(key) } if respond_to?(:convert_key, true)
    keys.each_with_object(self.class.new) { |k, hash| hash[k] = self[k] if has_key?(k) }
  end
end

require 'berkshelf/vagrant'
